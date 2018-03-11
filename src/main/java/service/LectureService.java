package service;

import domain.Lecture;
import domain.Payment;

import java.util.List;

public interface LectureService {

    int insertPayment(Payment payment);
    int selectLectureDetail(int lid);
    List<Payment> selectPaymentById(String userid);
    List<Lecture> selectLectureBylId(String lid);
}
