package controller;

import com.google.gson.Gson;
import domain.Discuss;
import domain.Member;
import domain.Topics;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import pageutil.PageNumberMaker;
import pageutil.PaginationCriteria;
import service.DiscussService;
import service.MemberService;
import service.ReplyThService;

import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping(value = "/discuss")
public class DiscussController {

    @Autowired DiscussService discussService;
    @Autowired MemberService memberService;
    @Autowired ReplyThService replyThService;

    @Transactional
    @RequestMapping(value = "/")
    public String overview(HttpSession session, Model model){
        List<Discuss> list = discussService.selectAll();
        int memberTotalCount = memberService.memberTotalCount();
        int topicTotalCount = discussService.topicTotalCount();
        int replythreadTotalCount = replyThService.replyThreadTotalCount();
        List<Member> newsetMember = memberService.newsetMember();
        System.out.println(newsetMember+" New Member");

        if(session.getAttribute("loginResult") != null){
            model.addAttribute("userid" ,((Member)session.getAttribute("loginResult")).getUserid());
        }

        model.addAttribute("lectureList",list);
        model.addAttribute("memberTotalCount",memberTotalCount);
        model.addAttribute("topicTotalCount",topicTotalCount);
        model.addAttribute("replythreadTotalCount",replythreadTotalCount);
        model.addAttribute("newsetMember",newsetMember);

        return "discuss/overview";
    }

    @RequestMapping(value = "/topics", method = RequestMethod.GET)
    public String topics(String lid, String lname, String lcategory, Model model,Integer page, Integer perPage){

        System.out.println("Lid: " + lid);
        System.out.println("Lname: " + lname);
        System.out.println("Lcategory: " + lcategory);

        PaginationCriteria c = null;
        if (page != null && perPage != null) {
            c = new PaginationCriteria(page, perPage);
        } else {
            c = new PaginationCriteria(); // 1, 10
        }
        PageNumberMaker maker = new PageNumberMaker();
        maker.setCriteria(c);
        maker.setTotalCount(discussService.getCountByLid(lid)); // All topics count
        maker.setPageMakerData();

        List<Topics> listtrue = discussService.selectPage(lid, c);

        model.addAttribute("topicList",listtrue);
        model.addAttribute("pageMaker", maker);
        model.addAttribute("lid",lid);
        model.addAttribute("lname",lname);
        model.addAttribute("lcategory",lcategory);

        return "discuss/topics";
    }

    @RequestMapping(value = "/newtopic")
    public String post(String lname, String lcategory, String lid, Model model){

        model.addAttribute("lid",lid);
        model.addAttribute("lname", lname);
        model.addAttribute("lcategory", lcategory);

        System.out.println("Lid: " + lid);
        System.out.println("Lname: " + lname);
        System.out.println("Lcategory: " + lcategory);

        return "discuss/newTopic";
    }

    @Transactional
    @RequestMapping(value = "/post", method = RequestMethod.POST)
    public String post(@ModelAttribute("Topics")Topics topics, HttpSession session, String lid, String lname, String lcategory){

        Member m = (Member)session.getAttribute("loginResult");

        topics.setLecturekey(lid);
        topics.setWriter(m.getUserid());
        topics.setTopicdate(new Date());

        System.out.println(topics.getWriter());
        System.out.println(topics.getTitle());
        System.out.println(topics.getTcontent());

        Gson topicgson = new Gson();
        String json = topicgson.toJson(topics);
        System.out.println(json);

        if(m != null){
            discussService.insertTopic(topics);
            discussService.updateTopicCount(lid);
            memberService.addOnePostNum(m.getUserid());

            String changed = topics.getTitle();
            if(topics.getTitle().length() >= 10){
                changed = topics.getTitle().substring(0, 10)+"..";
            }
            //TODO: Length should be changed

            discussService.updateLast(topics.getWriter(), topics.getTnumber(), changed, lid);
        } else if (m == null){
            try {
                throw new Exception();
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else {
            System.out.println("/discuss/post Error");
        }

        String returnValue = "/discuss/topics?lid="+lid+"&lname="+lname+"&lcategory="+lcategory;
        return "redirect:"+returnValue;
    }

    @RequestMapping(value = "/detail")
    public String detail(int tnumber,String lname,String lid, String lcategory, Model model, HttpSession session){

        System.out.println(tnumber+": tnumber");
        System.out.println(lcategory+": category");
        System.out.println(lname+": lname");
        System.out.println(lid+": lid");

        Topics topic = discussService.selectTopicByTnumber(tnumber);

        Member writer = memberService.select(topic.getWriter());

        int updateViews = discussService.updateViews(tnumber);
        //TODO: 캐시 이용 중복 클릭 카운트 방지

        model.addAttribute("topic",topic);
        model.addAttribute("writer", writer);
        model.addAttribute("lname", lname);
        model.addAttribute("lcategory",lcategory);
        model.addAttribute("lid",lid);
        model.addAttribute("user",(Member)session.getAttribute("loginResult"));

        return "discuss/detail";
    }

    @RequestMapping(value = "/test")
    public String test(){

        List<Discuss> list = discussService.selectAll();
        for (Discuss Discuss :list) {
            System.out.println(Discuss.getLexplain() + Discuss.getLname());
        }

        return "redirect:/";
    }

    @RequestMapping(value = "update")
    public String insert(int tnumber, String lname, String lcategory, String lid, Model model){
        Topics topic = discussService.selectTopicByTnumber(tnumber);

        model.addAttribute("topic", topic);
        model.addAttribute("lid",lid);
        model.addAttribute("lname", lname);
        model.addAttribute("lcategory", lcategory);

        return "/discuss/newTopic";
    }

    @RequestMapping(value = "/updateconfirm")
    public String updateConfirm(@ModelAttribute("Topics")Topics topics, String lid, String lname, String lcategory, int tnumber){
        topics.setTnumber(tnumber);
        discussService.updateTopic(topics);
        String returnValue = "/discuss/topics?lid="+lid+"&lname="+lname+"&lcategory="+lcategory;
        return "redirect:"+returnValue;
    }

    @RequestMapping(value = "/delete")
    public String delete(int tnumber, String lname, String lcategory, String lid){
        discussService.deleteTopic(tnumber);
        String returnValue = "/discuss/topics?lid="+lid+"&lname="+lname+"&lcategory="+lcategory;
        return "redirect:"+returnValue;
    }

    @RequestMapping(value = "/search")
    public String search(String searchType, String searchKeyword, Model model, String lid, String lname, String lcategory,Integer page, Integer perPage) {

        searchKeyword = "%" + searchKeyword + "%";

        PaginationCriteria c = null;
        if (page != null && perPage != null) {
            c = new PaginationCriteria(page, perPage);
        } else {
            c = new PaginationCriteria(); // 1, 10
        }
        PageNumberMaker maker = new PageNumberMaker();
        maker.setCriteria(c);

        maker.setTotalCount(discussService.searchCountTopicsByLid(searchType, searchKeyword, lid));
        maker.setPageMakerData();

        List<Topics> listtrue = discussService.searchedList(searchType, searchKeyword, lid);

        model.addAttribute("topicList",listtrue);
        model.addAttribute("pageMaker", maker);
        model.addAttribute("lid",lid);
        model.addAttribute("lname",lname);
        model.addAttribute("lcategory",lcategory);

        return "discuss/topics";

    }
}
