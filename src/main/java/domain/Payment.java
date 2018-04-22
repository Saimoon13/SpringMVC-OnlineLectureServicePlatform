package domain;

import java.util.Date;

public class Payment {

    private String userid;
    private String lid;
    private Date signdate;
    private Date expiredate;

    public Payment(){}
    public Payment(String userid, String lid, Date signdate, Date expiredate) {
        this.userid = userid;
        this.lid = lid;
        this.signdate = signdate;
        this.expiredate = expiredate;
    }

    public String getUserid() {
        return userid;
    }
    public String getLid() {
        return lid;
    }
    public Date getSigndate() {
        return signdate;
    }
    public Date getExpiredate() {
        return expiredate;
    }

    public void setUserid(String userid) {
        this.userid = userid;
    }
    public void setLid(String lid) {
        this.lid = lid;
    }
    public void setSigndate(Date signdate) {
        this.signdate = signdate;
    }
    public void setExpiredate(Date expiredate) {
        this.expiredate = expiredate;
    }
}
