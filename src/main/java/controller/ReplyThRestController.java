package controller;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonObject;
import domain.Member;
import domain.ReplyThread;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import service.ReplyThService;

import javax.servlet.http.HttpSession;
import java.util.List;

import static sun.plugin2.util.PojoUtil.toJson;

@RestController
@RequestMapping(value = "/rplyth")
public class ReplyThRestController {

    @Autowired ReplyThService replyThService;

    @RequestMapping(value = "/all/{tnumber}", method = RequestMethod.GET)
    public ResponseEntity<List<ReplyThread>> readReplies(@PathVariable(name = "tnumber") int tnumber) {

        List<ReplyThread> list = replyThService.selectByTnumber(tnumber);

//        for(ReplyThread replyThread:list){
//            replyThread.getMember();
//        }

        ResponseEntity<List<ReplyThread>> entity = null;
        if (list != null) {
            entity = new ResponseEntity<>(list, HttpStatus.OK);
        } else {
            entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
        }

        System.out.println(entity);

     return entity;
    }

    @RequestMapping(method = RequestMethod.POST)
    public ResponseEntity<Integer> createReplyThread(@RequestBody ReplyThread r, HttpSession session) {

        Member m = (Member)session.getAttribute("loginResult");

        Gson gson = new GsonBuilder().setDateFormat("yy/MM/dd HH:mm:ss").create();
        String member = gson.toJson(m);
        r.setMember(member);

        System.out.println(r.getTitle() + ", " + r.getRcontent() + ", " + r.getTnumber() + ", " + member);

        int result = replyThService.replyInsert(r);

        ResponseEntity<Integer> entity = null;
        if (result == 1) {
            entity = new ResponseEntity<Integer>(1, HttpStatus.CREATED);
        } else {
            entity = new ResponseEntity<Integer>(0, HttpStatus.BAD_REQUEST);
        }

        System.out.println(entity);

        return entity;
    } // end createReply
}
