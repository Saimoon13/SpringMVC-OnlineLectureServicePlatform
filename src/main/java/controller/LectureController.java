package controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping(value= "/lecture")
public class LectureController {

    @RequestMapping(value = "/")
    public String preview(Model model){
        return "lecture/preview";
    }

    @RequestMapping(value = "/detail")
    public String detail(){
        return "lecture/lecture";
    }



}
