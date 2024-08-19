package com.example.sd_57_datn.repository.SanPham.GiayTheThao;

import com.example.sd_57_datn.model.*;
import java.util.Date;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.UUID;

@Repository
public interface GiayTheThaoChiTietRepository extends JpaRepository<GiayTheThaoChiTiet, UUID> {

    @Query("select giayTheThaoChiTiet from GiayTheThaoChiTiet giayTheThaoChiTiet where giayTheThaoChiTiet.giayTheThao.id=?1")
    List<GiayTheThaoChiTiet> getAllById(UUID id);

    @Query(value = "SELECT * FROM GiayTheThaoChiTiet sp " +
        "WHERE (:startDate IS NULL OR sp.ngayTao >= :startDate) " +
        "AND (:endDate IS NULL OR sp.ngayTao <= :endDate) ORDER BY sp.soLuong ASC ",nativeQuery = true)
    List<GiayTheThaoChiTiet> getAllByByDate(@Param("startDate") Date startDate, @Param("endDate") Date endDate);
    List<GiayTheThaoChiTiet> findByGiayTheThaoAndMauSacAndSize(GiayTheThao giayTheThao, MauSac mauSac, Size size);

    //Todo code tìm size số lượng màu sắc
    @Query("select p from GiayTheThaoChiTiet p where p.giayTheThao.id = ?1 and p.mauSac.id = ?2 and p.size.id = ?3")
    GiayTheThaoChiTiet findIdByIdGiayTheThaoMauSacSize(UUID id, UUID idMauSac, UUID idSize);


    List<GiayTheThaoChiTiet> findByGiayTheThao(GiayTheThao giayTheThao);

//    UUID findIdByGiayTheThaoAndSizeAndMauSac(UUID giayTheThaoId, UUID sizeId, UUID mauSacId);

    @Query("SELECT id FROM GiayTheThaoChiTiet WHERE giayTheThao.id = :giayTheThaoId AND size.id = :sizeId AND mauSac.id = :mauSacId")
    UUID findIdByGiayTheThaoAndSizeAndMauSac(UUID giayTheThaoId, UUID sizeId, UUID mauSacId);

//
//    @Query("SELECT id FROM GiayTheThaoChiTiet WHERE giayTheThao.id = :giayTheThaoId AND size.id = :sizeId AND mauSac.id = :mauSacId")
//    UUID findIdByGiayTheThaoAndMauSacAndSize(UUID giayTheThaoId, UUID mauSacId, UUID sizeId);

    @Query("SELECT gtc FROM GiayTheThaoChiTiet gtc WHERE gtc.giayTheThao.id = :giayTheThaoId AND gtc.size.id = :sizeId AND gtc.mauSac.id = :mauSacId")
    GiayTheThaoChiTiet findByGiayTheThaoAndSizeAndMauSac(UUID giayTheThaoId, UUID sizeId, UUID mauSacId);


    //Todo code tổng số lượng sản phẩm có trong kho
    @Query("SELECT SUM(sp.soLuong) FROM GiayTheThaoChiTiet sp")
    Integer sumSoLuong();

    @Query(value = "SELECT SUM(sp.soLuong) FROM GiayTheThaoChiTiet sp " +
        "WHERE (:startDate IS NULL OR sp.ngayTao >= :startDate) " +
        "AND (:endDate IS NULL OR sp.ngayTao <= :endDate)",nativeQuery = true)
    Integer sumSoLuongByDate(@Param("startDate") Date startDate, @Param("endDate") Date endDate);

    //Todo code


    @Query("select p from GiayTheThaoChiTiet p where p.giayTheThao.id = ?1 and p.mauSac.id = ?2 and p.size.id = ?3")
    GiayTheThaoChiTiet findIdByIdGiayTheThaoMsSize(UUID id, UUID idMauSac, UUID idSize);

    @Query("SELECT gttct FROM GiayTheThaoChiTiet gttct JOIN gttct.giayTheThao gtt WHERE gtt.tenGiayTheThao =:ten ")
    List<GiayTheThaoChiTiet> findAllByNameProduct(@Param("ten") String name);



}
