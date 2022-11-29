<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Spring Boot Email using FreeMarker</title>
</head>
<body>
<div>
    <h2 style="text-align:center">Cảm ơn bạn đã đặt hàng tại BookStore</h2>
    <h2>Xin chào ${user.name}<u></u>
        <p>BookStore đã nhận được yêu cầu đặt hàng của bạn và đang xử lý nhé. Bạn sẽ nhận được thông báo tiếp theo khi
            đơn hàng đã sẵn sàng được giao.</p>
    </h2>
    <h2 style="text-align:center">Tình trạng đơn hàng:</h2>
    <h3>Đơn hàng được giao đến:</h3>
    <p>Tên: ${user.name}</p>
    <p>Địa chỉ: ${user.address}</p>
    <p>Điện thoại: ${user.phone}</p>
    <h3>Chi tiết kiện hàng</h3>
    <table width="100%">
        <tbody>

        <tr style="background-color:#e76f51;color:white">
            <#--            <th>STT</th>-->
            <th>Tên Sách</th>
            <th>Số Lượng</th>
            <th>Giá</th>
            <th>Giảm giá</th>
        </tr>
        <#list cartDetail as item >
            <tr>
<#--                <td>${}</td>-->
                <td>${item.book.name}</td>
                <td>${item.quantity}</td>
                <td>${item.book.price} VNĐ</td>
                <td>${item.book.discount.percent}%</td>
            </tr>
        </#list>
        <tr>
            <td colspan="3" style="text-align:right">Tổng tiền:</td>
            <td style="color:#dc3545;font-weight:bold">${sum} VNĐ</td>
        </tr>
        </tbody>
    </table>
</div>
<br/>
</body>
</html>