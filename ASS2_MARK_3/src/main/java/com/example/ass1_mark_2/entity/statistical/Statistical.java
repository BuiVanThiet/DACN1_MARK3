package com.example.ass1_mark_2.entity.statistical;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class Statistical {
    private String tenSP;
    private int soLuong;
    // Constructor có tham số nhận các giá trị từ truy vấn JPQL
    public Statistical(String tenSP, long soLuong) {
        this.tenSP = tenSP;
        this.soLuong = (int) soLuong; // Chuyển đổi từ kiểu long sang int
    }
}
