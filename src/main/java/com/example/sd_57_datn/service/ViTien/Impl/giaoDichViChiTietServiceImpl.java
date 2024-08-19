package com.example.sd_57_datn.service.ViTien.Impl;


import com.example.sd_57_datn.model.GiaoDichViChiTiet;

import java.util.List;
import java.util.UUID;

public interface giaoDichViChiTietServiceImpl {

    List<GiaoDichViChiTiet> findAllByKhachHang(UUID id);

    void add(GiaoDichViChiTiet giaoDichVi);

    void update(UUID id, GiaoDichViChiTiet updateGD);

    GiaoDichViChiTiet findByMa(String ma);

}
