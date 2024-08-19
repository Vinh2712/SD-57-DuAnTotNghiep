package com.example.sd_57_datn.service.admin;


import com.example.sd_57_datn.model.CoGiay;
import com.example.sd_57_datn.repository.SanPham.AllGiayTheThao.CoGiayRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CoGiayService {

    @Autowired
    private CoGiayRepository coGiayRepository;

    public List<CoGiay> findCoGiay(String tenCoGiay) {
        if (tenCoGiay != null) {
            return coGiayRepository.findByTenCoGiayContaining(tenCoGiay);
        } else {
            return coGiayRepository.findAll();
        }
    }
}
