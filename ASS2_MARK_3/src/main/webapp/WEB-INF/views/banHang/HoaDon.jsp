<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<p class="fs-4 fw-bold">Danh sách hóa đơn da thanh toan</p>
<table>
    <thead>
    <tr>
        <th>id</th>
        <th>Ten khach hang</th>
        <th>Ten nhan vien</th>
        <th>Trang thai</th>
        <th>Ngay tao</th>
        <th>Ngay sua</th>
        <th>Dia chi</th>
        <th>So dien thoai</th>
        <th>Tong tien</th>
        <th>Chuc nang</th>
    </tr>
    </thead>
    <tbody>
        <c:forEach items="${listHD.content}" var="hd">
            <tr>
                <td>${hd.id}</td>
                <td>${hd.khachHang.hoTen}</td>
                <td>${hd.nhanVien.hoTen}</td>
                <td>${hd.trangThai}</td>
                <td>${hd.ngayTao}</td>
                <td>${hd.ngaySua}</td>
                <td>${hd.diaChi}</td>
                <td>${hd.sdt}</td>
                <c:forEach var="tien" items="${listTien}">
                    <c:if test="${hd.id == tien.id}">
                        <td>${tien.tongTien}</td>
                    </c:if>
                </c:forEach>
                <td>
                    <a href="/hoa-don/detail/${hd.id}" class="btn btn-primary text-white bg-transparent">Chi tiet</a>
                </td>
            </tr>
        </c:forEach>
    </tbody>
</table>

<nav aria-label="Page navigation example">
    <ul class="pagination justify-content-center"> <!-- Sử dụng lớp justify-content-center để căn giữa -->
        <c:forEach var="i" begin="1" end="${pageMax}">
            <li class="page-item bg-transparent text-white"><a class="page-link bg-transparent text-white" href="/hoa-don/trang/${i}">${i}</a></li>
        </c:forEach>
    </ul>
</nav>
<p class="fs-4 fw-bold">Danh sách hóa đơn chi tiết</p>
<table>
    <thead>
    <tr>
        <th scope="col">STT</th>
        <th scope="col">ID</th>
        <th scope="col">IDCTSP</th>
        <th scope="col">Tên sản phẩm</th>
        <th scope="col">Số lượng</th>
        <th scope="col">Giá bán</th>
        <th scope="col">Tổng tiền</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="hdct" items="${hdct}" varStatus="I">
        <tr>
            <th scope="row">${i.index + 1}</th>
            <td>${hdct.id}</td>
            <td>${hdct.ctsp.id}</td>
            <td>${hdct.ctsp.sanPham.tenSanPham}</td>
            <td>${hdct.soLuongMua}</td>
            <td>${hdct.giaBan}</td>
            <td>${hdct.tongTien}</td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<br>
<nav aria-label="Page navigation example">
    <ul class="pagination justify-content-center"> <!-- Sử dụng lớp justify-content-center để căn giữa -->
        <c:forEach var="i" begin="1" end="${pageMaxHDCT}">
            <li class="page-item bg-transparent text-white"><a class="page-link bg-transparent text-white" href="/hoa-don/page-hdct/${i}">${i}</a></li>
        </c:forEach>
    </ul>
</nav>
