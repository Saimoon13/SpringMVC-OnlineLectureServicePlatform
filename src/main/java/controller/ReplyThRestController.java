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
import service.DiscussService;
import service.ReplyThService;

import javax.servlet.http.HttpSession;
import java.util.List;

import static sun.plugin2.util.PojoUtil.toJson;

@RestController
@RequestMapping(value = "/rplyth")
public class ReplyThRestController {

    @Autowired ReplyThService replyThService;
    @Autowired DiscussService discussService;

    @RequestMapping(value = "/all/{tnumber}", method = RequestMethod.GET)
    public ResponseEntity<List<ReplyThread>> readReplies(@PathVariable(name = "tnumber") int tnumber) {
        List<ReplyThread> list = replyThService.selectByTnumber(tnumber);

        ResponseEntity<List<ReplyThread>> entity = null;
        if (list != null) {
            entity = new ResponseEntity<>(list, HttpStatus.OK);
        } else {
            entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
        }

     return entity;
    }

    @RequestMapping(method = RequestMethod.POST)
    public ResponseEntity<Integer> createReplyThread(@RequestBody ReplyThread r, HttpSession session) {

        Member m = (Member)session.getAttribute("loginResult");

        Gson gson = new GsonBuilder().setDateFormat("yy/MM/dd HH:mm:ss").create();
        String member = gson.toJson(m);
        r.setMember(member);

        System.out.println(r.getTitle() + ", " + r.getRcontent() + ", " + r.getTnumber() + ", " + member);

        int resultinsert = replyThService.replyInsert(r);
        int resultcount = replyThService.replyCount(r);
        int resultlastupdate = replyThService.updateLastRly(m.getUserid(), r.getTnumber());
        int resultupdaterlycount = replyThService.updateRlyCount(r.getTnumber());

        ResponseEntity<Integer> entity = null;
        if (resultinsert == 1) {
            entity = new ResponseEntity<Integer>(1, HttpStatus.CREATED);
        } else {
            entity= new ResponseEntity<Integer>(0, HttpStatus.BAD_REQUEST);
        }

        System.out.println(entity);

        return entity;
    } // end createReply

    @RequestMapping(value = "/{replynumber}", method = RequestMethod.PUT)
    public ResponseEntity<String> updateReply(@PathVariable(name = "replynumber") int replynumber, @RequestBody ReplyThread r) {

        r.setReplynumber(replynumber);
        int result = replyThService.replyUpdate(r);

        ResponseEntity<String> entity = null;
        if (result == 1) {
            entity = new ResponseEntity<>("success", HttpStatus.OK);
        } else {
            entity = new ResponseEntity<>("fail", HttpStatus.BAD_REQUEST);
        }

        return entity;
    } // end updateReply()

    @RequestMapping(value = "/{replynumber}", method = RequestMethod.DELETE)
    public ResponseEntity<String> deleteReply(@PathVariable(name = "replynumber") int replynumber) {

        int resultCountOUT = replyThService.replyCountOUT(replynumber);
        int resultDelete = replyThService.replyDelete(replynumber);

        ResponseEntity<String> entity = null;
        if (resultDelete == 1) {
            entity = new ResponseEntity<>("success", HttpStatus.OK);
        } else {
            entity = new ResponseEntity<>("fail", HttpStatus.BAD_REQUEST);
        }
        return entity;
    }
}
