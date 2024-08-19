<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ taglib

        prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f"
           uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib
        uri="http://www.springframework.org/tags/form" prefix="sf" %>


<html>
<head>
    <head>

        <meta charset="UTF-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>

        <title>Bán hàng tại quầy</title>
        <link
                href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
                rel="stylesheet"
                integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
                crossorigin="anonymous"
        />

        <link
                rel="stylesheet"
                href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.2/font/bootstrap-icons.css"
                integrity="sha384-b6lVK+yci+bfDmaY1u0zE8YYJt0TZxLEAFyYSLHId4xoVvsrQu3INevFKo+Xir8e"
                crossorigin="anonymous"
        />
        <style>
            .info {

                margin: 0 auto;
                height: 750px;
                width: 1000px;
                border: 1px solid rgb(173, 172, 172);
            }


            #listSP {

                margin-top: 20px;
                margin-bottom: 20px;
                height: 600px;
                overflow: auto;

            }


            ::-webkit-scrollbar {
                width: 2px;
            }

            ::-webkit-scrollbar-thumb {
                background: #888;
            }

            #saleInvoice {

                width: 80%;
                margin: 0 auto;
            }
        </style>
    </head>
<body>

<header class="p-3 mb-3 border-bottom">
    <div class="container">
        <div
                class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start"
        >
            <a
                    href="http://localhost:8080/BanHangTaiQuay"
                    class="d-flex align-items-center mb-2 mb-lg-0 text-dark text-decoration-none"
                    id="banner"
            >

                Quay Lại

            </a>

            <div
                    class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0"
            >

            </div>
            <%--                --%>
            <div class="hello" style="margin-left: 100px">
                <a style="color: red">Xin chào: ${userLog.tenUser} ( ${userLog.role} )</a>
            </div>
            <%--                --%>
            <div class="dropdown text-end">
                <a
                        href="#"
                        class="d-block link-dark text-decoration-none dropdown-toggle"
                        id="dropdownUser1"
                        data-bs-toggle="dropdown"
                        aria-expanded="false"
                >
                    <img
                            src="/img/undraw_profile.svg"
                            alt="mdo"
                            width="32"
                            height="32"
                            class="rounded-circle"
                    />
                </a>

                <ul
                        class="dropdown-menu text-small"
                        aria-labelledby="dropdownUser1"
                >
                    <li><a class="dropdown-item" href="#">New project...</a></li>
                    <li><a class="dropdown-item" href="#">Settings</a></li>
                    <li><a class="dropdown-item" href="#">Profile</a></li>

                    <li>
                        <hr class="dropdown-divider"/>
                    </li>

                    <li><a class="dropdown-item" href="#">Sign out</a></li>
                </ul>
            </div>
        </div>
    </div>
</header>
<%--<div class="row">--%>
<%-- Flie hóa đơn in ra   --%>

