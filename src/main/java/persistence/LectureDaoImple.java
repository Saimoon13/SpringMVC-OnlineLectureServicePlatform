package persistence;

import domain.Lecture;
import domain.Payment;
import mappers.LectureMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class LectureDaoImple implements LectureDao {

    @Autowired
    private LectureMapper mapper;

    @Override
    public int insertPayment(Payment payment) {
        return mapper.insertPayment(payment);
    }

    @Override
    public Payment selectPaymentByLid(String lid) {
        return mapper.selectPaymentByLid(lid);
    }

    @Override
    public List<Payment> selectPaymentById(String userid) {
        return mapper.selectPaymentById(userid);
    }

    @Override
    public List<Lecture> selectLectureBylId(String lid) {
        return mapper.selectLectureBylId(lid);
    }
}
