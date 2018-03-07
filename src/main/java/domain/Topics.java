package domain;

import java.util.Date;

public class Topics{

    private String writer;
    private String title;
    private Date topicdate;
    private String tcontent;
    private String lecturekey;
    private int rlycount;
    private int views;
    private int tnumber;
    private String lastrlyname;
    private Date lastrlydate;

    public Topics(){}
    public Topics(String writer, String title, Date topicdate, String content, String lecturekey) {
        this.writer = writer;
        this.title = title;
        this.topicdate = topicdate;
        this.tcontent = content;
        this.lecturekey = lecturekey;
    }
    public Topics(String writer, String title, Date topicdate, String tcontent, String lecturekey, int rlycount, int views, int tnumber) {
        this.writer = writer;
        this.title = title;
        this.topicdate = topicdate;
        this.tcontent = tcontent;
        this.lecturekey = lecturekey;
        this.rlycount = rlycount;
        this.views = views;
        this.tnumber = tnumber;
    }
    public Topics(String writer, String title, Date topicdate, String tcontent, String lecturekey, int rlycount, int views, int tnumber, String lastrlyname, Date lastrlydate) {
        this.writer = writer;
        this.title = title;
        this.topicdate = topicdate;
        this.tcontent = tcontent;
        this.lecturekey = lecturekey;
        this.rlycount = rlycount;
        this.views = views;
        this.tnumber = tnumber;
        this.lastrlyname = lastrlyname;
        this.lastrlydate = lastrlydate;
    }

    public String getWriter() {
        return writer;
    }
    public String getTitle() {
        return title;
    }
    public Date getTopicdate() {
        return topicdate;
    }
    public String getTcontent() {
        return tcontent;
    }
    public String getLecturekey() {
        return lecturekey;
    }
    public int getRlycount() {
        return rlycount;
    }
    public int getViews() {
        return views;
    }
    public int getTnumber() {
        return tnumber;
    }
    public String getLastrlyname() {
        return lastrlyname;
    }
    public Date getLastrlydate() {
        return lastrlydate;
    }

    public void setWriter(String writer) {
        this.writer = writer;
    }
    public void setTitle(String title) {
        this.title = title;
    }
    public void setTopicdate(Date topicdate) {
        this.topicdate = topicdate;
    }
    public void setTcontent(String content) {
        this.tcontent = content;
    }
    public void setLecturekey(String lecturekey) {
        this.lecturekey = lecturekey;
    }
    public void setRlycount(int rlycount) {
        this.rlycount = rlycount;
    }
    public void setViews(int views) {
        this.views = views;
    }
    public void setTnumber(int tnumber) {
        this.tnumber = tnumber;
    }
    public void setLastrlyname(String lastrlyname) {
        this.lastrlyname = lastrlyname;
    }
    public void setLastrlydate(Date lastrlydate) {
        this.lastrlydate = lastrlydate;
    }
}
