package controller;

import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.google.gson.JsonParser;
import domain.Lecture;
import domain.Member;
import domain.Topics;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import pageutil.PageNumberMaker;
import pageutil.PaginationCriteria;
import service.DiscussService;
import service.MemberService;

import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping(value = "/discuss")
public class DiscussController {

    @Autowired DiscussService discussService;
    @Autowired MemberService memberService;

    @RequestMapping(value = "/")
    public String overview(Model model){
        List<Lecture> list = discussService.selectAll();

        Gson gson = new Gson();

        model.addAttribute("lectureList",list);

        return "discuss/overview";
    }

    @RequestMapping(value = "/topics", method = RequestMethod.GET)
    public String topics(String lid, String lname, String lcategory, Model model,Integer page, Integer perPage){

        System.out.println(lid);
        System.out.println(lname);
        System.out.println(lcategory);

        PaginationCriteria c = null;
        if (page != null && perPage != null) {
            c = new PaginationCriteria(page, perPage);
        } else {
            c = new PaginationCriteria(); // 1, 10
        }
        PageNumberMaker maker = new PageNumberMaker();
        maker.setCriteria(c);
        maker.setTotalCount(discussService.getCountByLid(lid)); // 전체 게시글 수
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

        System.out.println(lid);
        model.addAttribute("lid",lid);
        model.addAttribute("lname", lname);
        model.addAttribute("lcategory", lcategory);

        System.out.println(lid);
        System.out.println(lname);
        System.out.println(lcategory);

        return "discuss/newTopic";
    }

    @RequestMapping(value = "/post", method = RequestMethod.POST)
    public String post(@ModelAttribute("Topics")Topics topics, HttpSession session, String lid, String lname, String lcategory){

        Member m = (Member)session.getAttribute("loginResult");
        System.out.println(topics.getLecturekey()+" 전");

        topics.setLecturekey(lid);
        topics.setWriter(m.getUserid());
        topics.setTopicdate(new Date());

        System.out.println(topics.getWriter());
        System.out.println(topics.getTitle());
        System.out.println(topics.getLecturekey()+ " 후");
        System.out.println(topics.getTcontent());
        System.out.println(lid+ " 수정 후");

        Gson topicgson = new Gson();
        String json = topicgson.toJson(topics);
        System.out.println(json);

        if(m != null){
            discussService.insertTopic(topics);
            memberService.addOnePostNum(m.getUserid());

            String changed = topics.getTitle();
            if(topics.getTitle().length() >= 15){
                changed = topics.getTitle().substring(0, 15)+"..";
            }
            //TODO: subString은 영어만 된다.. 길이제한 수정해야함
            System.out.println(changed);
            discussService.updateLast(topics.getWriter(), topics.getTnumber(), changed, lid);
        } else if (m == null){
            try {
                throw new Exception();
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else {
            System.out.println("/discuss/post 에러");
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

        List<Lecture> list = discussService.selectAll();
        for (Lecture lecture:list) {
            System.out.println(lecture.getLexplain() + lecture.getLname());
        }

        return "redirect:/";
    }

    @RequestMapping(value = "lid")
    public String insert(){



        return "/";
    }

}
