<%@page import="com.pack1.CustomerBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <title>Order Placed Successfully</title>
    
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="OrderConfirmed.css">     
</head>
<body>

    <div class="container d-flex justify-content-center align-items-center min-vh-100">
        <div class="col-md-8 col-lg-6 success-box">
            <%
                CustomerBean cb = (CustomerBean)session.getAttribute("cbean");
                int total = (int)request.getAttribute("total");
            %>
            <h1>Thank You, <%= cb.getFname() %>!</h1>

            <p><strong>Your order has been placed successfully.</strong></p>
            <p><strong>Total Charged:</strong> <%= total %>Rs</p>

            <div class="mt-4 d-flex justify-content-center gap-3">
                <a href="View2" class="btn btn-gold px-4">View More Products</a>
                <a href="Logout" class="btn btn-outline-gold px-4">Logout</a>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
</body>
</html>
