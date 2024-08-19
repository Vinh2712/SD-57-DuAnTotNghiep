package com.example.sd_57_datn.service.GioHang;


import com.example.sd_57_datn.model.GioHangChiTiet;

import java.util.UUID;

public interface GioHangChiTietImpl {

    void add(GioHangChiTiet gioHangChiTiet);

    GioHangChiTiet findById(UUID id);

    void update(UUID id, GioHangChiTiet update);

}
