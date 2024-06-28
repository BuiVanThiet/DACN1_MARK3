package com.example.ass1_mark_2.security.implement;

import com.example.ass1_mark_2.entity.account.Account;
import com.example.ass1_mark_2.entity.model.NhanVien;
import com.example.ass1_mark_2.security.repositores.MyAccountRepositori;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class NhanVienLoginImplement implements UserDetailsService {
    @Autowired
    MyAccountRepositori myAccountRepositori;
    @Override
    public UserDetails loadUserByUsername(String sdt) throws UsernameNotFoundException {
        Optional<NhanVien> nhanVien = myAccountRepositori.findBySdt(sdt);
        if(nhanVien.isPresent()) {
            var nhanVienObject = nhanVien.get();
            System.out.println(nhanVien.toString());
            Account.getAccount().setId(nhanVien.get().getId());
            Account.getAccount().setHoTen(nhanVien.get().getHoTen());
            Account.getAccount().setChucVu(nhanVien.get().getChucVu().getMaChucVu());
            Account.getAccount().setSdt(nhanVien.get().getSdt());
            Account.getAccount().setPassWord(nhanVien.get().getMatKhau());
            return User.builder()
                    .username(nhanVienObject.getSdt())
                    .password(nhanVienObject.getMatKhau())
                    .roles(nhanVienObject.getChucVu().getTenChucVu().trim().toLowerCase())
                    .build();
        } else {
            throw new UsernameNotFoundException(sdt);
        }
    }
}
