package com.example.sd_57_datn.Service.ViTien;

import com.example.sd_57_datn.Model.ViTien;
import com.example.sd_57_datn.Repository.ViTien.viTienRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Optional;
import java.util.UUID;

@Service
public class viTienService implements viTienServiceImpl{

    @Autowired
    private viTienRepository viTienRepository;

    @Override
    public void add(ViTien viShop) {

        viTienRepository.save(viShop);

    }

    @Override
    public void update(UUID id, ViTien updateVi) {

        Optional<ViTien> optionalViShop = viTienRepository.findById(id);

        if (optionalViShop.isPresent()){

            ViTien viShop = optionalViShop.get();
            viShop.setMaViTien(updateVi.getMaViTien());
            viShop.setKhachHang(updateVi.getKhachHang());
            viShop.setThanhTien(updateVi.getThanhTien());
            viShop.setTrangThai(updateVi.getTrangThai());

            viTienRepository.save(viShop);

        }
    }

    @Override
    public ViTien findByIdKhachHang(UUID id) {

        return viTienRepository.findByIdKhachHang(id);

    }




}
