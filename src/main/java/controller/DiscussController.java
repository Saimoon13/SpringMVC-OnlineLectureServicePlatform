package controller;

import domain.Lecture;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import service.LectureService;

import java.util.List;

@Controller
@RequestMapping(value = "/discuss")
public class DiscussController {

    @Autowired LectureService lectureService;

    @RequestMapping(value = "/")
    public String overview(Model model){
        List<Lecture> list = lectureService.selectAll();

        model.addAttribute("lectureList",list);
        for(Lecture lecture: list) {
            System.out.println(lecture.getLid());
        }
        return "discuss/overview";
    }

    @RequestMapping(value = "/topics")
    public String topics(){
        return "discuss/topics";
    }

    // TODO: topic 매개변수 전달
    @RequestMapping(value = "/post")
    public String post(){
        return "discuss/post";
    }

    @RequestMapping(value = "/test")
    public String test(){

        List<Lecture> list = lectureService.selectAll();
        for (Lecture lecture:list) {
            System.out.println(lecture.getLexplain() + lecture.getLname());
        }

        return "redirect:/";
    }

}
