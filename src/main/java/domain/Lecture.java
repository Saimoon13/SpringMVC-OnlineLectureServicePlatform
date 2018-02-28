package domain;

public class Lecture {

    String lid;
    String lname;
    int lnum;
    String lcategory;
    String lexplain;
    String lecturer;
    int tnum;

    public Lecture() {}
    public Lecture(String lid, String lname, int lnum, String lcategory, String lexplain, String lecturer) {
        this.lid = lid;
        this.lname = lname;
        this.lnum = lnum;
        this.lcategory = lcategory;
        this.lexplain = lexplain;
        this.lecturer = lecturer;
    }
    public Lecture(String lid, String lname, int lnum, String lcategory, String lexplain, String lecturer, int tnum) {
        this.lid = lid;
        this.lname = lname;
        this.lnum = lnum;
        this.lcategory = lcategory;
        this.lexplain = lexplain;
        this.lecturer = lecturer;
        this.tnum = tnum;
    }

    public String getLid() {
        return lid;
    }

    public String getLname() {
        return lname;
    }

    public int getLnum() {
        return lnum;
    }

    public String getLcategory() {
        return lcategory;
    }

    public String getLexplain() {
        return lexplain;
    }

    public String getLecturer() {
        return lecturer;
    }
}
