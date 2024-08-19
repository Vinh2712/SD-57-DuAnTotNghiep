package com.example.sd_57_datn.controller.ThongKe;


import com.example.sd_57_datn.model.GiayTheThaoChiTiet;
import com.example.sd_57_datn.model.HoaDon;
import com.example.sd_57_datn.repository.HoaDon.HoaDonChiTietRepository;
import com.example.sd_57_datn.repository.HoaDon.HoaDonRepository;
import com.example.sd_57_datn.repository.SanPham.GiayTheThao.GiayTheThaoChiTietRepository;
import com.example.sd_57_datn.repository.SanPham.GiayTheThao.GiayTheThaoRepository;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.datatype.jsr310.JavaTimeModule;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.Instant;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Objects;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import java.math.BigDecimal;
import java.util.List;

@Controller
public class ThongKeHoaDonController {

  @Autowired
  private HoaDonChiTietRepository hoaDonChiTietRepository;

  @Autowired
  private GiayTheThaoRepository giayTheThaoRepository;

  @Autowired
  private GiayTheThaoChiTietRepository giayTheThaoChiTietRepository;

  @Autowired
  private HoaDonRepository hoaDonRepository;

  // base: thong-ke
  // suffix : /chuan-data

  @PostMapping("/thong-ke/doanh-thu")
  @ResponseBody
  public Map<String, Object> searchByDateRange(@RequestBody DoanhThuRequest request)
      throws JsonProcessingException {
    Date startDate = request.getStartDate();
    Date endDate = request.getEndDate();

    LocalDateTime startDateFinal = null;
    LocalDateTime endDateFinal = null;

    if (Objects.nonNull(startDate)) {
      startDateFinal = getStartOrEndOfDay(startDate, false);
    }

    if (Objects.nonNull(endDate)) {
      endDateFinal = getStartOrEndOfDay(endDate, true);
    }

    BigDecimal tongDoanhThuDate = hoaDonRepository.tinhTongDoanhThuByDate(startDateFinal,
        endDateFinal);

    if (Objects.isNull(tongDoanhThuDate)) {
      tongDoanhThuDate = BigDecimal.ZERO;
    }

    Integer tongDonHang = hoaDonRepository.tongDonHangByDate(startDateFinal, endDateFinal);

    if (Objects.isNull(tongDonHang)) {
      tongDonHang = 0;
    }

    Integer tongHoaDonTaiQuay = hoaDonRepository.tongHoaDonTaiQuayByDate(startDateFinal,
        endDateFinal);
    if (Objects.isNull(tongHoaDonTaiQuay)) {
      tongHoaDonTaiQuay = 0;
    }

    Integer tongHoaDonOnline = hoaDonRepository.tongHoaDonOnlineByDate(startDateFinal,
        endDateFinal);
    if (Objects.isNull(tongHoaDonOnline)) {
      tongHoaDonOnline = 0;
    }

    Integer totalQuantity = giayTheThaoChiTietRepository.sumSoLuongByDate(startDate, endDate);
    if (Objects.isNull(totalQuantity)) {
      totalQuantity = 0;
    }

    ObjectMapper objectMapper = new ObjectMapper();
    String sanPhams = objectMapper.writeValueAsString(
        giayTheThaoChiTietRepository.getAllByByDate(startDate, endDate));
    List<HoaDon> hoaDons = hoaDonRepository.hoaDonByDate(startDateFinal, endDateFinal);
    List<Top5ProductResponse> top5ProductResponses = hoaDonChiTietRepository.findTop5BestSellingProducts(startDateFinal,endDateFinal);

    Map<String, Object> response = new HashMap<>();
    response.put("tongDoanhThu", tongDoanhThuDate);
    response.put("tongDonHang", tongDonHang);
    response.put("tongHoaDonTaiQuay", tongHoaDonTaiQuay);
    response.put("tongHoaDonOnline", tongHoaDonOnline);
    response.put("totalQuantity", totalQuantity);
    response.put("sanPhams", sanPhams);
    response.put("hoaDons", hoaDons);
    response.put("top5ProductResponses", top5ProductResponses);

    return response;
  }

