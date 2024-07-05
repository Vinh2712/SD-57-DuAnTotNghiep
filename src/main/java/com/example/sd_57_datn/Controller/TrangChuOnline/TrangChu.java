package com.example.sd_57_datn.Controller.TrangChuOnline;

import com.example.sd_57_datn.Model.*;
import com.example.sd_57_datn.Repository.GiamGia.ChuongTrinhGiamGiaChiTietGiayTheThaoRepository;
import com.example.sd_57_datn.Repository.GiayTheThao.GiayTheThaoChiTietRepository;
import com.example.sd_57_datn.Repository.GiayTheThao.GiayTheThaoRepository;
import com.example.sd_57_datn.Repository.GiayTheThao.ImageRepository;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@Controller
public class TrangChu {
    @Autowired
    private GiayTheThaoRepository giayTheThaoRepository;

    @Autowired
    private GiayTheThaoChiTietRepository giayTheThaoChiTietRepository;

    @Autowired
    private ImageRepository imageRepository;

    @Autowired
    private ChuongTrinhGiamGiaChiTietGiayTheThaoRepository chuongTrinhGiamGiaChiTietGiayTheThaoRepository;
    //PhantrangchoListSPGiaoDiennguoidung

    private void giaoDienTrangChuListGiayTheThao(Model model, Integer pageNum, Integer pageSize, GiayTheThaoRepository giayTheThaoRepository) {
        List<GiayTheThao> lstGiayTheThao = giayTheThaoRepository.findAll();
        model.addAttribute("lstGiayTheThao", lstGiayTheThao);

        Pageable pageable = PageRequest.of(pageNum - 1, pageSize);
        Page<GiayTheThao> page = giayTheThaoRepository.findAll(pageable);

        // Hiện thông tin sản phẩm
        model.addAttribute("totalPage", page.getTotalPages());
        model.addAttribute("listPage", page.getContent());

        // List danh sách các trang để hiện ra giao diện
        List<Integer> pageNumbers = new ArrayList<>();
        int totalPages = page.getTotalPages();
        int currentPage = pageNum;
        int startPage, endPage;

        if (totalPages <= 5) {
            startPage = 1;
            endPage = totalPages;
        } else {
            if (currentPage <= 3) {
                startPage = 1;
                endPage = 5;
            } else if (currentPage + 2 >= totalPages) {
                startPage = totalPages - 4;
                endPage = totalPages;
            } else {
                startPage = currentPage - 2;
                endPage = currentPage + 2;
            }
        }

        for (int i = startPage; i <= endPage; i++) {

            pageNumbers.add(i);

        }

        //Todo code sử lý dữ liệu size và màu sắc để lọc thông tin


        model.addAttribute("pageNumbers", pageNumbers);
        model.addAttribute("currentPage", currentPage);

        //Todo code list các sản phẩm giầy thể thao có chương trình khuyến mãi

        List<ChuongTrinhGiamGiaChiTietGiayTheThao> listSale = chuongTrinhGiamGiaChiTietGiayTheThaoRepository.findAll();
        model.addAttribute("listSale", listSale);


    }

    //HienlenDetails
    private void giaoDienTrangChuListGiayTheThaoDetails(Model model, Integer pageNum, Integer pageSize, GiayTheThaoRepository giayTheThaoRepository) {
        // Số sản phẩm hiển thị trên mỗi trang
        int size = 25;

        // Lấy tất cả sản phẩm
        List<GiayTheThao> lstGiayTheThao = giayTheThaoRepository.findAll();
        model.addAttribute("lstGiayTheThao", lstGiayTheThao);

        // Thiết lập Pageable với số lượng sản phẩm trên mỗi trang
        Pageable pageable = PageRequest.of(pageNum - 1, size);

        // Lấy trang dữ liệu
        Page<GiayTheThao> page = giayTheThaoRepository.findAll(pageable);

        // Hiển thị thông tin sản phẩm
        model.addAttribute("totalPage", page.getTotalPages());
        model.addAttribute("listPage", page.getContent());

        // Danh sách các trang để hiển thị ra giao diện
        List<Integer> pageNumbers = new ArrayList<>();
        int totalPages = page.getTotalPages();
        int currentPage = pageNum;
        int startPage, endPage;

        if (totalPages <= 5) {
            startPage = 1;
            endPage = totalPages;
        } else {
            if (currentPage <= 3) {
                startPage = 1;
                endPage = 5;
            } else if (currentPage + 2 >= totalPages) {
                startPage = totalPages - 4;
                endPage = totalPages;
            } else {
                startPage = currentPage - 2;
                endPage = currentPage + 2;
            }
        }

        for (int i = startPage; i <= endPage; i++) {
            pageNumbers.add(i);
        }

        // Todo code sử lý dữ liệu size và màu sắc để lọc thông tin

        model.addAttribute("pageNumbers", pageNumbers);
        model.addAttribute("currentPage", currentPage);

    }

