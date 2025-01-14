package com.example.ass1_mark_2.service;

import com.example.ass1_mark_2.entity.model.KhachHang;
import org.springframework.data.domain.Page;

import java.util.ArrayList;
import java.util.Optional;

public interface KhachHangService {
    KhachHang save(KhachHang entity);

    ArrayList<KhachHang> saveAll(ArrayList<KhachHang> entities);

    Optional<KhachHang> findById(Integer integer);

    boolean existsById(Integer integer);

    ArrayList<KhachHang> findAll();

    ArrayList<KhachHang> findAllById(ArrayList<Integer> integers);

    long count();

    void deleteById(Integer integer);

    void delete(KhachHang entity);

    void deleteAllById(ArrayList<Integer> integers);

    void deleteAll(ArrayList<KhachHang> entities);

    void deleteAll();

    Optional<KhachHang> getKHBySDT(String sdt);

    ArrayList<KhachHang> getKHByName(String ten);

    Page<KhachHang> getPhanTrang(int page, int pageSize, String ten);
}