<section>
    <div class="info">
        <div id="listSP">
            <h5 style="text-align: center;line-height: 50px;">HÓA ĐƠN THANH TOÁN</h5>
            <h6 class="text-center">* Poly Shoes: 80/21 Đường Xuân Phương - Nam Từ Liêm - Hà Nội *</h6>
            <h5 class="text-center">------------------------------------------------------------</h5>
            <%--            Bảng thông tin chung--%>
            <table class="table table-hover" style="text-align: center">
                <tbody>
                <c:if test="${f:length(list)!=0}">
                    <c:forEach items="${list}" var="hdct" varStatus="status" begin="0" end="0">
                        <tr>
                            <td colspan="6" style="text-align: left; font-weight: bold">Mã hóa đơn:</td>
                            <td style="text-align: left">${hdct.hoaDon.maHoaDon}</td>
                        </tr>
                        <tr>
                            <td colspan="6" style="text-align: left; font-weight: bold">Ngày thanh toán:</td>
                            <td style="text-align: left">${hdct.ngayTao}</td>
                        </tr>
                    </c:forEach>
                    <tr>
                        <td colspan="6" style="text-align: left; font-weight: bold">Nhân viên bán hàng:</td>
                        <td style="text-align: left">${userLog.tenUser}</td>
                    </tr>

                </c:if>
                </tbody>
            </table>

            <%--            bảng thông tin san pham thanh toan--%>
            <table class="table table-hover" style="text-align: center">
                <thead>
                <tr>
                    <th scope="col">STT</th>
                    <th scope="col">Tên</th>
                    <th scope="col">Size</th>
                    <th scope="col">Màu sắc</th>
                    <th scope="col">Số lượng</th>
                    <th scope="col">Đơn giá</th>
                    <th scope="col">Tổng</th>
                </tr>
                </thead>
                <tbody>

                <c:if test="${f:length(list)!=0}">
                    <c:forEach items="${list}" var="hdct" varStatus="status">
                        <tr>
                            <td>${status.index+1}</td>

                            <td>${hdct.giayTheThaoChiTiet.giayTheThao.tenGiayTheThao}</td>
                            <td>${hdct.giayTheThaoChiTiet.size.size}</td>
                            <td>${hdct.giayTheThaoChiTiet.mauSac.tenMauSac}</td>

                            <td>${hdct.soLuong}</td>
                            <td>${hdct.donGia}</td>
                            <td>${hdct.soLuong*hdct.donGia}</td>
                        </tr>
                    </c:forEach>
                    <tr>
                        <td colspan="6" style="text-align: left;">Tổng tiền:</td>
                        <td id="total">${tt}</td>
                    </tr>
                    <tr>
                        <td colspan="6" style="text-align: left;">Phần trăm giảm:</td>
                        <td id="ptg">0%</td>
                    </tr>
                    <tr>
                        <td colspan="6" style="text-align: left;">Số tiền giảm:</td>
                        <td id="stg">0</td>
                    </tr>
                    <tr>
                        <td colspan="6" style="text-align: left;">Tiền thanh toán:</td>
                        <td id="ttt">${tt}</td>
                    </tr>

                </c:if>
                <tr>
                    <td colspan="6" style="text-align: left;">Tiền khách đưa:</td>
                    <td><input type="number" id="tienKhachDua" oninput="tinhTienThua()"
                               placeholder="Nhập số tiền..."> VND
                    </td>

                </tr>
                <tr>
                    <td colspan="6" style="text-align: left;">Tiền thừa:</td>
                    <td id="tt">0 VND</td>
                </tr>
                </tbody>
            </table>
        </div>
        <%--  Nút chọn Voucher      --%>
        <div class="row container text-center">
            <div class="col-md-10">
                <div id="saleInvoice">
                    <div class="mb-3 row">
                        <label class="col-sm-2 col-form-label">Voucher</label>
                        <div class="col-sm-10">

                            <select class="form-select form-select" aria-label=".form-select example" id="ctggSelect"
                                    onchange="showAlert()">
                                <option selected>Chương trình giảm giá</option>
                                <c:if test="${f:length(listCtgg)!=0}">
                                    <c:forEach items="${listCtgg}" var="ctgg" varStatus="status">
                                        <option value="${ctgg.id}">${ctgg.tenChuongTrinh}</option>

                                    </c:forEach>

                                </c:if>
                            </select>

                        </div>

                    </div>

                </div>
            </div>
            <%--Nút hủy Vocher--%>
            <div class="col-md-1">
                <a href="#" class="btn btn-success" onclick="reloadPage()">Hủy</a>
            </div>
            <%--Nút thanh toán tiền mặt--%>
        </div>

        <%--button thanh toán--%>
        <div class="row container">
            <div class="col-md">
                <form>
                    <div style="margin: 0 auto; width: 80%;">
                        <button class="btn btn-success" style="width:100%;" id="pay">Thanh toán tiền mặt</button>
                    </div>
                </form>
            </div>
            <%-- button quét mã QR               --%>
            <%--            <div class="col-md">--%>
            <%--                <form>--%>
            <%--                    <div style="margin: 0 auto; width: 80%;">--%>
            <%--                        <button class="btn btn-success" style="width:100%;" onclick="openMomoPayment()">Quét QR MOMO--%>
            <%--                        </button>--%>
            <%--                    </div>--%>
            <%--                </form>--%>
            <%--            </div>--%>
        </div>

    </div>
    <%-- Modal thông báo nhập ô input tiền khách đưa   --%>
    <div class="modal fade" id="alertModal" tabindex="-1" aria-labelledby="alertModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="alertModalLabel">Thông báo</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    Vui lòng nhập số đúng số tiền khách đưa !
                </div>
                <div class="modal-footer">
                    <button id="modalOKBtn" type="button" class="btn btn-primary" data-bs-dismiss="modal">OK</button>
                </div>
            </div>
        </div>
    </div>

    <%--Kết thúc modal thông báo--%>
