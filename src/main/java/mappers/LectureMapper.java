package mappers;

import domain.Lecture;
import domain.Payment;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface LectureMapper {

    String SQL_INSERT_PAYMENT =
            "INSERT INTO payment(userid, lid, signdate, expiredate) VALUES(#{userid}, #{lid}, sysdate, sysdate + 30)";
    String SQL_SELECT_PAYMENT_BY_LID =
            "SELECT * FROM payment WHERE lid = #{lid} and userid = #{userid}";
    String SQL_SELECT_PAYMENT_BY_ID =
            "SELECT * FROM payment WHERE userid = #{userid}";
    String SQL_SELECT_LECTURE_BY_lID =
            "SELECT * FROM Lecture WHERE lid = #{lid} order by lindex";
    String SQL_SELECT_LECTURE_PREVIEWLIST =
            "SELECT lid, lname, lecturer, lcategory, imagepath, lexplain FROM lecture WHERE lindex = 1";

    @Insert(SQL_INSERT_PAYMENT)
    int insertPayment(Payment payment);

    @Select(SQL_SELECT_PAYMENT_BY_LID)
    Payment selectPaymentByLid(@Param("lid") String lid,  @Param("userid")String userid);

    @Select(SQL_SELECT_PAYMENT_BY_ID)
    List<Payment> selectPaymentById(String userid);

    @Select(SQL_SELECT_LECTURE_BY_lID)
    List<Lecture> selectLectureBylId(String lid);

    @Select(SQL_SELECT_LECTURE_PREVIEWLIST)
    List<Lecture> selectLecturePreviewlist();
}
