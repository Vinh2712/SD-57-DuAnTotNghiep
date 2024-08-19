package com.example.sd_57_datn.service.ViTien.Impl;


import com.example.sd_57_datn.model.ViTien;

import java.util.UUID;

public interface viTienServiceImpl {

    void add(ViTien viTien);

    void update(UUID id, ViTien updateViTien);

    ViTien findByIdKhachHang(UUID id);

}
