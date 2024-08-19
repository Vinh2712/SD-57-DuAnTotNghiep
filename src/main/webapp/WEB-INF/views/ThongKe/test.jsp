<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<html>
<head>
    <title>Thống kê dữ liệu</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
          rel="stylesheet">
    <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"
    />

</head>
<body>
<%@ include file="../templates/Admin/Layouts/GiayTheThao/_HeaderGiayTheThao.jsp" %>


<div class="container" style="margin-bottom: 50px">
    <div class="title">
        <div class="container mt-5">
            <div class="container mt-5">

                <div class="row">

                    <!-- Start Date Picker -->
                    <div class="col-xl-3 col-md-6 mb-4">
                        <div class="form-group">
                            <label for="startDate">Từ ngày:</label>
                            <input type="date" class="form-control" id="startDate" required>
                            <span id="startDateError" class="text-danger" style="font-style: italic; display: none;">Ngày bắt đầu không thể lớn hơn ngày kết thúc</span>
                        </div>
                    </div>

                    <!-- End Date Picker -->
                    <div class="col-xl-3 col-md-6 mb-4">
                        <div class="form-group">
                            <label for="endDate">Đến ngày:</label>
                            <input type="date" class="form-control" id="endDate" required>
                            <span id="endDateError" class="text-danger" style="font-style: italic; display: none;">Ngày kết thúc không thể nhỏ hơn ngày bắt đầu</span>
                        </div>
                    </div>

                    <!-- Search Button -->
                    <div class="col-xl-3 col-md-6 mb-4 d-flex align-items-end">
                        <button style="margin-bottom: 14px" type="button"
                                class="btn btn-success w-100" onclick="searchTong()">
                            Tìm kiếm
                        </button>
                    </div>

                </div>

            </div>
            <div class="row">
                <!-- Earnings (Monthly) Card Example -->
                <div class="col-xl-3 col-md-6 mb-4">
                    <div class="card border-left-primary shadow h-100 py-2">
                        <div class="card-body">
                            <div class="row no-gutters align-items-center">
                                <div class="col mr-2">
                                    <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
                                        Tổng doanh thu
                                    </div>
                                    <div id="tongDoanhThu"
                                         class="h5 mb-0 font-weight-bold text-gray-800"
                                         style="margin-top: 20px">
                                        <fmt:formatNumber type="" value="${tongDoanhThu}"
                                                          pattern="#,##0.###"/>
                                        <span style="color: red;font-size: 15px;">VNĐ</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-xl-3 col-md-6 mb-4">
                    <div class="card border-left-primary shadow h-100 py-2">
                        <div class="card-body">
                            <div class="row no-gutters align-items-center">
                                <div class="col mr-2">
                                    <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
                                        Tổng đơn hàng đã bán
                                    </div>
                                    <div id="tongDonHang"
                                         class="h5 mb-0 font-weight-bold text-gray-800"
                                         style="margin-top: 20px">${tongDonHang}</div>
                                </div>
                                <div class="col-auto">
                                    <i class="fa fa-shopping-cart fa-2x text-gray-300"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-xl-3 col-md-6 mb-4">
                    <div class="card border-left-primary shadow h-100 py-2">
                        <div class="card-body">
                            <div class="row no-gutters align-items-center">
                                <div class="col mr-2">
                                    <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
                                        Đã bán tại quầy / online
                                    </div>
                                    <div class="h5 mb-0 font-weight-bold text-gray-800"
                                         style="margin-top: 20px">
                                        <span id="tongHoaDonTaiQuay">${tongHoaDonTaiQuay}</span> /
                                        <span id="tongHoaDonOnline">${tongHoaDonOnline}</span>
                                    </div>
                                </div>
                                <div class="col-auto">
                                    <i class="fa fa-shopping-cart fa-2x text-gray-300"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>


                <%--                <div class="col-xl-3 col-md-6 mb-4">--%>
                <%--                    <div class="card border-left-success shadow h-100 py-2">--%>
                <%--                        <div class="card-body">--%>
                <%--                            <div class="row no-gutters align-items-center">--%>
                <%--                                <div class="col mr-2">--%>
                <%--                                    <div class="text-xs font-weight-bold text-success text-uppercase mb-1">--%>
                <%--                                        Sản phẩm bán chạy nhất--%>
                <%--                                    </div>--%>
                <%--                                    <div class="h5 mb-0 font-weight-bold text-gray-800">${maSanPhamBanChayNhat}</div>--%>
                <%--                                    <div class="h5 mb-0 font-weight-bold text-gray-800">Đã bán: ${soLuongDaBan}</div>--%>
                <%--                                </div>--%>
                <%--                                <div class="col-auto">--%>
                <%--                                    <i class="fas fa-dollar-sign fa-2x text-gray-300"></i>--%>
                <%--                                </div>--%>
                <%--                            </div>--%>
                <%--                        </div>--%>
                <%--                    </div>--%>
                <%--                </div>--%>

                <div class="col-xl-3 col-md-6 mb-4">
                    <div class="card border-left-info shadow h-100 py-2">
                        <div class="card-body">
                            <div class="row no-gutters align-items-center">
                                <div class="col mr-2">
                                    <div class="text-xs font-weight-bold text-info text-uppercase mb-1">
                                        Đã bán/ Tổng sản
                                        phẩm cả kho
                                    </div>
                                    <div class="row no-gutters align-items-center">
                                        <div class="col-auto">
                                            <div id="totalQuantity"
                                                 class="h5 mb-0 mr-3 font-weight-bold text-gray-800"
                                                 style="margin-top: 15px">${tongDonHang}
                                                / ${totalQuantity}</div>
                                        </div>
                                        <%--                                                    <div class="col">--%>
                                        <%--                                                        <div class="progress progress-sm mr-2">--%>
                                        <%--                                                            <div class="progress-bar bg-info" role="progressbar" style="width: 20%"--%>
                                        <%--                                                                 aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>--%>
                                        <%--                                                        </div>--%>
                                        <%--                                                    </div>--%>
                                    </div>
                                </div>
                                <%--                                            <div class="col-auto">--%>
                                <%--                                                <i class="fas fa-clipboard-list fa-2x text-gray-300"></i>--%>
                                <%--                                            </div>--%>
                            </div>
                        </div>
                    </div>
                </div>


            </div>
            <button id="thongKeSanPham" class="btn btn-primary" type="button"
                    data-bs-toggle="collapse"
                    data-bs-target="#collapseExample"
                    aria-expanded="false" aria-controls="collapseExample"
                    onclick="thongKeSanPham()">
                Biểu đồ số lượng sản phẩm
            </button>

            <button id="thongKeHoaDon" class="btn btn-primary" type="button"
                    data-bs-toggle="collapse"
                    data-bs-target="#collapseExample1"
                    aria-expanded="false" aria-controls="collapseExample1"
                    onclick="thongKeDoanhThu()">
                Biểu đồ doanh thu
            </button>

            <button id="top5banChay" class="btn btn-primary" type="button"
                    data-bs-toggle="collapse"
                    data-bs-target="#collapseExample2"
                    aria-expanded="false" aria-controls="collapseExample2"
                    onclick="top5BanChay()">
                Top 5 Sản Phẩm bán chạy
            </button>

            <div class="collapse" id="collapseExample">
                <br>
                <h2 style="text-align: center; color: #ad5389;font-weight: bolder">Biểu đồ sản
                    phẩm</h2>
                <div class="card card-body">
                    <div>
                        <button id="barChartButton" class="btn btn-success">Biểu đồ Bar</button>
                        <button id="lineChartButton" class="btn btn-danger">Biểu đồ Line</button>
                        <button id="pieChartButton" class="btn btn-warning">Biểu đồ Pie</button>
                    </div>
                    <canvas id="productChart" width="400" height="200"></canvas>
                </div>
            </div>

            <div class="collapse" id="collapseExample1">
                <br>
                <h2 style="text-align: center; color: #0DDB9F;font-weight: bolder">Biểu đồ doanh
                    thu</h2>
                <div class="card card-body">
                    <div>
                        <div class="container mt-5">
                            <button id="barChartButton1" class="btn btn-success">Biểu đồ Bar
                            </button>
                            <button id="lineChartButton1" class="btn btn-danger">Biểu đồ Line
                            </button>
                            <button id="pieChartButton1" class="btn btn-warning">Biểu đồ Pie
                            </button>
                            <canvas id="productChart1" width="400" height="200"></canvas>
                        </div>
                    </div>
                </div>
            </div>

            <div class="collapse" id="collapseExample2">
                <br>
                <h2 style="text-align: center; color: #6a12c9;font-weight: bolder">Biểu đồ Top 5 sản
                    phẩm bán chạy</h2>
                <div class="card card-body">
                    <div>
                        <div class="container mt-5">
                            <button id="barChartButton2" class="btn btn-success">Biểu đồ Bar
                            </button>
                            <button id="lineChartButton2" class="btn btn-danger">Biểu đồ Line
                            </button>
                            <button id="pieChartButton2" class="btn btn-warning">Biểu đồ Pie
                            </button>
                            <canvas id="productChart2" width="400" height="200"></canvas>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>

