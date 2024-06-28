<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


<form:form action="/MauSac${action}" modelAttribute="ms" method="post">
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
                <label class="form-label text-white">Mã màu</label>
                <form:input path="maMau" cssClass="form-control bg-transparent text-white"/>
                <form:errors path="maMau" cssClass="text text-danger"/>
            </div>
        </div>
        <div class="col-12">
            <div class="mb-3 col-12">
                <label class="form-label text-white">Tên màu</label>
                <form:input path="tenMau" cssClass="form-control bg-transparent text-white"/>
                <form:errors path="tenMau" cssClass="text text-danger"/>
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
