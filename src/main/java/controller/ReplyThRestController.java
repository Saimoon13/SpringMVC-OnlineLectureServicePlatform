package controller;

import domain.Reply;
import domain.ReplyThread;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import service.ReplyThService;

import java.util.List;

@RestController
@RequestMapping(value = "/rplyth")
public class ReplyThRestController {

    @Autowired ReplyThService replyThService;

    @RequestMapping(value = "/all/{tnumber}", method = RequestMethod.GET)
    public ResponseEntity<List<ReplyThread>> readReplies(@PathVariable(name = "tnumber") int tnumber) {

        List<ReplyThread> list = replyThService.selectByTnumber(tnumber);

        for(ReplyThread replyThread:list){
            replyThread.getMember();
        }

        ResponseEntity<List<ReplyThread>> entity = null;
        if (list != null) {
            entity = new ResponseEntity<>(list, HttpStatus.OK);
        } else {
            entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
        }

        System.out.println(entity);

     return entity;
    }
}
