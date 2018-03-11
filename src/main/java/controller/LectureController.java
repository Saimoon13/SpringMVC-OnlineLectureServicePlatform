package controller;

import domain.Lecture;
import domain.Member;
import domain.Payment;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import service.LectureService;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping(value= "/lecture")
public class LectureController {

    @Autowired private LectureService lectureService;

    @RequestMapping(value = "/")
    public String preview(Model model){
        return "lecture/preview";
    }

    @RequestMapping(value = "/detail")
    public String detail(HttpSession session, Model model){

        String userid = ((Member)session.getAttribute("loginResult")).getUserid();

        List<Payment> list = lectureService.selectPaymentById(userid);

        List<Payment> listfiltered = new ArrayList<>();
        Date date = new Date();
        int temp = 0;

        // filter
        for(Payment payment: list){
            temp = date.compareTo(payment.getExpiredate());
            if(temp < 0){
                listfiltered.add(payment);
            }
        }

        // getLecture
        List<Lecture> lectureList = new ArrayList<>();
        for(Payment payment: listfiltered){
            lectureList.addAll(lectureService.selectLectureBylId(payment.getLid()));
        }

        model.addAttribute("lectureList",lectureList);

        return "lecture/lecture";
    }



}
