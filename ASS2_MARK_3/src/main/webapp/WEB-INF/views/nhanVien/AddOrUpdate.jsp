<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<form:form modelAttribute="nv" method="post" action="/NhanVien${action}">
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
                <label class="form-label text-white">Mã nhân viên</label>
                <form:input path="maNhanVien" cssClass="form-control bg-transparent text-white"/>
                <form:errors cssClass="text text-danger" path="maNhanVien"/>
            </div>
        </div>
        <div class="col-12">
            <div class="mb-3 col-12">
                <label class="form-label text-white">Tên nhân viên</label>
                <form:input path="hoTen" cssClass="form-control bg-transparent text-white"/>
                <form:errors cssClass="text text-danger" path="hoTen"/>
            </div>
        </div>
        <div class="col-12">
            <div class="mb-3 col-12">
                <label class="form-label text-white">Địa chỉ</label>
                <form:input path="diaChi" cssClass="form-control bg-transparent text-white"/>
                <form:errors cssClass="text text-danger" path="diaChi"/>
            </div>
        </div>
        <div class="col-12">
            <div class="mb-3 col-12">
                <label class="form-label text-white">Số điện thoại</label>
                <form:input path="sdt" cssClass="form-control bg-transparent text-white"/>
                <form:errors cssClass="text text-danger" path="sdt"/>
            </div>
        </div>
        <div class="col-12">
            <div class="mb-3 col-12">
                <label class="form-label text-white">Mật khẩu</label>
                <form:input path="matKhau" cssClass="form-control bg-transparent text-white"/>
                <form:errors cssClass="text text-danger" path="matKhau"/>
            </div>
        </div>
        <div class="col-12">
            <div class="mb-3 col-12">
                <label class="form-label text-white">Chức vụ</label>
                <form:select path="chucVu.id" cssClass="form-select bg-transparent text-white">
                    <option class="text-white bg-dark" selected disabled >--Moi chon--</option>
                    <form:options cssClass="text-white bg-dark" items="${listCV}" itemValue="id" itemLabel="tenChucVu"/>
                </form:select>
                <form:errors cssClass="text text-danger" path="chucVu"/>
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
        <div class="col-12">
            <div class="mb-3 col-12">
                <input type="submit" class="btn btn-light bg-transparent col-12 text-white" value="${value}">
            </div>
        </div>
    </div>
</form:form>