<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <title>Logout | MyStore</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">

    <style>
        body {
            background: 
                linear-gradient(rgba(0, 0, 0, 0.85), rgba(0, 0, 0, 0.85)),
                url('https://png.pngtree.com/background/20230413/original/pngtree-business-e-shopping-picture-image_2422998.jpg') no-repeat center center fixed;
            background-size: cover;
            color: #fff;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: start;
            padding-top: 100px;
            flex-direction: column;
            text-align: center;
        }

        .logout-message {
            margin: 0 auto;
            background: rgba(0, 0, 0, 0.65);
            padding: 20px 30px;
            border-radius: 10px;
            color: #FFD700;
            font-size: 1.5rem;
            font-weight: 600;
            box-shadow: 0 0 10px rgba(255, 215, 0, 0.3);
            animation: glowText 2s ease-in-out infinite alternate;
        }

        @keyframes glowText {
            from {
                text-shadow: 0 0 5px #FFD700;
            }
            to {
                text-shadow: 0 0 15px #FFA500;
            }
        }
    </style>
</head>
<body>

<%
    session.invalidate();
%>

<div class="logout-message">
    Customer Logged Out Successfully!
</div>

<!-- Include your landing or login page -->
<jsp:include page="index.html" />

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