    //Todo code list giầy thể thao trang chủ
    @RequestMapping(value = "TrangChu/listGiayTheThao")
    public String showListViewGiayTheThao(Model model,
                                          HttpSession session,
                                          @RequestParam(name = "pageNum", required = false, defaultValue = "1") Integer pageNum,
                                          @RequestParam(name = "pageSize", required = false, defaultValue = "8") Integer pageSize) {

        if (session.getAttribute("khachHangLog") != null) {

            System.out.println("Tài khoản khách hàng đã được đăng nhập");
            model.addAttribute("maKH", session.getAttribute("maKH"));
            giaoDienTrangChuListGiayTheThao(model, pageNum, pageSize, giayTheThaoRepository);

            return "/templates/Users/indexLogin";

        } else {

            System.out.println("Tài khoản khách hàng chưa được đăn nhập");
            giaoDienTrangChuListGiayTheThao(model, pageNum, pageSize, giayTheThaoRepository);
            return "/templates/Users/index";

        }

    }

    //Todo code list giầy thể thao có bộ lọc
    @RequestMapping(value = "TrangChu/listGiayTheThao/Details")
    public String showListViewGiayTheThaoDetailsAndLoc(Model model,
                                                       HttpSession session,
                                                       @RequestParam(name = "pageNum", required = false, defaultValue = "1") Integer pageNum,
                                                       @RequestParam(name = "pageSize", required = false, defaultValue = "25") Integer pageSize
    ) {


        if (session.getAttribute("khachHangLog") != null) {

            System.out.println("Tài khoản của khách hàng đã được đang nhập");
            model.addAttribute("maKH", session.getAttribute("maKH"));
            giaoDienTrangChuListGiayTheThaoDetails(model, pageNum, pageSize, giayTheThaoRepository);

            return "/templates/Users/indexLoginDetails";

        } else {

            System.out.println("Khách hàng chưa đăng nhập tài khoản !");
            giaoDienTrangChuListGiayTheThao(model, pageNum, pageSize, giayTheThaoRepository);

            return "/templates/Users/index";

        }

    }


    //Todo code detail thông tin sản phẩm chi tiết và thông tin sản phẩm
    //id ở đây là id của giầy thể thao
    private void detailGiayTheThaoChiTietTrangChu(Model model, UUID id, Integer pageNum, Integer pageSize) {
        GiayTheThao giayTheThao = giayTheThaoRepository.findById(id).orElse(null);
        model.addAttribute("giayTheThao", giayTheThao);

        if (giayTheThao != null) {
            List<GiayTheThaoChiTiet> giayTheThaoChiTiet = giayTheThaoChiTietRepository.findByGiayTheThao(giayTheThao);
            model.addAttribute("giayTheThaoChiTiet", giayTheThaoChiTiet);

            List<Size> uniqueSizes = new ArrayList<>();
            List<MauSac> uniqueMauSac = new ArrayList();

            for (GiayTheThaoChiTiet chiTiet : giayTheThaoChiTiet) {
                Size size = chiTiet.getSize();

                if (!uniqueSizes.contains(size)) {
                    uniqueSizes.add(size);
                }
            }

            for (GiayTheThaoChiTiet chiTiet : giayTheThaoChiTiet) {
                MauSac mauSac = chiTiet.getMauSac();
                if (!uniqueMauSac.contains(mauSac)) {
                    uniqueMauSac.add(mauSac);
                }
            }

            int totalSoLuong = 0;

            for (GiayTheThaoChiTiet chiTiet : giayTheThaoChiTiet) {

                totalSoLuong += Integer.parseInt(chiTiet.getSoLuong());

            }

            model.addAttribute("totalSoLuong", totalSoLuong);
            model.addAttribute("uniqueSizes", uniqueSizes);
            model.addAttribute("uniqueMauSac", uniqueMauSac);

            List<Image> images = imageRepository.findImageByGiayTheThao(giayTheThao);
            model.addAttribute("listImage", images);
        }

        // Phân trang dữ liệu
        Pageable pageable = PageRequest.of(pageNum - 1, pageSize);
        Page<GiayTheThao> page = giayTheThaoRepository.findAll(pageable);
        model.addAttribute("totalPage", page.getTotalPages());
        model.addAttribute("listPage", page.getContent());

        List<Integer> pageNumbers = new ArrayList<>();
        int totalPages = page.getTotalPages();
        int currentPage = pageNum;
        int startPage, endPage;

        if (totalPages <= 5) {
            startPage = 1;
            endPage = totalPages;
        } else {
            if (currentPage <= 3) {
                startPage = 1;
                endPage = 5;
            } else if (currentPage + 2 >= totalPages) {
                startPage = totalPages - 4;
                endPage = totalPages;
            } else {
                startPage = currentPage - 2;
                endPage = currentPage + 2;
            }
        }

        for (int i = startPage; i <= endPage; i++) {
            pageNumbers.add(i);
        }

        model.addAttribute("pageNumbers", pageNumbers);
        model.addAttribute("currentPage", currentPage);


        try {
            double maxSale = 0.0; // Sử dụng một biến để lưu giữ giá trị lớn nhất của sale
            List<ChuongTrinhGiamGiaChiTietGiayTheThao> listSale = chuongTrinhGiamGiaChiTietGiayTheThaoRepository.findByGiayTheThao_Id(id);

            for (ChuongTrinhGiamGiaChiTietGiayTheThao sale : listSale) {
                if (sale.getTrangThai() == 1 && sale.getChuongTrinhGiamGiaGiayTheThao().getTrangThai() == 1) {
                    double currentSale = sale.getChuongTrinhGiamGiaGiayTheThao().getPhanTramGiam();
                    if (currentSale > maxSale) {
                        maxSale = currentSale;
                    }
                }
            }

            if (maxSale > 0) {
                model.addAttribute("sale", maxSale);
            } else {
                model.addAttribute("sale", 0);
            }
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("sale", null);
            model.addAttribute("giayTheThao", giayTheThao);
        }



    }

