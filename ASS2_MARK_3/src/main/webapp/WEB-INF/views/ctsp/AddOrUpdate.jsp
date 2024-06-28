<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<form:form method="post" modelAttribute="ctsp" action="/CTSP${action}">
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
                <label class="form-label text-white">Ma san pham</label>
                <form:input path="sanPham.maSanPham" cssClass="form-control bg-transparent text-white" readonly="true"/>
            </div>
        </div>
        <div class="col-12">
            <div class="mb-3 col-12">
                <label class="form-label text-white">Ten san pham</label>
                <form:input path="sanPham.tenSanPham" cssClass="form-control bg-transparent text-white" readonly="true"/>
            </div>
        </div>
        <div class="col-12">
            <div class="mb-3 col-12">
                <label class="form-label text-white">Mau sac</label>
                <form:select path="mauSac.id" cssClass="form-select bg-transparent text-white">
                    <option class="text-white bg-dark" selected disabled >--Moi chon--</option>
                    <form:options cssClass="text-white bg-dark" items="${listMS}" itemValue="id" itemLabel="tenMau"/>
                </form:select>
                <form:errors path="mauSac" cssClass="text text-danger"/>
            </div>
        </div>
        <div class="col-12">
            <div class="mb-3 col-12">
                <label class="form-label text-white">Size</label>
                <form:select path="size.id" cssClass="form-select bg-transparent text-white">
                    <option class="text-white bg-dark" selected disabled >--Moi chon--</option>
                    <form:options cssClass="text-white bg-dark" items="${listS}" itemValue="id" itemLabel="ten"/>
                </form:select>
                <form:errors path="size" cssClass="text text-danger"/>
            </div>
        </div>
        <div class="col-12">
            <div class="mb-3 col-12">
                <label class="form-label text-white">Gia ban</label>
                <form:input path="giaBan" cssClass="form-control bg-transparent text-white"/>
                <form:errors path="giaBan" cssClass="text text-danger"/>
            </div>
        </div>
        <div class="col-12">
            <div class="mb-3 col-12">
                <label class="form-label text-white">So luong</label>
                <form:input path="soLuongTon" cssClass="form-control bg-transparent text-white"/>
                <form:errors path="soLuongTon" cssClass="text text-danger"/>
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
