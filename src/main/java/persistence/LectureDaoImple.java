package persistence;

import domain.Lecture;
import mappers.LectureMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class LectureDaoImple implements LectureDao{

    @Autowired private LectureMapper mapper;

    @Override
    public List<Lecture> selectAll() {
        return mapper.selectAll();
    }

}
