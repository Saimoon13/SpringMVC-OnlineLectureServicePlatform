package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {

    @RequestMapping(value = "/")
    public String test(){
        return "index";
    }

    @RequestMapping(value = "/loginForm")
    public String loginForm(){
        return "member/loginFail";
    }

    @RequestMapping(value = "/loginForm2")
    public String loginForm2(){
        return "member/loginFail2";
    }




}