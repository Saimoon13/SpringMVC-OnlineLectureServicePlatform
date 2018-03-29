package controller;

import com.sun.istack.internal.Nullable;
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

    @RequestMapping(value = "")
    public String preview(Model model, @Nullable String index){
        List<Lecture> list = lectureService.selectLecturePreviewlist();
        model.addAttribute(list);
        if(index != null){
            model.addAttribute("index", index);
        }

        System.out.println("index: " + index);

        return "lecture/preview";
    }

    @RequestMapping(value = "/detail")
    public String detail(HttpSession session, Model model, String lid) {
        String userid = ((Member)session.getAttribute("loginResult")).getUserid();
        Payment payment = lectureService.selectPaymentByLid(lid);

        Date date = new Date(); // real time
        int temp = 0;
        if(payment != null) {
            temp = date.compareTo(payment.getExpiredate());
        }

        List<Lecture> lectureList = new ArrayList<>();

        if(temp < 0 && payment != null){
            lectureList.addAll(lectureService.selectLectureBylId(payment.getLid()));
            model.addAttribute("lectureList",lectureList);
            return "lecture/lecture";
        } else {
            return "member/nonAuth";
        }
    }
}
