package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/discuss")
public class DiscussController {

    @RequestMapping(value = "/")
    public String overview(){
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
}
