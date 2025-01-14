package com.example.ass1_mark_2.respository;

import com.example.ass1_mark_2.entity.model.MauSac;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;

@Repository
public interface MauSacRepository extends CrudRepository<MauSac,Integer>, PagingAndSortingRepository<MauSac,Integer> {
    @Query("select  ms from MauSac ms where ms.tenMau like %:ten%")
    ArrayList<MauSac> getMSByName(@Param("ten")String ten);
    Page<MauSac> findByTenMauContainsIgnoreCase(Pageable pageable,String ten);
}
