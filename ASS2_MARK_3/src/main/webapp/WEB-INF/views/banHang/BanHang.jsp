<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<div>

    <div class="row">
        <div class="col-8">
            <div class="card card h-100 bg-transparent text-white border">
                <div class="card-body">
                    <p class="fs-4 fw-bold">Danh sách hóa đơn</p>
                    <table>
                        <thead>
                        <tr>
                            <th scope="col">STT</th>
                            <th scope="col">ID</th>
                            <th scope="col">Tên khách hàng</th>
                            <th scope="col">Ngày tạo</th>
                            <th scope="col">Tổng tiền</th>
                            <th scope="col">Trạng thái</th>
                            <th scope="col">Chức năng</th>
                        </tr>
                        </thead>
                        <tbody class="table-while">
                        <c:forEach items="${listHD}" var="hd" varStatus="i">
                            <tr>
                                <th scope="row">${i.index + 1}</th>
                                <td>${hd.id}</td>
                                <td>${hd.khachHang.hoTen}</td>
                                <td>${hd.ngayTao}</td>
                                <c:forEach var="tien" items="${listTien}">
                                    <c:if test="${hd.id == tien.id}">
                                        <td>${tien.tongTien}</td>
                                    </c:if>
                                </c:forEach>
                                <td>${hd.trangThai}</td>
                                <td>
                                    <a href="/BanHang/HDCT/${hd.id}" class="btn btn-warning text-white bg-transparent">Xem</a>
                                    <a href="/BanHang/delete-hd/${hd.id}" class="btn btn-danger text-white bg-transparent">Xóa</a>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                    <br>
                    <nav aria-label="Page navigation example">
                        <ul class="pagination justify-content-center"> <!-- Sử dụng lớp justify-content-center để căn giữa -->
                            <c:forEach var="i" begin="1" end="${pageHD}">
                                <li class="page-item bg-transparent text-white"><a class="page-link bg-transparent text-white" href="/BanHang/trang-hd/${i}">${i}</a></li>
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
                            <th scope="col">Chức năng</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="hdct" items="${listHDCT}" varStatus="I">
                        <tr>
                            <th scope="row">${i.index + 1}</th>
                            <td>${hdct.id}</td>
                            <td>${hdct.ctsp.id}</td>
                            <td>${hdct.ctsp.sanPham.tenSanPham}</td>
                            <td>${hdct.soLuongMua}</td>
                            <td>${hdct.giaBan}</td>
                            <td>${hdct.tongTien}</td>
                            <td>
                                <a href="/BanHang/DeleteCTHD/${hdct.id}" class="btn btn-danger text-white bg-transparent">Xoa</a>
                            </td>
                        </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                    <br>
                    <nav aria-label="Page navigation example">
                        <ul class="pagination justify-content-center"> <!-- Sử dụng lớp justify-content-center để căn giữa -->
                            <c:forEach var="i" begin="1" end="${pageHDCT}">
                                <li class="page-item bg-transparent text-white"><a class="page-link bg-transparent text-white" href="/BanHang/trang-hdct/${i}">${i}</a></li>
                            </c:forEach>
                        </ul>
                    </nav>
                </div>
            </div>
        </div>
        <div class="col-4">
            <div class="card card h-100 bg-transparent text-white border">
                <div class="card-header text-center">
                    Thông tin hóa đơn
                </div>
                <div class="card-body">
                    <form action="/BanHang/SDT" method="get">
                        <label class="form-label">Tìm số điện thoại</label>
                        <div class="input-group">
                            <input type="text" class="form-control bg-transparent text-white" name="sdt">
                            <input type="submit" name="" value="Scan" class="btn btn-primary text-white bg-transparent">
                        </div>
                    </form>
                    <hr>
                    <div class="mb-3">
                        <label class="form-label">Tên Khách hàng</label>
                        <input type="text" class="form-control bg-transparent text-white" value="${kh.hoTen}" name="hoTen">
                    </div>
                    <div class="mb-3">
                        <label class="form-label">ID hóa đơn</label>
                        <input type="text" class="form-control bg-transparent text-white" value="${hd.id}">
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Tổng tiền</label>
                        <input type="text" class="form-control bg-transparent text-white" value="${sumMoney.tongTien}">
                    </div>
                    <div class="row">
                        <div class="col-12 mb-3">
                            <button type="button" id="taoHDGoc" class="btn btn-outline-success col-12" data-bs-toggle="modal" data-bs-target="#taoHD">
                                Tao hoa don
                            </button>
                        </div>
                        <div class="col-6 mb-3">
                            <a href="/BanHang/pay" class="btn btn-outline-primary col-12 <c:if test="${idHD == null}">disabled</c:if>">Thanh toan</a>
                        </div>
                        <div class="col-6 mb-3">
                            <a href="/BanHang/clear" class="btn btn-outline-danger col-12">Clear</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <br>

    <form method="get" action="/BanHang/tim-kiem-ctsp" class="mb-3">
        <div class="mb-3">
            <label class="form-label">Tìm kiếm theo tên sản phẩm</label>
            <input type="text" class="text-white form-control bg-transparent text-white" value="" name="tenTim">
        </div>
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

    <br>

    <div class="col-12">
        <div class="card bg-transparent text-white border">
            <div class="card-header text-center">
                Danh sách sản phẩm
            </div>
            <div class="card-body">
                <table>
                    <thead>
                    <tr>
                        <th scope="col">STT</th>
                        <th scope="col">ID</th>
                        <th scope="col">Tên sản phẩm</th>
                        <th scope="col">Màu sắc</th>
                        <th scope="col">Size</th>
                        <th scope="col">Giá bán</th>
                        <th scope="col">Số lượng tồn</th>
                        <th scope="col">Trạng thái</th>
                        <th scope="col">Chức năng</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="spct" items="${listSPCT}" varStatus="i">
                    <tr>
                        <th scope="row">${i.index + 1}</th>
                        <td>${spct.id}</td>
                        <td>${spct.sanPham.tenSanPham}</td>
                        <td>${spct.mauSac.tenMau}</td>
                        <td>${spct.size.ten}</td>
                        <td>${spct.giaBan}</td>
                        <td>${spct.soLuongTon}</td>
                        <td>${spct.trangThai}</td>
                        <td>
                            <button type="button" class="btn btn-primary bg-transparent text-white" data-bs-toggle="modal" data-bs-target="#muaSP${spct.id}">
                                Mua
                            </button>

                            <div class="modal fade" id="muaSP${spct.id}" tabindex="-1" aria-labelledby="exampleModalLabel${spct.id}" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h1 class="modal-title fs-5 text-black" id="exampleModalLabel${spct.id}">San pham ${spct.sanPham.tenSanPham}</h1>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                        </div>
                                        <form action="/BanHang/Mua" method="post">
                                            <input type="hidden">
                                            <div class="modal-body">
                                                <input type="hidden" name="idSPCT" value="${spct.id}">
                                                <input type="number" name="sl" id="sl${spct.id}" class="form-control">
                                            </div>
                                            <c:if test="${idHD != null || idHD > 0}">
                                                <div class="modal-footer">
                                                    <button type="submit" id="purchaseButton${spct.id}" class="btn btn-primary">Mua</button>
                                                </div>
                                            </c:if>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </td>
                    </tr>
                    </c:forEach>
                    </tbody>
                </table>
                <br>
                <nav aria-label="Page navigation example">
                    <ul class="pagination justify-content-center"> <!-- Sử dụng lớp justify-content-center để căn giữa -->
                        <c:forEach var="i" begin="1" end="${pageSPCT}">
                            <li class="page-item bg-transparent text-white"><a class="page-link bg-transparent text-white" href="/BanHang/trang-ctsp/${i}">${i}</a></li>
                        </c:forEach>
                    </ul>
                </nav>
            </div>
        </div>
    </div>

    <div class="modal fade text-dark" id="taoHD" tabindex="-1" aria-labelledby="thongTin" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="thongTin">Tao hoa don</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>

                    <div class="modal-body">
                        <c:if test="${not empty kh.hoTen}">
                        <span>Tên khách hàng là:  + ${kh.hoTen}</span>
                        <br>
                        <span>SDT:  + ${kh.sdt}</span>
                        <br>
                        <span>Địa chỉ:  + ${kh.getDiaChi()}</span>
                        </c:if>
                        <c:if test="${empty kh.hoTen}">
                            <span>Chua co doi tuong tao goa don, moi nhap sdt de tim!</span>
                        </c:if>
                    </div>


                <div class="modal-footer">
                    <c:if test="${not empty kh.hoTen}">
                        <a href="/BanHang/addHoaDon" class="btn btn-success">Tao hoa dong</a>
                    </c:if>
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
    <br>
    <a href="/hoa-don/list"class="btn btn-light bg-transparent text-white">Lich su hoa don da thanh toan</a>

</div>