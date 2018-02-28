package controller;

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
import java.util.List;

@Controller
@RequestMapping(value = "/discuss")
public class DiscussController {

    @Autowired DiscussService discussService;
    @Autowired MemberService memberService;

    @RequestMapping(value = "/")
    public String overview(Model model){
        List<Lecture> list = discussService.selectAll();

        model.addAttribute("lectureList",list);
        for(Lecture lecture: list) {
            System.out.println(lecture.getLid());
        }
        return "discuss/overview";
    }

    @RequestMapping(value = "/topics", method = RequestMethod.GET)
    public String topics(String lid, Model model,Integer page, Integer perPage){

        System.out.println(lid);

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

        return "discuss/topics";
    }

    @RequestMapping(value = "/newtopic")
    public String post(String lid, Model model){

        System.out.println(lid);
        model.addAttribute("lid",lid);

        return "discuss/newTopic";
    }

    @RequestMapping(value = "/post")
    public String post(@ModelAttribute("Topics")Topics topics, HttpSession session, String lid){

        Member m = (Member)session.getAttribute("loginResult");
        System.out.println(topics.getLecturekey()+" 전");

        topics.setLecturekey(lid);
        topics.setWriter(m.getUserid());

        System.out.println(topics.getWriter());
        System.out.println(topics.getTitle());
        System.out.println(topics.getLecturekey()+ " 후");
        System.out.println(topics.getTcontent());
        System.out.println(lid+ " 수정 후");

        if(m != null){
            discussService.insertTopic(topics);
            memberService.addOnePostNum(m.getUserid());
        } else if (m == null){
            try {
                throw new Exception();
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else {
            System.out.println("/discuss/post 에러");
        }

        String returnValue = "/discuss/topics?lid="+lid;
        return "redirect:"+returnValue;
    }

    @RequestMapping(value = "/detail")
    public String detail(int tnumber, Model model){

        System.out.println(tnumber+":번 tnumber");

        Topics topic = discussService.selectTopicByTnumber(tnumber);

        Member writer = memberService.select(topic.getWriter());

        model.addAttribute("topic",topic);
        model.addAttribute("writer", writer);

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
