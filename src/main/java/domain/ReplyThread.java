package domain;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.util.Date;

public class ReplyThread {

    private String writer;
    private String title;
    private String rcontent;
    int tnumber;
    int replynumber;
    private String member;

    @JsonFormat(pattern="yy/MM/dd HH:mm:ss")
    private Date replydate;

    public ReplyThread(){}

    public ReplyThread(String writer, String title, String rcontent, int tnumber, int replynumber, String member, Date replydate) {
        this.writer = writer;
        this.title = title;
        this.rcontent = rcontent;
        this.tnumber = tnumber;
        this.replynumber = replynumber;
        this.member = member;
        this.replydate = replydate;
    }

    public String getWriter() {
        return writer;
    }
    public String getTitle() {
        return title;
    }
    public Date getReplydate() {
        return replydate;
    }
    public String getRcontent() {
        return rcontent;
    }
    public int getTnumber() {
        return tnumber;
    }
    public int getReplynumber() {
        return replynumber;
    }
    public String getMember() {
        return member;
    }

    public void setWriter(String writer) {
        this.writer = writer;
    }
    public void setTitle(String title) {
        this.title = title;
    }
    public void setReplydate(Date replydate) {
        this.replydate = replydate;
    }
    public void setRcontent(String rcontent) {
        this.rcontent = rcontent;
    }
    public void setTnumber(int tnumber) {
        this.tnumber = tnumber;
    }
    public void setReplynumber(int replynumber) {
        this.replynumber = replynumber;
    }
    public void setMember(String member) {
        this.member = member;
    }
}
