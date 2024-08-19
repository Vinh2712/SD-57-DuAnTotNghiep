package com.example.sd_57_datn.model;

import jakarta.persistence.*;
import lombok.*;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.UUID;

@AllArgsConstructor
@NoArgsConstructor
@Builder
@Getter
@Setter
@Entity
@Table(name = "ViTien")
public class ViTien {

    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    @Column(name = "Id_ViTien")
    private UUID id;

    @ManyToOne
    @JoinColumn(name = "Id_KhachHang")
    private KhachHang khachHang;

    @Column(name = "maViTien")
    private String maViTien;

    @Column(name = "thanhTien")
    private BigDecimal thanhTien;

    @Column(name = "ngayTao")
    private LocalDateTime ngayTao;

    @Column(name = "ngaySua")
    private LocalDateTime ngaySua;

    @Column(name = "trangThai")
    private int trangThai;

}
