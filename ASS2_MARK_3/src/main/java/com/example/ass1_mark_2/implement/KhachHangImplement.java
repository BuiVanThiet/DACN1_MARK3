package com.example.ass1_mark_2.implement;

import com.example.ass1_mark_2.entity.model.KhachHang;
import com.example.ass1_mark_2.respository.KhachHangRepository;
import com.example.ass1_mark_2.service.KhachHangService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Optional;

@Service
public class KhachHangImplement implements KhachHangService {
    @Autowired
    KhachHangRepository qlkh;

    @Override
    public KhachHang save(KhachHang entity) {
        return qlkh.save(entity);
    }

    @Override
    public ArrayList<KhachHang> saveAll(ArrayList<KhachHang> entities) {
        return (ArrayList<KhachHang>) qlkh.saveAll(entities);
    }

    @Override
    public Optional<KhachHang> findById(Integer integer) {
        return qlkh.findById(integer);
    }

    @Override
    public boolean existsById(Integer integer) {
        return qlkh.existsById(integer);
    }

    @Override
    public ArrayList<KhachHang> findAll() {
        return (ArrayList<KhachHang>) qlkh.findAll();
    }

    @Override
    public ArrayList<KhachHang> findAllById(ArrayList<Integer> integers) {
        return (ArrayList<KhachHang>) qlkh.findAllById(integers);
    }

    @Override
    public long count() {
        return qlkh.count();
    }

    @Override
    public void deleteById(Integer integer) {
        qlkh.deleteById(integer);
    }

    @Override
    public void delete(KhachHang entity) {
        qlkh.delete(entity);
    }

    @Override
    public void deleteAllById(ArrayList<Integer> integers) {
        qlkh.deleteAllById(integers);
    }

    @Override
    public void deleteAll(ArrayList<KhachHang> entities) {
        qlkh.deleteAll(entities);
    }

    @Override
    public void deleteAll() {
        qlkh.deleteAll();
    }

    @Override
    public Optional<KhachHang> getKHBySDT(String sdt){
        return qlkh.getKHBySDT(sdt);
    }
    @Override
    public ArrayList<KhachHang> getKHByName(String ten){
        return qlkh.getKHByName(ten);
    }
    @Override
    public Page<KhachHang> getPhanTrang(int page, int pageSize,String ten){
        Pageable pageable = PageRequest.of(page,pageSize);
        if(ten.isEmpty() || ten == null){
            return this.qlkh.findAll(pageable);
        }else {
            return this.qlkh.findByHoTenIsContainingIgnoreCase(ten,pageable);
        }
    }
}