</section>


<script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous"
></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.3.0/jspdf.umd.min.js"></script>
<!-- Js PDF Auto Table -->
<script src="https://cdn.jsdelivr.net/npm/jspdf-autotable@3/dist/jspdf.plugin.autotable.min.js"></script>
<script src="https://html2canvas.hertzen.com/dist/html2canvas.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.7.6/dist/sweetalert2.all.min.js"></script>


<%--<script>--%>
<%--    &lt;%&ndash;  thanh toán bằng momo  &ndash;%&gt;--%>
<%--    &lt;%&ndash; Khai báo biến tham chiếu đến nút ok khi bật modal &ndash;%&gt;--%>
<%--    var alertModal = new bootstrap.Modal(document.getElementById('alertModal'));--%>
<%--    var modalOKBtn = document.getElementById('modalOKBtn'); // Tham chiếu đến nút "OK"--%>
<%--    // Test chương trình:--%>
<%--    // Lắng nghe sự kiện click vào nút "OK"--%>
<%--    modalOKBtn.addEventListener('click', function () {--%>
<%--        var tienKhachDuaInput = document.getElementById("tienKhachDua");--%>
<%--        tienKhachDuaInput.focus(); // Đưa con trỏ vào ô input--%>
<%--    });--%>


<%--    &lt;%&ndash;funtion thông báo nhập tiền khách đưa&ndash;%&gt;--%>

<%--    function showCustomAlertModal() {--%>
<%--        var alertModal = new bootstrap.Modal(document.getElementById('alertModal'));--%>
<%--        alertModal.show();--%>
<%--    }--%>


<%--    &lt;%&ndash;funtion Hủy&ndash;%&gt;--%>

<%--    function reloadPage() {--%>
<%--        location.reload();--%>
<%--    }--%>

<%--    &lt;%&ndash;    Test function tiền thừa &ndash;%&gt;--%>
<%--    &lt;%&ndash;    test 3&ndash;%&gt;--%>

<%--    function tinhTienThua() {--%>
<%--        const tongTien = parseFloat(document.getElementById("ttt").innerText);--%>
<%--        const tienKhachDua = parseFloat(document.getElementById("tienKhachDua").value);--%>
<%--        const tienThua = tienKhachDua - tongTien;--%>
<%--        const ttElement = document.getElementById("tt");--%>

<%--        if (tienThua >= 0) {--%>
<%--            ttElement.textContent = tienThua + " VND";--%>
<%--        } else {--%>
<%--            ttElement.textContent = "Số tiền khách đưa không đủ!";--%>
<%--        }--%>
<%--    }--%>

<%--    var totals = document.getElementById('total').innerText;--%>
<%--    var totalSale = totals;--%>
<%--    var idCTGGCTHD = '';--%>
<%--    var url = new URL(window.location.href);--%>
<%--    var pathName = url.pathname;--%>
<%--    var idHD = pathName.split('/').pop();--%>

<%--    // test 3--%>
<%--    function showAlert() {--%>
<%--        var selectedValue = document.getElementById("ctggSelect").value;--%>
<%--        var totalElement = document.getElementById('total');--%>
<%--        var totals = parseInt(totalElement.innerText); // Lấy tổng tiền hiện tại--%>
<%--        var stgElement = document.getElementById('stg');--%>
<%--        var tttElement = document.getElementById('ttt');--%>
<%--        var ptgElement = document.getElementById('ptg');--%>

<%--        if (selectedValue != 'Chương trình giảm giá') {--%>
<%--            getCtggById(selectedValue, (data) => {--%>
<%--                var phanTramGiam = parseInt(data.phanTramGiam);--%>
<%--                var salePrice = totals - totals * phanTramGiam / 100;--%>
<%--                tttElement.innerText = salePrice;--%>
<%--                stgElement.innerText = parseInt(totals) - salePrice;--%>
<%--                ptgElement.innerText = "-" + phanTramGiam + "%";--%>
<%--                totalElement.innerText = salePrice;--%>

<%--                // Sau khi cập nhật tổng tiền, gọi lại hàm tính tiền thừa--%>
<%--                tinhTienThua();--%>
<%--            });--%>
<%--        } else {--%>
<%--            // Đặt lại số tiền thanh toán, số tiền giảm, và các phần liên quan về giá trị ban đầu--%>
<%--            tttElement.innerText = totals;--%>
<%--            stgElement.innerText = 0;--%>
<%--            ptgElement.innerText = "0%";--%>
<%--            totalElement.innerText = totals;--%>

<%--            // Sau khi cập nhật tổng tiền, gọi lại hàm tính tiền thừa--%>
<%--            tinhTienThua();--%>
<%--        }--%>
<%--    }--%>


