<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<form method="get" action="/SanPham/tim-kiem" class="mb-3">
    <div class="input-group">
        <div class="input-group-text bg-transparent text-white">Search</div>
        <input type="text" name="tenTim" class="form-control bg-transparent text-white">
    </div>
</form>

<table>
    <thead>
    <tr>
        <th scope="col">STT</th>
        <th scope="col">ID</th>
        <th scope="col">Mã sản phẩm</th>
        <th scope="col">Tên sản phẩm</th>
        <th scope="col">Ngày sửa</th>
        <th scope="col">Ngày tạo</th>
        <th scope="col">Trạng thái</th>
        <th scope="col">Danh mục</th>
        <th scope="col">Chức năng</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${listSP}" var="item" varStatus="i">
        <tr>
            <th scope="row">${i.index+1}</th>
            <td>${item.id}</td>
            <td>${item.maSanPham}</td>
            <td>${item.tenSanPham}</td>
            <td>${item.ngaySua}</td>
            <td>${item.ngayTao}</td>
            <td>${item.trangThai}</td>
            <td>${item.danhMuc.tenDanhMuc}</td>
            <td>
                <a href="/SanPham/delete/${item.id}" class="btn btn-danger bg-transparent text-white">Xóa</a>
                <a href="/SanPham/detail/${item.id}" class="btn btn-warning bg-transparent text-white ">Xem chi tiết</a>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>

<nav aria-label="Page navigation example">
    <br>
    <ul class="pagination justify-content-center bg-transparent text-white">
        <c:forEach var="i" begin="1" end="${trang}">
            <li class="page-item bg-transparent text-white"><a class="page-link bg-transparent text-white" href="/SanPham/trang/${i}">${i}</a></li>
        </c:forEach>
    </ul>
</nav>
