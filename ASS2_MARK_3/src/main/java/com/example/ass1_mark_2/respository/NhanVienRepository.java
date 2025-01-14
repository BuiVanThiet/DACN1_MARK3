package com.example.ass1_mark_2.respository;

import com.example.ass1_mark_2.entity.model.NhanVien;
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
public interface NhanVienRepository extends CrudRepository<NhanVien,Integer>, PagingAndSortingRepository<NhanVien,Integer> {
    @Query("select nv from NhanVien nv where nv.sdt = :sdtCheck")
    Optional<NhanVien> getNVBySDT(@Param("sdtCheck") String sdt);
    @Query("select nv from NhanVien nv where nv.hoTen like %:ten%")
    ArrayList<NhanVien> getNVBYName(@Param("ten") String ten);
    Page<NhanVien> findByHoTenIsContainingIgnoreCase(Pageable pageable,String ten);
}
