package com.example.ass1_mark_2.respository;

import com.example.ass1_mark_2.entity.model.DanhMuc;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;

@Repository
public interface DanhMucRepository extends CrudRepository<DanhMuc,Integer>, PagingAndSortingRepository<DanhMuc,Integer> {
    Page<DanhMuc> findByTenDanhMucIsContainingIgnoreCase(Pageable pageable,String ten);
    @Query("select dm from DanhMuc dm where dm.tenDanhMuc like %:tenTim%")
    ArrayList<DanhMuc> getDanhMucByName(@Param("tenTim")String ten);
}
