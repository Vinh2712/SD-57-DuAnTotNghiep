package com.example.sd_57_datn.Service.ViTien;

import com.example.sd_57_datn.Model.ViTien;

import java.util.UUID;

public interface viTienServiceImpl {

    void add(ViTien viTien);

    void update(UUID id, ViTien updateViTien);

    ViTien findByIdKhachHang(UUID id);

}
