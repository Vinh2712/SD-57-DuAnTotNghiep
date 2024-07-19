package com.example.sd_57_datn.Controller.ThongKe;


import com.example.sd_57_datn.Model.HoaDon;
import com.example.sd_57_datn.Repository.GiayTheThao.GiayTheThaoChiTietRepository;
import com.example.sd_57_datn.Repository.GiayTheThao.GiayTheThaoRepository;
import com.example.sd_57_datn.Repository.HoaDon.HoaDonChiTietRepository;
import com.example.sd_57_datn.Repository.HoaDon.HoaDonRepository;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.datatype.jsr310.JavaTimeModule;
import java.math.BigDecimal;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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

    @GetMapping("/thongKeChuanData")
    public String thongKeChuanData(Model model){

        //Tổng danh thu cho sản phẩm đã bán
        BigDecimal tongDoanhThu = hoaDonRepository.tinhTongDoanhThu();
        model.addAttribute("tongDoanhThu",tongDoanhThu);

        //Tổng đơn hàng cho sản phẩm đã bán
        Integer tongDonHang = hoaDonRepository.tongDonHang();
        model.addAttribute("tongDonHang",tongDonHang);

        //Tổng số lượng sản phẩm sẵn có trong kho
        Integer totalQuantity = giayTheThaoChiTietRepository.sumSoLuong();
        model.addAttribute("totalQuantity",totalQuantity);

        //
        Integer tongHoaDonTaiQuay = hoaDonRepository.tongHoaDonTaiQuay();
        model.addAttribute("tongHoaDonTaiQuay",tongHoaDonTaiQuay);

        //Tổng số lượng hóa đơn online đã bán
        Integer tongHoaDonOnline = hoaDonRepository.tongHoaDonOnline();
        model.addAttribute("tongHoaDonOnline",tongHoaDonOnline);



        return "ThongKe/test";

    }



   //Thống kê hóa đơn

    @GetMapping("/thongke-data-hoadon")
    @ResponseBody
    public String thongKeDataHD() {
        List<HoaDon> hdct = hoaDonRepository.findAll();

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
