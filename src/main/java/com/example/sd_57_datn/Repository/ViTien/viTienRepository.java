package com.example.sd_57_datn.Repository.ViTien;


import com.example.sd_57_datn.Model.ViTien;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.UUID;

@Repository
public interface viTienRepository extends JpaRepository<ViTien, UUID> {

    @Query("select v from ViTien v where v.khachHang.id = ?1")
    ViTien findByIdKhachHang(UUID id);

}
