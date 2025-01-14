package com.example.ass1_mark_2.respository;

import com.example.ass1_mark_2.entity.model.CTSP;
import com.example.ass1_mark_2.entity.statistical.Statistical;
import org.springframework.data.domain.Page;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;

@Repository
public interface CtspRepository extends CrudRepository<CTSP,Integer>, PagingAndSortingRepository<CTSP,Integer> {
    @Query("select ctsp from CTSP ctsp WHERE ctsp.sanPham.id = :idCheck")
    Iterable<CTSP> getAll(@Param("idCheck") Integer idSP);
    @Query("SELECT new com.example.ass1_mark_2.entity.statistical.Statistical(sp.tenSanPham, SUM(ct.soLuongTon)) FROM CTSP ct INNER JOIN ct.sanPham sp GROUP BY sp.tenSanPham")
    Iterable<Statistical> getAllProductAndQuantity();
    @Query("select ctsp from  CTSP ctsp where ctsp.trangThai = 'Hoat dong' and ctsp.soLuongTon > 0")
    Iterable<CTSP> getCTSPExist();

    @Query("SELECT ctsp FROM CTSP ctsp WHERE ctsp.sanPham.id = :idSP AND (:idMS IS NULL OR ctsp.mauSac.id = :idMS) AND (:idS IS NULL OR ctsp.size.id = :idS)")
    ArrayList<CTSP> getCTSPByIdSP_IdMS_IdS(@Param("idSP") Integer idSP, @Param("idMS") Integer idMS, @Param("idS") Integer idS);
    @Query("SELECT ctsp FROM CTSP ctsp WHERE ctsp.sanPham.tenSanPham like %:ten% AND (:idMS IS NULL OR ctsp.mauSac.id = :idMS) AND (:idS IS NULL OR ctsp.size.id = :idS)")
    ArrayList<CTSP> getCTSPByNameSP_IdMS_IdS(@Param("ten") String ten, @Param("idMS") Integer idMS, @Param("idS") Integer idS);
    @Query("SELECT ctsp FROM CTSP ctsp WHERE ctsp.sanPham.tenSanPham like %:ten%")
    ArrayList<CTSP> getCTSPByNameSP(@Param("ten") String ten);
}
