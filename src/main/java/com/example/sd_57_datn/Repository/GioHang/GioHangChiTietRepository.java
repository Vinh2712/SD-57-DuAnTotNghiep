package com.example.sd_57_datn.Repository.GioHang;


import com.example.sd_57_datn.Model.GiayTheThaoChiTiet;
import com.example.sd_57_datn.Model.GioHang;
import com.example.sd_57_datn.Model.GioHangChiTiet;
import jakarta.transaction.Transactional;
import java.util.List;
import java.util.Optional;
import java.util.UUID;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface GioHangChiTietRepository extends JpaRepository<GioHangChiTiet, UUID> {

    GioHangChiTiet findByGioHangAndGiayTheThaoChiTiet(GioHang gioHang, GiayTheThaoChiTiet giayTheThaoChiTiet);

    GioHangChiTiet findByGiayTheThaoChiTiet_Id(UUID idGiayTheThaoChiTiet);

    List<GioHangChiTiet> findByGioHangId(UUID idGioHang);

    Optional<GioHangChiTiet> findByGioHang_Id_AndGiayTheThaoChiTiet_Id(UUID gioHangId, UUID giayTheThaoChiTietId);

    @Modifying
    @Transactional
    @Query("DELETE FROM GioHangChiTiet ghct WHERE ghct.gioHang.id = :gioHangId AND ghct.giayTheThaoChiTiet.id = :giayTheThaoChiTietId")
    void deleteByGioHang_IdAndGiayTheThaoChiTiet_Id(UUID gioHangId, UUID giayTheThaoChiTietId);


}
