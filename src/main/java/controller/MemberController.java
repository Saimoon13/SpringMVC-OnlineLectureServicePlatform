package controller;

import domain.Member;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import service.MemberService;

@Controller
public class MemberController {

    private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

    @Autowired
    private MemberService service;

    @RequestMapping(value="/signup", method= RequestMethod.POST)
    private String memberRegister(@ModelAttribute("Member")Member m) {

        logger.info("signup POST 호출");
        logger.info("--- userID: " + m.getUserid());
        logger.info("--- userPasswordt: " + m.getPassword());
        logger.info("--- userEmail: " + m.getEmail());
        System.out.println(m.getUserid());

        service.insert(m);
        return "index";
    }//end MemberRegister
}
