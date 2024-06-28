<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<form:form action="/ChucVu${action}" method="post" modelAttribute="cv">
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
                <label class="form-label text-white">Mã chức vụ</label>
                <form:input path="maChucVu" cssClass="form-control bg-transparent text-white"/>
                <form:errors path="maChucVu" cssClass="text text-danger"/>
            </div>
        </div>
        <div class="col-12">
            <div class="mb-3 col-12">
                <label class="form-label text-white">Tên chức vụ</label>
                <form:input path="tenChucVu" cssClass="form-control bg-transparent text-white"/>
                <form:errors path="tenChucVu" cssClass="text text-danger"/>
            </div>
        </div>
        <div class="col-12">
            <div class="mb-3 col-12">
                <label class="form-label text-white">Trạng thái</label>
                <br>
                <form:radiobuttons path="trangThai" cssClass="form-check-input" items="${tt}" delimiter="<br>"/>
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