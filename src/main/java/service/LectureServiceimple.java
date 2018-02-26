package service;

import domain.Lecture;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import persistence.LectureDao;

import java.util.List;

@Service
public class LectureServiceimple implements LectureService {

    @Autowired private LectureDao lectureDao;

    @Override
    public List<Lecture> selectAll() {
        return lectureDao.selectAll();
    }

}
