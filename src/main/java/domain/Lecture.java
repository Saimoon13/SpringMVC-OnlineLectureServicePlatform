package domain;

public class Lecture {

    private String lid;
    private String lname;
    private String lcategory;
    private String lecturer;
    private String adress;
    private String subname;
    private int lindex;
    private String lexpain;

    public Lecture(){}
    public Lecture(String lid, String lname, String lcategory, String lecturer, String adress, String subname, int lindex, String lexpain) {
        this.lid = lid;
        this.lname = lname;
        this.lcategory = lcategory;
        this.lecturer = lecturer;
        this.adress = adress;
        this.subname = subname;
        this.lindex = lindex;
        this.lexpain = lexpain;
    }

    public String getLid() {
        return lid;
    }
    public String getLname() {
        return lname;
    }
    public String getLcategory() {
        return lcategory;
    }
    public String getLecturer() {
        return lecturer;
    }
    public String getAdress() {
        return adress;
    }
    public String getSubname() {
        return subname;
    }
    public int getLindex() {
        return lindex;
    }
    public String getLexpain() {
        return lexpain;
    }

    public void setLid(String lid) {
        this.lid = lid;
    }
    public void setLname(String lname) {
        this.lname = lname;
    }
    public void setLcategory(String lcategory) {
        this.lcategory = lcategory;
    }
    public void setLecturer(String lecturer) {
        this.lecturer = lecturer;
    }
    public void setAdress(String adress) {
        this.adress = adress;
    }
    public void setSubname(String subname) {
        this.subname = subname;
    }
    public void setLindex(int lindex) {
        this.lindex = lindex;
    }
    public void setLexpain(String lexpain) {
        this.lexpain = lexpain;
    }
}
