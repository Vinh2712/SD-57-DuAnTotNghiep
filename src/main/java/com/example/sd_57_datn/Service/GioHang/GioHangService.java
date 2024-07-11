package com.example.sd_57_datn.Service.GioHang;


import com.example.sd_57_datn.Model.GioHangChiTiet;
import com.example.sd_57_datn.Repository.GioHang.GioHangChiTietRepository;
import java.util.UUID;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
        }
    }

}
