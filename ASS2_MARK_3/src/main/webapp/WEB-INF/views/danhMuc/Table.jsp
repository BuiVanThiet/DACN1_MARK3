<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<form method="get" action="/DanhMuc/tim-kiem" class="mb-3">
    <div class="input-group">

    </div>
</form>

<table>
    <thead>
    <tr>
        <th scope="col">STT</th>
        <th scope="col">ID</th>
        <th scope="col">Mã danh mục</th>
        <th scope="col">Tên danh mục</th>
        <th scope="col">Ngày sửa</th>
        <th scope="col">Ngày tạo</th>
        <th scope="col">Trạng thái</th>
        <th scope="col">Chức năng</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="item" varStatus="i" items="${listDM}">
        <tr>
            <th scope="row">${i.index+1}</th>
            <td>${item.id}</td>
            <td>${item.maDanhmuc}</td>
            <td>${item.tenDanhMuc}</td>
            <td>${item.ngaySua}</td>
            <td>${item.ngayTao}</td>
            <td>${item.trangThai}</td>
            <td>
                <a href="/DanhMuc/delete/${item.id}" class="btn btn-danger bg-transparent text-white">Xóa</a>
                <a href="/DanhMuc/detail/${item.id}" class="btn btn-warning bg-transparent text-white ">Xem chi tiết</a>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>

<nav aria-label="Page navigation example">
    <br>
    <ul class="pagination justify-content-center bg-transparent text-white">
        <c:forEach var="i" begin="1" end="${trang}">
            <li class="page-item bg-transparent text-white"><a class="page-link bg-transparent text-white" href="/DanhMuc/trang/${i}">${i}</a></li>
        </c:forEach>
    </ul>
</nav>