<%--<%@ include file="../templates/Admin/Layouts/GiayTheThao/_FooterGiayTheThao.jsp" %>--%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
<script src="/vendor/jquery/jquery.min.js"></script>
<script src="/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="/vendor/jquery-easing/jquery.easing.min.js"></script>
<script src="/js/sb-admin-2.min.js"></script>
<script src="/vendor/chart.js/Chart.min.js"></script>
<script src="/js/demo/chart-area-demo.js"></script>
<script src="/js/demo/chart-pie-demo.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
        integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"
        integrity="sha384-fbbOQedDUMZZ5KreZpsbe1LCZPVmfTnH7ois6mU1QK+m14rQ1l2bGBq41eYeM/fS"
        crossorigin="anonymous"></script>

<%--Js cho biểu đồ--%>

<%--Done--%>
<script>

  var currentChart;

  var currentChart2;

  var currentChart3;

  var productNames = [];
  var productQuantities = [];
  var size = [];
  var mauSac = [];

  var productNgayThanhToan = [];
  var productTongTien = [];

  var productNameToTop5 = [];
  var colorsTop5 = [];
  var sizeTop5 = [];
  var totalQuantityTop5 = [];

  function formatDate(dateString) {
    var date = moment(dateString, 'YYYY-MM-DDTHH:mm:ss');
    if (date.isValid()) {
      return date.format('DD/MM/YYYY');
    } else {
      return 'Invalid date';
    }
  }

  // Hàm changeChartType được khai báo ở ngoài để có thể truy cập toàn cục
  function changeChartType(chartType) {
    if (currentChart) {
      currentChart.destroy();
    }

    var ctx = document.getElementById('productChart').getContext('2d');
    var chartData = {
      labels: productNames,
      datasets: [{
        label: 'Số lượng sản phẩm',
        data: productQuantities,
        backgroundColor: 'rgba(255,0,116,0.2)',
        borderColor: 'rgb(238,36,107)',
        borderWidth: 1
      }]
    };

    if (chartType === 'bar') {
      currentChart = new Chart(ctx, {
        type: 'bar',
        data: chartData,
        options: {
          scales: {
            y: {
              beginAtZero: true,
              max: 50
            }
          },
          plugins: {
            legend: {
              display: false
            },
            datalabels: {
              anchor: 'end',
              align: 'top',
            }
          },
          tooltips: {
            enabled: true,
            mode: 'index',
            intersect: false,
            callbacks: {
              title: function (tooltipItems, data) {
                var index = tooltipItems[0].dataIndex;
                return data.labels[index];
              },
              label: function (tooltipItem, data) {
                var datasetLabel = data.datasets[tooltipItem.datasetIndex].label || '';
                return datasetLabel + ': ' + tooltipItem.yLabel;
              },
              afterLabel: function (tooltipItem, data) {
                var index = tooltipItem.index;
                return 'Size: ' + size[index] + '\nMàu sắc: ' + mauSac[index];
              }
            }
          },
          barPercentage: 0.5,
          categoryPercentage: 0.7,
        }
      });
    } else if (chartType === 'line') {
      currentChart = new Chart(ctx, {
        type: 'line',
        data: chartData,
        options: {
          scales: {
            y: {
              beginAtZero: true,
              max: 50
            }
          },
          plugins: {
            legend: {
              display: false
            },
            datalabels: {
              anchor: 'end',
              align: 'top',
            }
          },
          elements: {
            line: {
              tension: 0.4, // Điều chỉnh độ đoạn của đường
              borderWidth: 2, // Độ dày của đường
              fill: true,
            }
          }
        }
      });
    } else if (chartType === 'pie') {
      currentChart = new Chart(ctx, {
        type: 'pie',
        data: {
          labels: productNames,
          datasets: [{
            label: "Số lượng sản phẩm",
            data: productQuantities,
            backgroundColor: [
              'rgba(75, 192, 192, 0.2)',
              'rgba(153, 102, 255, 0.2)',
              'rgba(255, 159, 64, 0.2)',
              'rgba(255, 0, 0, 0.2)',
              'rgba(0, 255, 0, 0.2)',
              'rgba(0, 0, 255, 0.2)',
              'rgba(128, 128, 0, 0.2)',
              'rgba(255, 99, 132, 0.2)',
              'rgba(54, 162, 235, 0.2)',
              'rgba(255, 206, 86, 0.2)',
              'rgba(75, 192, 192, 0.2)',
              'rgba(153, 102, 255, 0.2)',
              'rgba(255, 159, 64, 0.2)',
              'rgba(255, 99, 132, 0.2)',
              'rgba(54, 162, 235, 0.2)',
              'rgba(255, 206, 86, 0.2)',
            ],
            borderColor: [
              'rgba(75, 192, 192, 0.2)',
              'rgba(153, 102, 255, 0.2)',
              'rgba(255, 159, 64, 0.2)',
              'rgba(255, 0, 0, 0.2)',
              'rgba(0, 255, 0, 0.2)',
              'rgba(0, 0, 255, 0.2)',
              'rgba(128, 128, 0, 0.2)',
              'rgba(255, 99, 132, 0.2)',
              'rgba(54, 162, 235, 0.2)',
              'rgba(255, 206, 86, 0.2)',
              'rgba(75, 192, 192, 0.2)',
              'rgba(153, 102, 255, 0.2)',
              'rgba(255, 159, 64, 0.2)',
              'rgba(255, 99, 132, 0.2)',
              'rgba(54, 162, 235, 0.2)',
              'rgba(255, 206, 86, 0.2)',
            ],
            borderWidth: 1
          }]
        },
        options: {
          plugins: {
            legend: {
              display: true,
              position: 'right'
            }
          },

          aspectRatio: 3
        }
      });
    }
  }

  function changeChartType2(chartType) {

    if (currentChart2) {
      currentChart2.destroy();
    }

    var ctx = document.getElementById('productChart1').getContext('2d');

    var chartData = {
      labels: productNgayThanhToan.map(formatDate),
      datasets: [{
        label: 'Tổng tiền',
        data: productTongTien,
        backgroundColor: 'rgba(75, 192, 192, 0.2)',
        borderColor: 'rgba(75, 192, 192, 1)',
        borderWidth: 1
      }]
    };

    if (chartType === 'bar') {
      currentChart2 = new Chart(ctx, {
        type: 'bar',
        data: chartData,
        options: {
          scales: {
            y: {
              beginAtZero: true,
            }
          },
          plugins: {
            legend: {
              display: false
            },
            datalabels: {
              anchor: 'end',
              align: 'top',
            }
          },
          barPercentage: 0.5,
          categoryPercentage: 0.7,
        }
      });
    } else if (chartType === 'line') {
      currentChart2 = new Chart(ctx, {
        type: 'line',
        data: chartData,
        options: {
          scales: {
            y: {
              beginAtZero: true,
            }
          },
          plugins: {
            legend: {
              display: false
            },
            datalabels: {
              anchor: 'end',
              align: 'top',
            }
          },
          elements: {
            line: {
              tension: 0.4,
              borderWidth: 2,
              fill: true,
            }
          }
        }
      });

    } else if (chartType === 'pie') {
      currentChart2 = new Chart(ctx, {
        type: 'pie',
        data: {
          labels: productNgayThanhToan.map(formatDate),
          datasets: [{
            label: "Tổng tiền",
            data: productTongTien,
            backgroundColor: [
              'rgba(75, 192, 192, 0.2)',
              'rgba(153, 102, 255, 0.2)',
              'rgba(255, 159, 64, 0.2)',
              'rgba(255, 0, 0, 0.2)',
              'rgba(0, 255, 0, 0.2)',
              'rgba(0, 0, 255, 0.2)',
              'rgba(128, 128, 0, 0.2)',
              'rgba(255, 99, 132, 0.2)',
              'rgba(54, 162, 235, 0.2)',
              'rgba(255, 206, 86, 0.2)',
              'rgba(75, 192, 192, 0.2)',
              'rgba(153, 102, 255, 0.2)',
              'rgba(255, 159, 64, 0.2)',
              'rgba(255, 99, 132, 0.2)',
              'rgba(54, 162, 235, 0.2)',
              'rgba(255, 206, 86, 0.2)',
            ],
            borderColor: [
              'rgba(75, 192, 192, 0.2)',
              'rgba(153, 102, 255, 0.2)',
              'rgba(255, 159, 64, 0.2)',
              'rgba(255, 0, 0, 0.2)',
              'rgba(0, 255, 0, 0.2)',
              'rgba(0, 0, 255, 0.2)',
              'rgba(128, 128, 0, 0.2)',
              'rgba(255, 99, 132, 0.2)',
              'rgba(54, 162, 235, 0.2)',
              'rgba(255, 206, 86, 0.2)',
              'rgba(75, 192, 192, 0.2)',
              'rgba(153, 102, 255, 0.2)',
              'rgba(255, 159, 64, 0.2)',
              'rgba(255, 99, 132, 0.2)',
              'rgba(54, 162, 235, 0.2)',
              'rgba(255, 206, 86, 0.2)',
            ],
            borderWidth: 1
          }]
        },
        options: {
          plugins: {
            legend: {
              display: true,
              position: 'right'
            }
          },
          aspectRatio: 3
        }
      });
    }
  }

  function createSolidWaveBackgroundGradient(ctx) {
    const gradient = ctx.createLinearGradient(0, 0, 0, 300);
    gradient.addColorStop(0, 'rgba(0, 0, 255, 0.8)'); // Màu sắc ở đỉnh sóng
    gradient.addColorStop(0.5, 'rgba(255, 255, 255, 0)'); // Màu sắc ở giữa sóng (trong suốt)
    gradient.addColorStop(1, 'rgba(0, 0, 255, 0.8)'); // Màu sắc ở đáy sóng
    return gradient;
  }

  // Thiết lập màu nền cho biểu đồ
  currentChart.options.plugins.background = {
    color: createSolidWaveBackgroundGradient(ctx), // Sử dụng gradient màu nền sóng đặc
  };

  function formatNumber(number) {
    return number.toLocaleString('vi-VN');
  }

  async function searchTong() {

    const startDateInput = document.getElementById('startDate');
    const endDateInput = document.getElementById('endDate');
    const startDateError = document.getElementById('startDateError');
    const endDateError = document.getElementById('endDateError');

    const startDate = startDateInput.value;
    const endDate = endDateInput.value;

    // Xóa thông báo lỗi trước đó
    startDateError.style.display = 'none';
    endDateError.style.display = 'none';

    // Validate ngày tháng
    if (new Date(startDate) > new Date(endDate)) {
      startDateError.style.display = 'inline';
      endDateError.style.display = 'inline';
      return;
    }

    try {
      // Gửi yêu cầu POST đến server và chờ dữ liệu trả về
      const response = await fetch("/thong-ke/doanh-thu", {
        method: "POST",
        headers: {
          'Content-Type': 'application/json'
        },
        body: JSON.stringify({startDate: startDate, endDate: endDate})
      });

      const data = await response.json();

      // Cập nhật các số liệu doanh thu
      document.getElementById('tongDoanhThu').textContent = formatNumber(data.tongDoanhThu)
          + ' VNĐ';
      document.getElementById('tongDonHang').textContent = formatNumber(data.tongDonHang) + ' VNĐ';
      document.getElementById('tongHoaDonTaiQuay').textContent = formatNumber(
          data.tongHoaDonTaiQuay);
      document.getElementById('tongHoaDonOnline').textContent = formatNumber(data.tongHoaDonOnline);
      document.getElementById('totalQuantity').textContent = formatNumber(data.totalQuantity);

      // Cập nhật dữ liệu cho biểu đồ sản phẩm
      productNames.length = 0;
      productQuantities.length = 0;
      size.length = 0;
      mauSac.length = 0;

      const sanPhams = JSON.parse(data.sanPhams);

      sanPhams.forEach(sanPham => {
        productNames.push(sanPham.giayTheThao.tenGiayTheThao);
        productQuantities.push(sanPham.soLuong);
        size.push(sanPham.size.size);
        mauSac.push(sanPham.mauSac.tenMauSac);
      });

      changeChartType('bar');

      productNgayThanhToan.length = 0;
      productTongTien.length = 0;

      const hoaDons = data.hoaDons;
      hoaDons.forEach(hoaDon => {
        if (hoaDon.trangThai === 4) {
          productNgayThanhToan.push(hoaDon.ngayThanhToan);
          productTongTien.push(hoaDon.thanhTien);
        }
      });

      changeChartType2('bar');

      productNameToTop5.length = 0;
      colorsTop5.length = 0;
      sizeTop5.length = 0;
      totalQuantityTop5.length = 0;

      const top5ProductResponses = data.top5ProductResponses;
      top5ProductResponses.forEach(data => {
        productNameToTop5.push(data.productName);
        colorsTop5.push(data.colorName);
        sizeTop5.push(data.size);
        totalQuantityTop5.push(data.totalQuantitySold);
      });

      changeChartTypeTop5('bar');

    } catch (error) {
      console.error("Error during POST request:", error);
    }
  }

  function thongKeSanPham() {

    $.getJSON('/thongke-data', function (data) {

      productNames.length = 0;
      productQuantities.length = 0;
      size.length = 0;
      mauSac.length = 0;

      data.forEach(function (product) {

        //product đại diện cho giầy thể thao chi tiết

        productNames.push(product.giayTheThao.tenGiayTheThao);
        productQuantities.push(product.soLuong);
        size.push(product.size.size);
        mauSac.push(product.mauSac.tenMauSac);

      });

      changeChartType('bar');

      $('#barChartButton').click(function () {
        changeChartType('bar');
      });

      $('#lineChartButton').click(function () {
        changeChartType('line');
      });

      $('#pieChartButton').click(function () {
        changeChartType('pie');
      });

    });

  }

  function thongKeDoanhThu() {

    $.getJSON('/thongke-data-hoadon', function (data) {

      productNgayThanhToan.length = 0;
      productTongTien.length = 0;

      data.forEach(function (hoaDon) {

        if (hoaDon.trangThai === 4) {
          productNgayThanhToan.push(hoaDon.ngayThanhToan);
          productTongTien.push(hoaDon.thanhTien);
        }
      });

      changeChartType2('bar');

      $('#barChartButton1').click(function () {
        changeChartType2('bar');
      });

      $('#lineChartButton1').click(function () {
        changeChartType2('line');
      });

      $('#pieChartButton1').click(function () {
        changeChartType2('pie');
      });

    });

  }

  function top5BanChay() {

    $.getJSON('/thong-ke/top5', function (data) {

      productNameToTop5.length = 0;
      colorsTop5.length = 0;
      sizeTop5.length = 0;
      totalQuantityTop5.length = 0;

      data.forEach(function (data) {

        productNameToTop5.push(data.productName);
        colorsTop5.push(data.colorName);
        sizeTop5.push(data.size);
        totalQuantityTop5.push(data.totalQuantitySold);
      });

      changeChartTypeTop5('bar');

      $('#barChartButton2').click(function () {
        changeChartTypeTop5('bar');
      });

      $('#lineChartButton2').click(function () {
        changeChartTypeTop5('line');
      });

      $('#pieChartButton2').click(function () {
        changeChartTypeTop5('pie');
      });

    });

  }

  // Hàm changeChartType được khai báo ở ngoài để có thể truy cập toàn cục
  function changeChartTypeTop5(chartType) {
    if (currentChart3) {
      currentChart3.destroy();
    }

    var ctx = document.getElementById('productChart2').getContext('2d');
    var chartData = {
      labels: productNameToTop5,
      datasets: [{
        label: 'Số lượng sản phẩm bán chạy ',
        data: totalQuantityTop5,
        backgroundColor: 'rgba(0,13,255,0.2)',
        borderColor: 'rgb(18,166,246)',
        borderWidth: 1
      }]
    };

    if (chartType === 'bar') {
      currentChart3 = new Chart(ctx, {
        type: 'bar',
        data: chartData,
        options: {
          scales: {
            y: {
              beginAtZero: true,
              max: 50
            }
          },
          plugins: {
            legend: {
              display: false
            },
            datalabels: {
              anchor: 'end',
              align: 'top',
            }
          },
          tooltips: {
            enabled: true,
            mode: 'index',
            intersect: false,
            callbacks: {
              title: function (tooltipItems, data) {
                var index = tooltipItems[0].dataIndex;
                return data.labels[index];
              },
              label: function (tooltipItem, data) {
                var datasetLabel = data.datasets[tooltipItem.datasetIndex].label || '';
                return datasetLabel + ': ' + tooltipItem.yLabel;
              },
              afterLabel: function (tooltipItem, data) {
                var index = tooltipItem.index;
                return 'Size: ' + sizeTop5[index] + '\nMàu sắc: ' + colorsTop5[index];
              }
            }
          },
          barPercentage: 0.5,
          categoryPercentage: 0.7,
        }
      });
    } else if (chartType === 'line') {
      currentChart3 = new Chart(ctx, {
        type: 'line',
        data: chartData,
        options: {
          scales: {
            y: {
              beginAtZero: true,
              max: 50
            }
          },
          plugins: {
            legend: {
              display: false
            },
            datalabels: {
              anchor: 'end',
              align: 'top',
            }
          },
          elements: {
            line: {
              tension: 0.4, // Điều chỉnh độ đoạn của đường
              borderWidth: 2, // Độ dày của đường
              fill: true,
            }
          }
        }
      });
    } else if (chartType === 'pie') {
      currentChart3 = new Chart(ctx, {
        type: 'pie',
        data: {
          labels: productNameToTop5,
          datasets: [{
            label: "Số lượng sản phẩm bán chạy",
            data: totalQuantityTop5,
            backgroundColor: [
              'rgba(75, 192, 192, 0.2)',
              'rgba(153, 102, 255, 0.2)',
              'rgba(255, 159, 64, 0.2)',
              'rgba(255, 0, 0, 0.2)',
              'rgba(0, 255, 0, 0.2)',
              'rgba(0, 0, 255, 0.2)',
              'rgba(128, 128, 0, 0.2)',
              'rgba(255, 99, 132, 0.2)',
              'rgba(54, 162, 235, 0.2)',
              'rgba(255, 206, 86, 0.2)',
              'rgba(75, 192, 192, 0.2)',
              'rgba(153, 102, 255, 0.2)',
              'rgba(255, 159, 64, 0.2)',
              'rgba(255, 99, 132, 0.2)',
              'rgba(54, 162, 235, 0.2)',
              'rgba(255, 206, 86, 0.2)',
            ],
            borderColor: [
              'rgba(75, 192, 192, 0.2)',
              'rgba(153, 102, 255, 0.2)',
              'rgba(255, 159, 64, 0.2)',
              'rgba(255, 0, 0, 0.2)',
              'rgba(0, 255, 0, 0.2)',
              'rgba(0, 0, 255, 0.2)',
              'rgba(128, 128, 0, 0.2)',
              'rgba(255, 99, 132, 0.2)',
              'rgba(54, 162, 235, 0.2)',
              'rgba(255, 206, 86, 0.2)',
              'rgba(75, 192, 192, 0.2)',
              'rgba(153, 102, 255, 0.2)',
              'rgba(255, 159, 64, 0.2)',
              'rgba(255, 99, 132, 0.2)',
              'rgba(54, 162, 235, 0.2)',
              'rgba(255, 206, 86, 0.2)',
            ],
            borderWidth: 1
          }]
        },
        options: {
          plugins: {
            legend: {
              display: true,
              position: 'right'
            }
          },

          aspectRatio: 3
        }
      });
    }
  }

</script>


</body>
</html>

