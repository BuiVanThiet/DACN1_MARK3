<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Bootstrap demo</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

</head>
<style>
    body  {
        background-image: url("https://i.pinimg.com/736x/fe/bc/bb/febcbb34fcead6b3ac7894baea63b1a9.jpg");
    }
    .dropdown-item:hover{
        color: black !important;
    }
    .dropdown-divider {
        background-color: white;
    }
    table {
        border-collapse: collapse;
        width: 100%;
        color: white;
    }

    th, td {
        border: 1px solid white;
        padding: 8px;
        text-align: left;
    }
    .offcanvas-body p:hover {
        color: black;
        background-color: rgba(244, 0, 0, 0.315); /* Màu nền trắng dậm */
        margin-left: -5%; /* Lề bên trái tăng khi hover */
        margin-right: -5%; /* Lề bên phải tăng khi hover */
        transition: background-color 3s, margin-left 0.5s, margin-right 0.5s; /* Hiệu ứng chuyển đổi */
    }

    .offcanvas-body p {
        background-color: transparent; /* Màu nền trong suốt ban đầu */
        transition: background-color 3s, margin-left 0.5s, margin-right 0.5s; /* Hiệu ứng chuyển đổi */
    }
    .offcanvas-body a {
        padding-left: 5px; /* Cách biên trái 5px */
    }

</style>
<body>
<nav class="navbar navbar-expand-lg border-white border-bottom bg-dark">
    <div class="container-fluid">
        <i class="bi bi-box-seam" style="font-size: 300%; color: white;" data-bs-toggle="offcanvas" data-bs-target="#offcanvasExample" aria-controls="offcanvasExample"></i>
        <a class="navbar-brand text-white" href="/">Thiet store</a>
    </div>
</nav>
<!-- tab -->
<div>
    <div style="background-color: rgba(0, 0, 0, 0.445); color: white;" class="offcanvas offcanvas-start border-end" tabindex="-1" id="offcanvasExample" aria-labelledby="offcanvasExampleLabel" >
        <div class="offcanvas-header d-flex justify-content-between align-items-center border-bottom" >
            <a href="/" class="offcanvas-title text-decoration-none text-white fs-3" id="offcanvasExampleLabel">${nameAccout}</a>
            <i class="bi bi-x-square" style="font-size: 300%; color: white;" data-bs-dismiss="offcanvas" aria-label="Close"></i>
        </div>
        <div class="offcanvas-body text-start">
            <c:if test="${login eq 'Dang xuat' && chucVu eq 'CV00'}">
                <p class="border-bottom">
                    <a class="text-decoration-none text-white fs-3 bg-transparent" data-bs-toggle="collapse" href="#sanPham" role="button" aria-expanded="false" aria-controls="collapseExample">
                        Quản lý sản phẩm
                    </a>
                </p>
            </c:if>
            <div class="collapse" id="sanPham">
                <div class="card card-body" style="background-color: rgba(255, 255, 255, 0.445); color: white;">
                    <a class="dropdown-item text-decoration-none text-white fs-6 bg-transparent" href="/SanPham/hien-thi">Danh sách sản phẩm</a>
                    <a class="dropdown-item text-decoration-none text-white fs-6 bg-transparent" href="/SanPham/trang-them">Thêm mới sản phẩm</a>
                    <hr>
                    <p class="d-inline-flex">
                        <a class="dropdown-item text-decoration-none text-white fs-5 bg-transparent" data-bs-toggle="collapse" href="#danhMuc" role="button" aria-expanded="false" aria-controls="collapseExample">
                            Quản lý danh mục
                        </a>
                    </p>
                    <div class="collapse" id="danhMuc">
                        <div class="card card-body" style="background-color: rgba(255, 255, 255, 0.445); color: white;">
                            <a class="dropdown-item text-white " href="/DanhMuc/hien-thi">Danh sách danh mục</a>
                            <a class="dropdown-item text-white " href="/DanhMuc/trang-them">Thêm mới danh mục</a>
                        </div>
                    </div>
                </div>
            </div>
            <!-- tab2 -->
            <c:if test="${login eq 'Dang xuat' && chucVu eq 'CV00'}">
                <p class=" border-bottom">
                    <a class="text-decoration-none text-white fs-3 bg-transparent" data-bs-toggle="collapse" href="#user" role="button" aria-expanded="false" aria-controls="collapseExample">
                        Quản lý User
                    </a>
                </p>
            </c:if>
            <div class="collapse" id="user">
                <div class="card card-body" style="background-color: rgba(255, 255, 255, 0.445); color: white;">
                    <p class="d-inline-flex gap-1">
                        <a class="dropdown-item text-decoration-none text-white fs-5 bg-transparent" data-bs-toggle="collapse" href="#kh" role="button" aria-expanded="false" aria-controls="collapseExample">
                            Quản lý khách hàng
                        </a>
                    </p>
                    <div class="collapse" id="kh">
                        <div class="card card-body" style="background-color: rgba(255, 255, 255, 0.445); color: white;">
                            <a class="dropdown-item text-white " href="/KhachHang/hien-thi">Danh sách khách hàng</a>
                            <a class="dropdown-item text-white " href="/KhachHang/trang-them">Thêm mới khách hàng</a>
                        </div>
                    </div>
                    <p class="d-inline-flex gap-1">
                        <a class="dropdown-item text-decoration-none text-white fs-5 bg-transparent" data-bs-toggle="collapse" href="#nv" role="button" aria-expanded="false" aria-controls="collapseExample">
                            Quản lý Nhân viên
                        </a>
                    </p>
                    <div class="collapse" id="nv">
                        <div class="card card-body" style="background-color: rgba(255, 255, 255, 0.445); color: white;">
                            <a class="dropdown-item text-white " href="/NhanVien/hien-thi">Danh sách Nhân viêng</a>
                            <a class="dropdown-item text-white " href="/NhanVien/trang-them">Thêm mới Nhân viên</a>
                        </div>
                    </div>
                    <p class="d-inline-flex gap-1">
                        <a class="dropdown-item text-decoration-none text-white fs-5 bg-transparent" data-bs-toggle="collapse" href="#chucVu" role="button" aria-expanded="false" aria-controls="collapseExample">
                            Quản lý chức vụ
                        </a>
                    </p>
                    <div class="collapse" id="chucVu">
                        <div class="card card-body" style="background-color: rgba(255, 255, 255, 0.445); color: white;">
                            <a class="dropdown-item text-white " href="/ChucVu/hien-thi">Danh sách chức vụ</a>
                            <a class="dropdown-item text-white " href="/ChucVu/trang-them">Thêm mới chức vụ</a>
                        </div>
                    </div>

                </div>
            </div>
            <!-- tab3 -->
            <c:if test="${login eq 'Dang xuat' && chucVu eq 'CV00'}">
                <p class="border-bottom">
                    <a class="text-decoration-none text-white fs-3 bg-transparent" data-bs-toggle="collapse" href="#thuocTinh" role="button" aria-expanded="false" aria-controls="collapseExample">
                        Quản lý thuộc tính
                    </a>
                </p>
            </c:if>
            <div class="collapse" id="thuocTinh">
                <div class="card card-body" style="background-color: rgba(255, 255, 255, 0.445); color: white;">
                    <p class="d-inline-flex gap-1">
                        <a class="dropdown-item text-decoration-none text-white fs-5 bg-transparent" data-bs-toggle="collapse" href="#mauSac" role="button" aria-expanded="false" aria-controls="collapseExample">
                            Quản lý màu sắc
                        </a>
                    </p>
                    <div class="collapse" id="mauSac">
                        <div class="card card-body" style="background-color: rgba(255, 255, 255, 0.445); color: white;">
                            <a class="dropdown-item text-white " href="/MauSac/hien-thi">Danh sách màu sắc</a>
                            <a class="dropdown-item text-white " href="/MauSac/trang-them">Thêm mới màu sắc</a>
                        </div>
                    </div>
                    <p class="d-inline-flex gap-1">
                        <a class="dropdown-item text-decoration-none text-white fs-5 bg-transparent" data-bs-toggle="collapse" href="#size" role="button" aria-expanded="false" aria-controls="collapseExample">
                            Quản lý size
                        </a>
                    </p>
                    <div class="collapse" id="size">
                        <div class="card card-body" style="background-color: rgba(255, 255, 255, 0.445); color: white;">
                            <a class="dropdown-item text-white " href="/Size/hien-thi">Danh sách size</a>
                            <a class="dropdown-item text-white " href="/Size/trang-them">Thêm mới size</a>
                        </div>
                    </div>
                </div>
            </div>
            <!-- tab4 -->
            <c:if test="${login eq 'Dang xuat'}">
                <p class="border-bottom">
                    <a href="/BanHang/hien-thi" class="text-decoration-none text-white fs-3 bg-transparent" >
                        Bán hàng
                    </a>
                </p>
            </c:if>
            <div class="text-center" >
                <a class="text-decoration-none text-white fs-3 bg-transparent" href="${href}">${login}
                </a>
            </div>

        </div>
    </div>
