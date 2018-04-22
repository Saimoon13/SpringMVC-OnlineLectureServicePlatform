package service;

import domain.Lecture;
import domain.Payment;

import java.util.List;

public interface LectureService {

    int insertPayment(Payment payment);
    Payment selectPaymentByLid(String lid, String userid);
    List<Payment> selectPaymentById(String userid);
    List<Lecture> selectLectureBylId(String lid);
    List<Lecture> selectLecturePreviewlist();
}
