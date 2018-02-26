package domain;

public class Lecture {

    String lid;
    String lname;
    String lnum;
    String lcategory;
    String lexplain;
    String lecturer;

    public Lecture() {}

    public Lecture(String lid, String lname, String lnum, String lcategory, String lexplain, String lecturer) {
        this.lid = lid;
        this.lname = lname;
        this.lnum = lnum;
        this.lcategory = lcategory;
        this.lexplain = lexplain;
        this.lecturer = lecturer;
    }

    public String getLid() {
        return lid;
    }

    public String getLname() {
        return lname;
    }

    public String getLnum() {
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