</div>

<article class="container-xxl bd-gutter mt-5 my-md-4 bd-layout">
    <div class="text text-white row">
        <c:if test="${form != null}">
                        <c:import url="${form}"/>
        </c:if>
<%--        <div class="col-4 text-center">--%>
<%--            <canvas id="myPieChart" width="400" height="400"></canvas>--%>
<%--            Biểu đồ sản phẩm--%>
<%--        </div>--%>
<%--        <!--  scrip bieu do-->--%>
<%--        <script>--%>
<%--            // Parse JSON from model attribute--%>
<%--            var listCTSP = JSON.parse('${listCTSPJson}');--%>

<%--            // Extract data and labels--%>
<%--            var dataList = listCTSP.map(item => item.soLuong);--%>
<%--            var labels = listCTSP.map(item => item.tenSP);--%>

<%--            // Generate random colors--%>
<%--            function generateRandomColor() {--%>
<%--                var color;--%>
<%--                do {--%>
<%--                    color = '#' + Math.floor(Math.random() * 16777215).toString(16);--%>
<%--                } while (color === '#FFFF00' || color === '#000000FF');--%>
<%--                return color;--%>
<%--            }--%>

<%--            var backgroundColors = [];--%>
<%--            for (var i = 0; i < labels.length; i++) {--%>
<%--                backgroundColors.push(generateRandomColor());--%>
<%--            }--%>

<%--            // Create pie chart--%>
<%--            var ctx = document.getElementById('myPieChart').getContext('2d');--%>
<%--            var myPieChart = new Chart(ctx, {--%>
<%--                type: 'pie',--%>
<%--                data: {--%>
<%--                    labels: labels,--%>
<%--                    datasets: [{--%>
<%--                        data: dataList,--%>
<%--                        backgroundColor: backgroundColors,--%>
<%--                        borderColor: 'white',--%>
<%--                        borderWidth: 1,--%>
<%--                        hoverBackgroundColor: '#FFFFFFFF'--%>
<%--                    }]--%>
<%--                },--%>
<%--                options: {--%>
<%--                    responsive: false--%>
<%--                }--%>
<%--            });--%>
<%--        </script>--%>
    </div>
</article>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>