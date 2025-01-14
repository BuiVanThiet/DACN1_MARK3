package com.example.ass1_mark_2.entity.base;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotBlank;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.util.Date;
@Getter
@Setter
@MappedSuperclass
@ToString
public class BaseEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column
    private Integer id;
    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "ngay_tao")
    private Date ngayTao;
    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "ngay_sua")
    private Date ngaySua;
    @Column(name = "trang_thai")
    @NotBlank(message = "Chua chon trang thai")
    private String trangThai;
    @PrePersist
    public void setDate(){
        this.ngayTao = new Date();
        this.ngaySua = new Date();
    }
    @PreUpdate
    public void setDoiDate(){
        this.ngaySua = new Date();
    }

}
