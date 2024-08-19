package com.example.sd_57_datn.repository.HoaDon;


import com.example.sd_57_datn.controller.ThongKe.Top5ProductResponse;
import com.example.sd_57_datn.model.GiayTheThaoChiTiet;
import com.example.sd_57_datn.model.HoaDon;
import com.example.sd_57_datn.model.HoaDonChiTiet;
import io.lettuce.core.dynamic.annotation.Param;
import java.time.LocalDateTime;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.UUID;

@Repository
public interface HoaDonChiTietRepository extends JpaRepository<HoaDonChiTiet, UUID> {

    List<HoaDonChiTiet> findByHoaDon_Id(UUID id);

    //Todo code bán hàng tại quầy
    List<HoaDonChiTiet> findAllByHoaDon(HoaDon hd);

    int countByHoaDonAndGiayTheThaoChiTiet(HoaDon hd, GiayTheThaoChiTiet gttct);

    HoaDonChiTiet findByHoaDonAndGiayTheThaoChiTiet(HoaDon hd, GiayTheThaoChiTiet gttct);

    //Todo code
    List<HoaDonChiTiet> findByHoaDon_IdAndTrangThai(UUID idHoaDon, int trangThai);

    @Query(value = """
    SELECT TOP 5 
        gtct.Id_GiayTheThaoChiTiet AS idGiayTheThaoChiTiet, 
        gt.tenGiayTheThao AS productName, 
        ms.tenMauSac AS colorName, 
        s.size AS size, 
        SUM(hdct.soLuong) AS totalQuantitySold
    FROM 
        HoaDonChiTiet hdct
    JOIN 
        GiayTheThaoChiTiet gtct ON hdct.Id_GiayTheThaoChiTiet = gtct.Id_GiayTheThaoChiTiet
    JOIN 
        GiayTheThao gt ON gtct.Id_GiayTheThao = gt.Id_GiayTheThao
    JOIN 
        MauSac ms ON gtct.Id_MauSac = ms.Id_MauSac
    JOIN 
        Size s ON gtct.Id_Size = s.Id_Size
    JOIN
        HoaDon hd ON hdct.Id_HoaDon = hd.Id_HoaDon
    WHERE
        (:startDate IS NULL OR hd.ngayTao >= :startDate) 
        AND (:endDate IS NULL OR hd.ngayTao <= :endDate)
    GROUP BY 
        gtct.Id_GiayTheThaoChiTiet, gt.tenGiayTheThao, ms.tenMauSac, s.size
    ORDER BY 
        totalQuantitySold ASC
    """, nativeQuery = true)
    List<Top5ProductResponse> findTop5BestSellingProducts(@Param("startDate") LocalDateTime startDate, @Param("endDate") LocalDateTime endDate);


}
