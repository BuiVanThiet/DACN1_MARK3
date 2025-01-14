package com.example.ass1_mark_2.respository;

import com.example.ass1_mark_2.entity.model.Size;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;

@Repository
public interface SizeRepository extends CrudRepository<Size, Integer>, PagingAndSortingRepository<Size,Integer> {
    @Query("select s from Size s where s.ten like %:ten%")
    ArrayList<Size> getSizeByName(@Param("ten") String ten);
    Page<Size> findByTenContainsIgnoreCase(String ten, Pageable pageable);
}
