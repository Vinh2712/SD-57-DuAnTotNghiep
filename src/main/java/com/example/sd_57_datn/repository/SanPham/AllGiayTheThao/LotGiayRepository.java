package com.example.sd_57_datn.repository.SanPham.AllGiayTheThao;

import com.example.sd_57_datn.model.LotGiay;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.UUID;


@Repository
public interface LotGiayRepository extends JpaRepository<LotGiay, UUID> {
}
