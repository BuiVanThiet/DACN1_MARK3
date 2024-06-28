package com.example.ass1_mark_2.security.repositores;

import com.example.ass1_mark_2.entity.model.NhanVien;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface MyAccountRepositori extends JpaRepository<NhanVien,Integer> {
    Optional<NhanVien> findBySdt(String sdt);
}
