package controller;

import domain.Member;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import service.MemberService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class MemberController {

    private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

    @Autowired
    private MemberService service;

    @RequestMapping(value="/signup", method= RequestMethod.POST)
    private String memberRegister(@ModelAttribute("Member")Member m, HttpServletRequest request) {
        String returnURL = request.getHeader("referer").replace("http://localhost:8282","");
        service.insert(m);
        return "redirect:"+returnURL;
    }

    @RequestMapping(value="/login", method = RequestMethod.POST)
    public String memberLogin(@ModelAttribute("Member")Member m, HttpSession session, HttpServletRequest request){
        String returnURL = request.getHeader("referer").replace("http://localhost:8282","");
        Member result = service.login(m);

        if(result != null){
            session.setAttribute("loginResult",result);
            return "redirect:"+returnURL;
        } else {
            return "member/loginFail";
        }
    }

    @RequestMapping(value="/logout", method=RequestMethod.GET)
    private String memberLogout(HttpSession session, HttpServletRequest request) {
        String returnURL = request.getHeader("referer").replace("http://localhost:8282","");
        session.invalidate();
        return "redirect:"+returnURL;
    }//end memberLogout
}
