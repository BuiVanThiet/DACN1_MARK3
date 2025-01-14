package com.example.ass1_mark_2.service;

import com.example.ass1_mark_2.entity.model.ChucVu;
import org.springframework.data.domain.Page;

import java.util.ArrayList;
import java.util.Optional;

public interface ChucVuService {
    ChucVu save(ChucVu entity);

    ArrayList<ChucVu> saveAll(ArrayList<ChucVu> entities);

    Optional<ChucVu> findById(Integer integer);

    boolean existsById(Integer integer);

    ArrayList<ChucVu>  findAll();

    ArrayList<ChucVu>  findAllById(ArrayList<Integer> integers);

    long count();

    void deleteById(Integer integer);

    void delete(ChucVu entity);

    void deleteAllById(ArrayList<Integer> integers);

    void deleteAll(ArrayList<ChucVu> entities);

    void deleteAll();

    ArrayList<ChucVu> getCVByName(String tenCV);

    Page<ChucVu> getPhanTrang(int page, int pageSize, String tenCV);
}
