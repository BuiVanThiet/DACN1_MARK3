package com.example.ass1_mark_2.respository;

import com.example.ass1_mark_2.entity.model.HDCT;
import com.example.ass1_mark_2.entity.sumMoney.TotalAmount;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.Optional;
@Repository
public interface HDCTRepository extends CrudRepository<HDCT,Integer>, PagingAndSortingRepository<HDCT,Integer> {
    @Query("select new com.example.ass1_mark_2.entity.sumMoney.TotalAmount(hdct.hoaDon.id,SUM(hdct.tongTien)) " +
            " from HDCT hdct group by hdct.hoaDon.id")
//@Query("SELECT new com.example.ass2_beta_mark2.entity.sumMoney.TotalAmount(hdct.hoaDon.id, COALESCE(SUM(CAST(hdct.tongTien AS java.math.BigDecimal)), 0)) " +
//        "FROM HDCT hdct" +
//        " RIGHT JOIN hdct.hoaDon hoaDon " +
//        " GROUP BY hoaDon.id")
    Iterable<TotalAmount> getTien();


    @Query("select hdct from HDCT hdct where hdct.hoaDon.id = :idCheck")
    Page<HDCT> getHDCTByIdHD_Page(@Param("idCheck") Integer id, Pageable pageable);

    @Query("select new com.example.ass1_mark_2.entity.sumMoney.TotalAmount(hdct.hoaDon.id,sum(hdct.tongTien)) from HDCT hdct where hdct.hoaDon.id = :idCheck group by hdct.hoaDon.id")
    Optional<TotalAmount> getSumMoneyByID(@Param("idCheck") Integer id);

    @Query("select hdct from HDCT hdct where hdct.hoaDon.id = :idCheck")
    Iterable<HDCT> getHDCTByIdHD(@Param("idCheck") Integer id);

}
