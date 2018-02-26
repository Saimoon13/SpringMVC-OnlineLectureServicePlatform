package mappers;

import domain.Lecture;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface LectureMapper {

    String SQL_GETALL =
            "SELECT * FROM LECTURE";

    @Select(SQL_GETALL)
    List<Lecture> selectAll();

}
