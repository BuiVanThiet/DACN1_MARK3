<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<a href="/CTSP/trang-them/${idSP}" class="btn btn-success bg-transparent text-white mb-3">Thêm mới</a>

<form method="get" action="/CTSP/tim-kiem" class="mb-3">
    <div class="col-12">
        <div class="mb-3 col-12">
            <label class="form-label text-white">Mau sac</label>
            <select class="form-select bg-transparent text-white" name="mauTim">
                <option value="" class="text-white bg-dark" selected>
                    --Khong chon--
                </option>
                <c:forEach var="ms" items="${listMS}">
                    <option value="${ms.id}" class="text-white bg-dark">
                            ${ms.tenMau}
                    </option>
                </c:forEach>
            </select>
        </div>
        <div class="mb-3 col-12">
            <label class="form-label text-white">Size</label>
            <select class="form-select bg-transparent text-white" name="sizeTim">
                <option value="" class="text-white bg-dark" selected>
                    --Khong chon--
                </option>
                <c:forEach var="s" items="${listS}">
                    <option value="${s.id}" class="text-white bg-dark">
                            ${s.ten}
                    </option>
                </c:forEach>
            </select>
        </div>
    </div>
    <input type="submit" value="Loc" class="btn btn-light bg-transparent col-12 text-white">
</form>

<table>
    <thead>
    <tr>
        <th scope="col">STT</th>
        <th scope="col">ID</th>
        <th scope="col">Mã sản phẩm</th>
        <th scope="col">Tên sản phẩm</th>
        <th scope="col">Màu sắc</th>
        <th scope="col">Size</th>
        <th scope="col">Giá bán</th>
        <th scope="col">Số lượng tồn</th>
        <th scope="col">Ngày sửa</th>
        <th scope="col">Ngày tạo</th>
        <th scope="col">Trạng thái</th>
        <th scope="col">Chức năng</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${listTSP}" var="item" varStatus="i">
        <tr>
            <td>${i.index+1}</td>
            <td>${item.id}</td>
            <td>${item.sanPham.maSanPham}</td>
            <td>${item.sanPham.tenSanPham}</td>
            <td>${item.mauSac.tenMau}</td>
            <td>${item.size.ten}</td>
            <td>${item.giaBan}</td>
            <td>${item.soLuongTon}</td>
            <td>${item.ngaySua}</td>
            <td>${item.ngayTao}</td>
            <td>${item.trangThai}</td>
            <td>
                <a href="/CTSP/delete/${item.id}/${item.sanPham.id}" class="btn btn-danger bg-transparent text-white">Xóa</a>
                <a href="/CTSP/detail/${item.id}" class="btn btn-warning bg-transparent text-white ">Xem chi tiết</a>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>

<nav aria-label="Page navigation example">
    <br>
    <ul class="pagination justify-content-center bg-transparent text-white">
        <c:forEach var="i" begin="1" end="${trang}">
            <li class="page-item bg-transparent text-white"><a class="page-link bg-transparent text-white" href="/CTSP/trang/${i}">${i}</a></li>
        </c:forEach>
    </ul>
</nav>
