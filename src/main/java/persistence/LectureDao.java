package persistence;

import domain.Lecture;

import java.util.List;

public interface LectureDao {

    List<Lecture> selectAll();
}
