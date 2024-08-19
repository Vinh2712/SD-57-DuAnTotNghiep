package com.example.sd_57_datn.service.impl;


import com.example.sd_57_datn.model.ChuongTrinhGiamGiaChiTietHoaDon;
import com.example.sd_57_datn.model.ChuongTrinhGiamGiaHoaDon;

import java.util.List;

public interface ChuongTrinhGiamGiaChiTietHoaDonImpl {

    public List<ChuongTrinhGiamGiaChiTietHoaDon> getById(ChuongTrinhGiamGiaHoaDon ctggHD);
    public List<ChuongTrinhGiamGiaChiTietHoaDon> getAllByTrangThaiHD();

}
