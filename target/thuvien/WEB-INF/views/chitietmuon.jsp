<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:useBean id="now" class="java.util.Date"/>

<html>
<head>
    <title>Chi tiết phiếu mượn</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css"/>
</head>
<body>
<div class="detail-container">
    <div class="book-image">
        <img src="${pageContext.request.contextPath}/${muon.sach.anhSach}" alt="Ảnh sách"/>
    </div>

    <div class="book-info">
        <h2>Chi tiết phiếu mượn</h2>
        <table>
            <tr>
                <th>Mã mượn</th>
                <td>${muon.maMuon}</td>
            </tr>
            <tr>
                <th>Khách hàng</th>
                <td>${muon.khachHang.tenKH}</td>
            </tr>
            <tr>
                <th>Sách</th>
                <td>${muon.sach.tenSach}</td>
            </tr>
            <tr>
                <th>Ngày mượn</th>
                <td><fmt:formatDate value="${muon.ngayMuon}" pattern="dd/MM/yyyy"/></td>
            </tr>
            <tr>
                <th>Hạn trả</th>
                <td><fmt:formatDate value="${muon.hanTra}" pattern="dd/MM/yyyy"/></td>
            </tr>
            <tr>
                <th>Đã trả?</th>
                <td>
                    <c:choose>
                        <c:when test="${muon.status == 'Rồi'}">Rồi</c:when>
                        <c:otherwise>Chưa</c:otherwise>
                    </c:choose>
                </td>
            </tr>
        </table>

        <c:if test="${muon.status != 'Rồi'}">
            <!-- Form chọn ngày và tính tiền phạt -->
            <form action="${pageContext.request.contextPath}/muontrasach/phat" method="post">
                <div class="return-section">
                    <label>Chọn ngày trả:</label><br>
                    <input type="date" name="ngayTra" required/><br/><br/>
                    <input type="hidden" name="maMuon" value="${muon.maMuon}"/>
                    <button type="submit" class="submit-btn">Tính tiền phạt</button>
                </div>
            </form>
            <!-- Nếu đã tính ra tiền phạt -->
            <c:if test="${tienPhat > 0}">
                <p style="color:red">Bạn đã trễ <strong>${daysLate}</strong> ngày.
                    Phạt: <strong><fmt:formatNumber value="${tienPhat}" type="number"/> đ</strong></p>
            </c:if>

            <!-- Form hoàn tất trả sách -->
            <form action="${pageContext.request.contextPath}/muontrasach/hoantra" method="post">
                <input type="hidden" name="maMuon" value="${muon.maMuon}"/>

                <button type="submit" class="submit-btn">Hoàn tất trả sách</button>
            </form>
        </c:if>
    </div>
</div>
</body>
</html>
