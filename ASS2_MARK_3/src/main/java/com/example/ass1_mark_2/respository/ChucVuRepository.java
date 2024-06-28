package com.example.ass1_mark_2.respository;

import com.example.ass1_mark_2.entity.model.ChucVu;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;

@Repository
public interface ChucVuRepository extends CrudRepository<ChucVu,Integer>, PagingAndSortingRepository<ChucVu,Integer> {
    //cach moi hoc
    Page<ChucVu> findByTenChucVuContainingIgnoreCase(String tenCV, Pageable pageable);
    ArrayList<ChucVu> findByTenChucVuContainingIgnoreCase(String tenCV);
    //cach hay dung
    @Query("select cv from ChucVu cv where cv.tenChucVu like %:tenTim%")
    ArrayList<ChucVu> getAllChucVuByName(@Param("tenTim") String ten);
}