    //Todo code list giày thể thao Deals of the Week bên trang chủ

    @RequestMapping(value = "GiayTheThao/listGiayTheThaoDealsOfTheWeek")
    public String listGiayTheThaoDealsOfTheWeek(Model model,
                                                @RequestParam(value = "pageNum", required = false, defaultValue = "1") Integer pageNum,
                                                @RequestParam(value = "pageSize", required = false, defaultValue = "12") Integer pageSize) {

        List<GiayTheThaoChiTiet> lstGiayTheThaoDealsOfTheWeek = giayTheThaoChiTietRepository.findAll();
        model.addAttribute("lstGiayTheThaoDealsOfTheWeek", lstGiayTheThaoDealsOfTheWeek);

        Pageable pageable = PageRequest.of(pageNum - 1, pageSize);
        Page<GiayTheThaoChiTiet> page = giayTheThaoChiTietRepository.findAll(pageable);

        model.addAttribute("totalPage", page.getTotalPages());
        model.addAttribute("listPage", page.getContent());


        return "/templates/Users/index";

    }

    //Todo code lọc
    @GetMapping("/GiayTheThao/find/{idGiayTheThao}/{idMauSac}/{idSize}")
    public ResponseEntity<?> find(
            @PathVariable UUID idGiayTheThao,
            @PathVariable UUID idMauSac,
            @PathVariable UUID idSize) {

        System.out.println("Mã giầy thể thao :" + idGiayTheThao);
        System.out.println("Mã màu sắc: " + idMauSac);
        System.out.println("Mã size" + idSize);

        GiayTheThaoChiTiet giayTheThaoChiTiet = giayTheThaoChiTietRepository.findIdByIdGiayTheThaoMsSize(idGiayTheThao, idMauSac, idSize);

        return ResponseEntity.ok(giayTheThaoChiTiet.getSoLuong());

    }

    //Todo code detail giầy thể thao chi tiết
    @GetMapping("GiayTheThao/detailThongTinGiayTheThao/{id}")
    public String detailChiTietGiayTheThao(@PathVariable UUID id, Model model,//id là id của giầy thể thao
                                           @RequestParam(value = "pageNum", required = false, defaultValue = "1") Integer pageNum,
                                           @RequestParam(value = "pageSize", required = false, defaultValue = "4") Integer pageSize,
                                           HttpSession session,
                                           HttpServletRequest request) {

        if (session.getAttribute("khachHangLog") != null) {

            System.out.println("Đã đăng nhập tài khoản!");

            detailGiayTheThaoChiTietTrangChu(model, id, pageNum, pageSize);
            return "/templates/Users/Layouts/Shop/detailGiayTheThaoLogin";


        } else {

            System.out.println("Chưa đăng nhập tài khoản!");
            detailGiayTheThaoChiTietTrangChu(model, id, pageNum, pageSize);
            return "/templates/Users/Layouts/Shop/detailGiayTheThao";

        }
    }
}