<%--    function getCtggById(id, callback) {--%>

<%--        fetch("http://localhost:8080/api/ctgg/" + id)--%>

<%--            .then(response => {--%>
<%--                if (!response.ok) {--%>
<%--                    throw new Error('Network response was not ok');--%>
<%--                }--%>
<%--                return response.json();--%>
<%--            })--%>
<%--            .then(callback)--%>

<%--            .catch(error => {--%>
<%--                console.error("Error: ", error);--%>
<%--            })--%>
<%--    }--%>

<%--    document.getElementById('pay').addEventListener('click', (event) => {--%>
<%--        event.preventDefault();--%>
<%--        pay(idHD)--%>
<%--    });--%>

<%--    //--%>
<%--    function pay(id) {--%>
<%--        // Lấy giá trị của ô input tiền khách đưa--%>
<%--        const tienKhachDuaInput = document.getElementById("tienKhachDua");--%>
<%--        const tienKhachDua = parseFloat(tienKhachDuaInput.value);--%>

<%--        // Kiểm tra nếu ô input trống--%>
<%--        if (!tienKhachDuaInput.value.trim()) {--%>
<%--            // Hiển thị thông báo hoặc xử lý nếu cần--%>
<%--            showCustomAlertModal();--%>
<%--            // alert("Vui lòng nhập số tiền khách đưa!");--%>
<%--            // Đưa con trỏ vào ô input--%>
<%--            tienKhachDuaInput.focus();--%>
<%--            return; // Dừng hàm và không thực hiện các bước tiếp theo--%>
<%--        }--%>

<%--        // Các bước tiếp theo sẽ thực hiện khi ô input không trống--%>
<%--        console.log('b');--%>
<%--        console.log(totalSale);--%>

<%--        if ((totalSale < totals)) {--%>
<%--            console.log('a');--%>
<%--            createCtggctHD(id, idCTGGCTHD, totals);--%>
<%--        }--%>

<%--        fetch("http://localhost:8080/api/hd/pay/" + id, {--%>
<%--            method: 'POST',--%>
<%--            headers: {--%>
<%--                'Content-Type': 'application/json',--%>
<%--            },--%>
<%--            body: JSON.stringify([totalSale]),--%>
<%--        })--%>
<%--            .then(response => {--%>
<%--                if (!response.ok) {--%>
<%--                    throw new Error('Network response was not ok');--%>
<%--                }--%>
<%--                return response.text();--%>
<%--            })--%>
<%--            .then((datas) => {--%>
<%--                if (datas == "Thanh toán thành công") {--%>
<%--                    printInvoice();--%>
<%--                    Swal.fire({--%>
<%--                        icon: 'success',--%>
<%--                        title: '<span style="font-size: 24px;">Thanh toán thành công !</span>',--%>
<%--                        showConfirmButton: false,--%>
<%--                        timer: 1500,--%>
<%--                    }).then(() => {--%>
<%--                        window.location.href = '${pageContext.request.contextPath}/BanHangTaiQuay';--%>
<%--                    });--%>
<%--                } else {--%>
<%--                    alert(datas);--%>
<%--                }--%>
<%--            })--%>
<%--            .catch(error => {--%>
<%--                console.error('Error during POST request:', error);--%>
<%--            });--%>
<%--    }--%>


<%--    function createCtggctHD(id, idctgg, tt) {--%>


<%--        fetch("http://localhost:8080/api/ctgg/create/" + id, {--%>

<%--            method: 'POST',--%>
<%--            headers: {--%>
<%--                'Content-Type': 'application/json',--%>
<%--            },--%>
<%--            body: JSON.stringify([idCTGGCTHD, tt]),--%>
<%--        })--%>
<%--            .then(response => {--%>
<%--                if (!response.ok) {--%>
<%--                    throw new Error('Network response was not ok');--%>
<%--                }--%>
<%--                return response.text();--%>
<%--            })--%>

<%--            .then(data => console.log('c'))--%>

<%--            .catch(error => {--%>
<%--                console.error('Error during POST request:', error);--%>
<%--            });--%>
<%--    }--%>

