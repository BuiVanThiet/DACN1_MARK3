package com.example.ass1_mark_2.service;

import com.example.ass1_mark_2.entity.model.HDCT;
import com.example.ass1_mark_2.entity.sumMoney.TotalAmount;
import org.springframework.data.domain.Page;

import java.util.ArrayList;
import java.util.Optional;

public interface HDCTService {
    HDCT save(HDCT entity);

    ArrayList<HDCT> saveAll(ArrayList<HDCT> entities);

    Optional<HDCT> findById(Integer integer);

    boolean existsById(Integer integer);

    ArrayList<HDCT> findAll();

    ArrayList<HDCT>findAllById(ArrayList<Integer> integers);

    long count();

    void deleteById(Integer integer);

    void delete(HDCT entity);

    void deleteAllById(ArrayList<Integer> integers);

    void deleteAll(ArrayList<HDCT> entities);

    void deleteAll();

    ArrayList<TotalAmount> getTien();

    Page<HDCT> getHDCTByIdHD_Page(Integer id,int page,int pageSize);
    ArrayList<HDCT> getHDCTByIdHD(Integer id);


    Optional<TotalAmount> getSumMoneyById(Integer id);
}