  // thống kê data cho giầy thể thao
  @GetMapping("/thongke-data")
  @ResponseBody
  public String thongKeData() {
    List<GiayTheThaoChiTiet> sanPhams = giayTheThaoChiTietRepository.findAll(Sort.by(Sort.Direction.ASC, "soLuong"));

    ObjectMapper objectMapper = new ObjectMapper();

    try {

      String jsonData = objectMapper.writeValueAsString(sanPhams);
      return jsonData;

    } catch (Exception e) {

      e.printStackTrace();
      return "";

    }
  }

  // thống kê top 5 SP bán chạy
  @GetMapping("/thong-ke/top5")
  @ResponseBody
  public String top5BanChay() {

    List<Top5ProductResponse> top5ProductResponses = hoaDonChiTietRepository.findTop5BestSellingProducts(null,null);

    ObjectMapper objectMapper = new ObjectMapper();

    try {

      String jsonData = objectMapper.writeValueAsString(top5ProductResponses);
      return jsonData;

    } catch (Exception e) {

      e.printStackTrace();
      return "";

    }

  }

  // thống kê doanh thu, tổng đơn hàng, tổng số lượng sản phẩm, tổng số lượng online hóa đơn đã bán
  @GetMapping("/thongKeChuanData")
  public String thongKeChuanData(Model model) {

    //Tổng danh thu cho sản phẩm đã bán
    BigDecimal tongDoanhThu = hoaDonRepository.tinhTongDoanhThu();
    model.addAttribute("tongDoanhThu", tongDoanhThu);

    //Tổng đơn hàng cho sản phẩm đã bán
    Integer tongDonHang = hoaDonRepository.tongDonHang();
    model.addAttribute("tongDonHang", tongDonHang);

    //Tổng số lượng sản phẩm sẵn có trong kho
    Integer totalQuantity = giayTheThaoChiTietRepository.sumSoLuong();
    model.addAttribute("totalQuantity", totalQuantity);

    //
    Integer tongHoaDonTaiQuay = hoaDonRepository.tongHoaDonTaiQuay();
    model.addAttribute("tongHoaDonTaiQuay", tongHoaDonTaiQuay);

    //Tổng số lượng hóa đơn online đã bán
    Integer tongHoaDonOnline = hoaDonRepository.tongHoaDonOnline();
    model.addAttribute("tongHoaDonOnline", tongHoaDonOnline);

    return "ThongKe/test";

  }

  /**
   * Chuyển đổi đối tượng Date thành LocalDate.
   *
   * @param date đối tượng Date.
   * @return đối tượng LocalDate tương ứng.
   */
  public static LocalDate dateToLocalDate(Date date) {
    return date.toInstant()
        .atZone(ZoneId.systemDefault())
        .toLocalDate();
  }

  /**
   * Lấy thời gian bắt đầu hoặc kết thúc của ngày từ đối tượng Date.
   *
   * @param date     đối tượng Date.
   * @param endOfDay boolean, true để lấy thời gian kết thúc ngày, false để lấy thời gian bắt đầu
   *                 ngày.
   * @return đối tượng LocalDateTime với thời gian bắt đầu hoặc kết thúc của ngày.
   */
  public static LocalDateTime getStartOrEndOfDay(Date date, boolean endOfDay) {
    LocalDate localDate = dateToLocalDate(date);

    if (endOfDay) {
      return localDate.atTime(23, 59, 59, 999_999_999); // Kết thúc ngày
    } else {
      return localDate.atStartOfDay(); // Bắt đầu ngày
    }
  }

  //Thống kê hóa đơn

  @GetMapping("/thongke-data-hoadon")
  @ResponseBody
  public String thongKeDataHD() {
    List<HoaDon> hdct = hoaDonRepository.findAll(Sort.by(Sort.Direction.ASC, "ngayTao"));

    ObjectMapper objectMapper = new ObjectMapper();
    // Thêm module để hỗ trợ Java 8 date/time
    objectMapper.registerModule(new JavaTimeModule());

    try {
      String jsonData = objectMapper.writeValueAsString(hdct);
      return jsonData;
    } catch (Exception e) {
      e.printStackTrace();
      return "";
    }
  }


}
