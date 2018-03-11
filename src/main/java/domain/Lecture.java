package domain;

public class Lecture {

    String lid;
    String lname;
    String lcategory;
    String lecturer;
    String adress;
    String subname;
    int lindex;

    public Lecture(){}
    public Lecture(String lid, String lname, String lcategory, String lecturer, String adress, String subname, int lindex) {
        this.lid = lid;
        this.lname = lname;
        this.lcategory = lcategory;
        this.lecturer = lecturer;
        this.adress = adress;
        this.subname = subname;
        this.lindex = lindex;
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
}
