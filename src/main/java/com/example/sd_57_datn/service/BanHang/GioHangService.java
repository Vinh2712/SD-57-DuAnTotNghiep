package com.example.sd_57_datn.service.BanHang;


import com.example.sd_57_datn.model.GioHangChiTiet;
import com.example.sd_57_datn.repository.BanHang.GioHangChiTietRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.UUID;

@Service
public class GioHangService {

    @Autowired
    private GioHangChiTietRepository gioHangChiTietRepository;

    //Todo code xóa giỏ hàng

    public void xoaSanPham(UUID gioHangChiTietId) {
        // Tìm thông tin giỏ hàng chi tiết cần xóa
        GioHangChiTiet gioHangChiTiet = gioHangChiTietRepository.findById(gioHangChiTietId).orElse(null);

        // Kiểm tra nếu giỏ hàng chi tiết tồn tại
        if (gioHangChiTiet != null) {
            // Xóa giỏ hàng chi tiết từ cơ sở dữ liệu
            gioHangChiTietRepository.delete(gioHangChiTiet);

            // Cập nhật thông tin giỏ hàng của người dùng nếu cần
            // Ví dụ: gioHangRepository.save(gioHang);

            // Các bước khác cần thiết để cập nhật thông tin giỏ hàng
        }
    }

}
