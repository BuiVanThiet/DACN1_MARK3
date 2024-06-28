<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<form:form action="/SanPham${action}" method="post" modelAttribute="sp">
    <div class="row">
        <c:if test="${check == false}">
            <div class="col-12">
                <div class="mb-3 col-12">
                    <label class="form-label text-white">Id</label>
                    <form:input path="id" cssClass="form-control bg-transparent text-white" readonly="true"/>
                </div>
            </div>
        </c:if>
        <div class="col-12">
            <div class="mb-3 col-12">
                <label class="form-label text-white">Mã sản phẩm</label>
                <form:input path="maSanPham" cssClass="form-control bg-transparent text-white"/>
                <form:errors path="maSanPham" cssClass="text text-danger"/>
            </div>
        </div>
        <div class="col-12">
            <div class="mb-3 col-12">
                <label class="form-label text-white">Tên sản phẩm</label>
                <form:input path="tenSanPham" cssClass="form-control bg-transparent text-white"/>
                <form:errors path="tenSanPham" cssClass="text text-danger"/>
            </div>
        </div>
        <div class="col-12">
            <div class="mb-3">
                <label class="form-label text-white">Danh mục</label>
                <form:select path="danhMuc.id" cssClass="form-select bg-transparent text-white">
                    <option class="text-white bg-dark" selected disabled >--Moi chon--</option>
                    <form:options cssClass="text-white bg-dark" items="${listDM}" itemValue="id" itemLabel="tenDanhMuc"/>
                </form:select>
                <form:errors path="danhMuc" cssClass="text text-danger"/>
            </div>
        </div>
        <div class="col-12">
            <div class="mb-3 col-12">
                <label class="form-label text-white">Trạng thái</label>
                <br>
                <form:radiobuttons path="trangThai" items="${tt}" cssClass="form-check-input" delimiter="<br>"/>
                <br>
                <form:errors path="trangThai" cssClass="text text-danger"/>
            </div>
        </div>
        </div>
        <div class="col-12">
            <div class="mb-3 col-12">
                <input type="submit" class="btn btn-light bg-transparent col-12 text-white" value="${value}">
            </div>
            <c:if test="${check == false}">
                <div class="mb-3 col-12">
                    <a href="/CTSP/hien-thi/${sp.id}" class="btn btn-primary bg-transparent col-12 text-white">Danh sách chi tiết sản phẩm</a>
                </div>
                <div class="mb-3 col-12">
                    <a href="/CTSP/trang-them/${sp.id}" class="btn btn-success bg-transparent col-12 text-white">Thêm chi tiết sản phẩm</a>
                </div>
            </c:if>
        </div>
    </div>
</form:form>