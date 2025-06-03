<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:useBean id="now" class="java.util.Date"/>

<div class="container my-4">
    <div class="card shadow-sm">
        <div class="row g-0">
            <div class="col-md-4 text-center p-3">
                <img src="${muon.sach.anhSach}" alt="Ảnh sách" class="img-fluid rounded" style="max-height: 350px; object-fit: contain;">
            </div>
            <div class="col-md-8">
                <div class="card-body">
                    <h2 class="card-title mb-4">Chi tiết phiếu mượn</h2>
                    <table class="table table-borderless mb-4">
                        <tbody>
                        <tr>
                            <th scope="row" style="width: 30%;">Mã mượn</th>
                            <td>${muon.maMuon}</td>
                        </tr>
                        <tr>
                            <th scope="row">Khách hàng</th>
                            <td>${muon.khachHang.tenKH}</td>
                        </tr>
                        <tr>
                            <th scope="row">Sách</th>
                            <td>${muon.sach.tenSach}</td>
                        </tr>
                        <tr>
                            <th scope="row">Ngày mượn</th>
                            <td><fmt:formatDate value="${muon.ngayMuon}" pattern="dd/MM/yyyy"/></td>
                        </tr>
                        <tr>
                            <th scope="row">Hạn trả</th>
                            <td><fmt:formatDate value="${muon.hanTra}" pattern="dd/MM/yyyy"/></td>
                        </tr>
                        <tr>
                            <th scope="row">Đã trả?</th>
                            <td>
                                <c:choose>
                                    <c:when test="${muon.status == 'Rồi'}">Rồi</c:when>
                                    <c:otherwise>Chưa</c:otherwise>
                                </c:choose>
                            </td>
                        </tr>
                        </tbody>
                    </table>

                    <c:if test="${muon.status != 'Rồi'}">
                        <!-- Form chọn ngày và tính tiền phạt -->
                        <form action="${pageContext.request.contextPath}/muontrasach/phat" method="post" class="mb-3">
                            <div class="mb-3">
                                <label for="ngayTra" class="form-label">Chọn ngày trả:</label>
                                <input type="date" name="ngayTra" id="ngayTra" class="form-control" required />
                            </div>
                            <input type="hidden" name="maMuon" value="${muon.maMuon}" />
                            <button type="submit" class="btn btn-warning">Tính tiền phạt</button>
                        </form>

                        <!-- Nếu đã tính ra tiền phạt -->
                        <c:if test="${tienPhat > 0}">
                            <div class="alert alert-danger" role="alert">
                                Bạn đã trễ <strong>${daysLate}</strong> ngày.<br/>
                                Phạt: <strong><fmt:formatNumber value="${tienPhat}" type="number"/> đ</strong>
                            </div>
                        </c:if>

                        <!-- Form hoàn tất trả sách -->
                        <form action="${pageContext.request.contextPath}/muontrasach/hoantra" method="post">
                            <input type="hidden" name="maMuon" value="${muon.maMuon}" />
                            <button type="submit" class="btn btn-success">Hoàn tất trả sách</button>
                        </form>
                    </c:if>

                </div>
            </div>
        </div>
    </div>
</div>