<%--    function printInvoice() {--%>
<%--        var element = document.getElementById('listSP');--%>

<%--        html2canvas(element).then(function (canvas) {--%>
<%--            var pdf = new jspdf.jsPDF('p', 'mm', 'a4');--%>

<%--            var imgData = canvas.toDataURL('image/png');--%>
<%--            pdf.addImage(imgData, 'PNG', 0, 0, 210, 297);--%>
<%--            pdf.save('test.pdf');--%>
<%--        })--%>


<%--    }--%>


<%--</script>--%>
<script>
    <%--  thanh toán bằng momo  --%>
    <%-- Khai báo biến tham chiếu đến nút ok khi bật modal --%>
    var alertModal = new bootstrap.Modal(document.getElementById('alertModal'));
    var modalOKBtn = document.getElementById('modalOKBtn'); // Tham chiếu đến nút "OK"
    // Test chương trình:
    // Lắng nghe sự kiện click vào nút "OK"
    modalOKBtn.addEventListener('click', function () {
        var tienKhachDuaInput = document.getElementById("tienKhachDua");
        tienKhachDuaInput.focus(); // Đưa con trỏ vào ô input
    });

    <%--funtion thông báo nhập tiền khách đưa--%>

    function showCustomAlertModal() {
        var alertModal = new bootstrap.Modal(document.getElementById('alertModal'));
        alertModal.show();
    }

    <%--funtion Hủy--%>

    function reloadPage() {
        location.reload();
    }

    <%--    Test function tiền thừa --%>
    <%--    test 3--%>
    // function tinhTienThua() {
    //     const tongTien = parseFloat(document.getElementById("ttt").innerText);
    //     const tienKhachDua = parseFloat(document.getElementById("tienKhachDua").value);
    //     const ttElement = document.getElementById("tt");
    //
    //     if (isNaN(tienKhachDua) || tienKhachDua < 0) {
    //         ttElement.textContent = "Số tiền không hợp lệ!";
    //     } else {
    //         const tienThua = tienKhachDua - tongTien;
    //         if (tienThua >= 0) {
    //             ttElement.textContent = tienThua + " VND";
    //         } else {
    //             ttElement.textContent = "Số tiền khách đưa không đủ!";
    //         }
    //     }
    // }
    //


    // Test 13/08/2024
    // Tham chiếu đến nút "Thanh toán tiền mặt"
    var payButton = document.getElementById('pay');

    function tinhTienThua() {
        // Lấy giá trị số tiền thanh toán từ phần tử có id="ttt"
        const tongTien = parseFloat(document.getElementById("ttt").innerText.replace(/[^0-9.-]+/g, '')) || 0;

        // Lấy giá trị số tiền khách đưa từ ô input
        const tienKhachDua = parseFloat(document.getElementById("tienKhachDua").value) || 0;

        // Tham chiếu đến phần tử để hiển thị thông báo
        const ttElement = document.getElementById("tt");

        // Kiểm tra nếu số tiền khách đưa nhỏ hơn số tiền thanh toán
        if (tienKhachDua < tongTien) {
            ttElement.textContent = "Số tiền khách đưa không đủ!";
            payButton.disabled = true; // Vô hiệu hóa nút thanh toán
        } else if (isNaN(tienKhachDua) || tienKhachDua < 0) {
            // Kiểm tra nếu số tiền khách đưa không hợp lệ
            ttElement.textContent = "Số tiền không hợp lệ!";
            payButton.disabled = true; // Vô hiệu hóa nút thanh toán
        } else {
            // Tính tiền thừa và hiển thị kết quả
            const tienThua = tienKhachDua - tongTien;
            ttElement.textContent = tienThua.toFixed(2) + " VND";
            payButton.disabled = false; // Kích hoạt nút thanh toán
        }
    }

    // Kết thúc test 13/08/2024

    var totals = document.getElementById('total').innerText;
    var totalSale = totals;
    var idCTGGCTHD = '';
    var url = new URL(window.location.href);
    var pathName = url.pathname;
    var idHD = pathName.split('/').pop();

    // test 3
    function showAlert() {
        var selectedValue = document.getElementById("ctggSelect").value;
        var totalElement = document.getElementById('total');
        var totals = parseInt(totalElement.innerText); // Lấy tổng tiền hiện tại
        var stgElement = document.getElementById('stg');
        var tttElement = document.getElementById('ttt');
        var ptgElement = document.getElementById('ptg');

        if (selectedValue != 'Chương trình giảm giá') {
            getCtggById(selectedValue, (data) => {
                var phanTramGiam = parseInt(data.phanTramGiam);
                var salePrice = totals - totals * phanTramGiam / 100;
                tttElement.innerText = salePrice;
                stgElement.innerText = parseInt(totals) - salePrice;
                ptgElement.innerText = "-" + phanTramGiam + "%";
                totalElement.innerText = salePrice;

                // Sau khi cập nhật tổng tiền, gọi lại hàm tính tiền thừa
                tinhTienThua();
            });
        } else {
            // Đặt lại số tiền thanh toán, số tiền giảm, và các phần liên quan về giá trị ban đầu
            tttElement.innerText = totals;
            stgElement.innerText = 0;
            ptgElement.innerText = "0%";
            totalElement.innerText = totals;

            // Sau khi cập nhật tổng tiền, gọi lại hàm tính tiền thừa
            tinhTienThua();
        }
    }

    function getCtggById(id, callback) {
        fetch("http://localhost:8080/api/ctgg/" + id)
            .then(response => {
                if (!response.ok) {
                    throw new Error('Network response was not ok');
                }
                return response.json();
            })
            .then(callback)
            .catch(error => {
                console.error("Error: ", error);
            });
    }

    document.getElementById('pay').addEventListener('click', (event) => {
        event.preventDefault();
        pay(idHD);
    });

    function pay(id) {
        // Lấy giá trị của ô input tiền khách đưa
        const tienKhachDuaInput = document.getElementById("tienKhachDua");
        const tienKhachDua = parseFloat(tienKhachDuaInput.value);

        // Kiểm tra nếu ô input trống hoặc là số âm hoặc không phải là số
        if (!tienKhachDuaInput.value.trim() || isNaN(tienKhachDua) || tienKhachDua <= 0) {
            // Hiển thị thông báo hoặc xử lý nếu cần
            showCustomAlertModal();
            // Đưa con trỏ vào ô input
            tienKhachDuaInput.focus();
            return; // Dừng hàm và không thực hiện các bước tiếp theo
        }

        // Các bước tiếp theo sẽ thực hiện khi ô input không trống
        console.log('b');
        console.log(totalSale);

        if ((totalSale < totals)) {
            console.log('a');
            createCtggctHD(id, idCTGGCTHD, totals);
        }

        fetch("http://localhost:8080/api/hd/pay/" + id, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify([totalSale]),
        })
            .then(response => {
                if (!response.ok) {
                    throw new Error('Network response was not ok');
                }
                return response.text();
            })
            .then((datas) => {
                if (datas == "Thanh toán thành công") {
                    printInvoice();
                    Swal.fire({
                        icon: 'success',
                        title: '<span style="font-size: 24px;">Thanh toán thành công !</span>',
                        showConfirmButton: false,
                        timer: 1500,
                    }).then(() => {
                        window.location.href = '${pageContext.request.contextPath}/BanHangTaiQuay';
                    });
                } else {
                    alert(datas);
                }
            })
            .catch(error => {
                console.error('Error during POST request:', error);
            });
    }

    function createCtggctHD(id, idctgg, tt) {
        fetch("http://localhost:8080/api/ctgg/create/" + id, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify([idCTGGCTHD, tt]),
        })
            .then(response => {
                if (!response.ok) {
                    throw new Error('Network response was not ok');
                }
                return response.text();
            })
            .then(data => console.log('c'))
            .catch(error => {
                console.error('Error during POST request:', error);
            });
    }

    function printInvoice() {
        var element = document.getElementById('listSP');

        html2canvas(element).then(function (canvas) {
            var pdf = new jspdf.jsPDF('p', 'mm', 'a4');

            var imgData = canvas.toDataURL('image/png');
            pdf.addImage(imgData, 'PNG', 0, 0, 210, 297);
            pdf.save('test.pdf');
        });
    }
</script>
</body>
</html>