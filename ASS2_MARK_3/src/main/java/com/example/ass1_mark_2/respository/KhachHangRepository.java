package com.example.ass1_mark_2.respository;

import com.example.ass1_mark_2.entity.model.KhachHang;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.Optional;
@Repository
public interface KhachHangRepository extends CrudRepository<KhachHang,Integer>, PagingAndSortingRepository<KhachHang,Integer> {
    @Query("select kh from KhachHang kh where kh.sdt = :sdtCheck")
    Optional<KhachHang> getKHBySDT(@Param("sdtCheck") String sdt);
    @Query("select kh from KhachHang kh where kh.hoTen like %:ten%")
    ArrayList<KhachHang> getKHByName(@Param("ten") String ten);
    Page<KhachHang> findByHoTenIsContainingIgnoreCase(String ten, Pageable pageable);
}
