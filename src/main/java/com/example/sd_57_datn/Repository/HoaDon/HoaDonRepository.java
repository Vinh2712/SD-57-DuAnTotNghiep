package com.example.sd_57_datn.repository.HoaDon;


import com.example.sd_57_datn.model.HoaDon;
import java.sql.Timestamp;
import java.time.LocalDate;
import java.time.LocalDateTime;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.math.BigDecimal;
import java.util.List;
import java.util.UUID;

@Repository
public interface HoaDonRepository extends JpaRepository<HoaDon, UUID> {


    @Query("select hd from HoaDon hd where hd.khachHang.id = ?1 and hd.trangThai = ?2")
    Page<HoaDon> listHoaDonFindByKhachHangAndTrangThai(UUID idKhachHang, int trangThai, Pageable pageable);

    @Query("select hd from HoaDon hd where hd.trangThai = ?1")
    Page<HoaDon> listHoaDonFindByTrangThai( int trangThai, Pageable pageable);

    //Todo code dành cho thống kê

    @Query("SELECT SUM(hd.thanhTien) FROM HoaDon hd WHERE hd.trangThai = 4")
    BigDecimal tinhTongDoanhThu();

    @Query(value = "SELECT SUM(hd.thanhTien) FROM HoaDon hd WHERE hd.trangThai = 4 " +
        "AND (:startDate IS NULL OR hd.ngayTao >= :startDate) " +
        "AND (:endDate IS NULL OR hd.ngayTao <= :endDate)")
    BigDecimal tinhTongDoanhThuByDate(@Param("startDate") LocalDateTime startDate, @Param("endDate") LocalDateTime endDate);

    @Query("SELECT COUNT(hd.maHoaDon) FROM HoaDon hd WHERE hd.trangThai = 4 ")
    Integer tongDonHang();

    @Query(value = "SELECT COUNT(hd.maHoaDon) FROM HoaDon hd WHERE hd.trangThai = 4 " +
        "AND (:startDate IS NULL OR hd.ngayTao >= :startDate) " +
        "AND (:endDate IS NULL OR hd.ngayTao <= :endDate)")
    Integer tongDonHangByDate(@Param("startDate") LocalDateTime startDate, @Param("endDate") LocalDateTime endDate);

    @Query("SELECT COUNT(hd.maHoaDon) FROM HoaDon hd WHERE hd.trangThai = 4 AND hd.hinhThuc = 1")
    Integer tongHoaDonTaiQuay();

    @Query(value = "SELECT COUNT(hd.maHoaDon) FROM HoaDon hd WHERE hd.trangThai = 4 AND hd.hinhThuc = 1 " +
        "AND (:startDate IS NULL OR hd.ngayTao >= :startDate) " +
        "AND (:endDate IS NULL OR hd.ngayTao <= :endDate)")
    Integer tongHoaDonTaiQuayByDate(@Param("startDate") LocalDateTime startDate, @Param("endDate") LocalDateTime endDate);

    @Query(value = "SELECT hd FROM HoaDon hd " +
        "WHERE (:startDate IS NULL OR hd.ngayTao >= :startDate) " +
        "AND (:endDate IS NULL OR hd.ngayTao <= :endDate) ORDER BY hd.ngayTao ASC")
    List<HoaDon> hoaDonByDate(@Param("startDate") LocalDateTime startDate, @Param("endDate") LocalDateTime endDate);

    @Query("SELECT COUNT(hd.maHoaDon) FROM HoaDon hd WHERE hd.trangThai = 4 AND hd.hinhThuc = 0")
    Integer tongHoaDonOnline();

    @Query(value = "SELECT COUNT(hd.maHoaDon) FROM HoaDon hd WHERE hd.trangThai = 4 AND hd.hinhThuc = 0 " +
        "AND (:startDate IS NULL OR hd.ngayTao >= :startDate) " +
        "AND (:endDate IS NULL OR hd.ngayTao <= :endDate)")
    Integer tongHoaDonOnlineByDate(@Param("startDate") LocalDateTime startDate, @Param("endDate") LocalDateTime endDate);

    //Sản phẩm bán chạy nhất
    @Query("SELECT h, gttct FROM HoaDon h " +
            "JOIN HoaDonChiTiet hdct ON h.id = hdct.hoaDon.id " +
            "JOIN GiayTheThaoChiTiet gttct ON hdct.giayTheThaoChiTiet.id = gttct.id " +
            "WHERE h.trangThai = 4")

    String timSanPhamBanChayNhat();

    //Todo code áp dụng cho chương trình khuyến mãi cho hóa đơn
    @Query("select sum(hdct.soLuong) from HoaDonChiTiet hdct where hdct.hoaDon.id = ?1")
    String tongSl(UUID id);

    //Todo code bán hàng tại quầy
    List<HoaDon> findAllByTrangThaiAndHinhThucOrderByNgayTaoDesc(int trangThai, int hinhThuc);

    //Todo code thêm sản phẩm cho hóa đơn
    @Query("SELECT COALESCE(SUM(hdct.donGia), 0) FROM HoaDonChiTiet hdct WHERE hdct.hoaDon.id = :hoaDonId")
    BigDecimal calculateTotalDonGiaByHoaDonId(@Param("hoaDonId") UUID hoaDonId);


    //Tìm kiếm theo mã
    @Query("select hd from HoaDon hd where hd.maHoaDon = ?1")
    HoaDon findByMa(String ma);

}
