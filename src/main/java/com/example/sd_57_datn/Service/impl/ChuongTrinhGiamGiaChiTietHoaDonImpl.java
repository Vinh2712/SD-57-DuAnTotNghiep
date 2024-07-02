package com.example.sd_57_datn.Service.impl;



import com.example.sd_57_datn.Model.ChuongTrinhGiamGiaChiTietHoaDon;
import com.example.sd_57_datn.Model.ChuongTrinhGiamGiaHoaDon;

import java.util.List;

public interface ChuongTrinhGiamGiaChiTietHoaDonImpl {

    public List<ChuongTrinhGiamGiaChiTietHoaDon> getById(ChuongTrinhGiamGiaHoaDon ctggHD);
    public List<ChuongTrinhGiamGiaChiTietHoaDon> getAllByTrangThaiHD();

}
