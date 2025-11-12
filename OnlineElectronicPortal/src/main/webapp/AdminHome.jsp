<!DOCTYPE html>
<%@page import="com.pack1.AdminBean"%>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Dashboard</title>

<!-- Google Fonts -->
<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">

<style>
    body, html {
        margin: 0;
        padding: 0;
        height: 100%;
        font-family: 'Roboto', sans-serif;
        background: url('https://png.pngtree.com/background/20230413/original/pngtree-business-e-shopping-picture-image_2422998.jpg') no-repeat center center fixed;
        background-size: cover;
        color: #fff;
    }

    .overlay {
        height: 100%;
        width: 100%;
        background-color: rgba(0,0,0,0.65);
        display: flex;
        justify-content: center;
        align-items: center;
        padding: 20px;
        text-align: center;
    }

    .dashboard-box {
        background: rgba(255, 255, 255, 0.08);
        backdrop-filter: blur(12px);
        padding: 40px 30px;
        border-radius: 15px;
        width: 100%;
        max-width: 400px;
        box-shadow: 0 8px 25px rgba(0,0,0,0.6);
    }

    h1 {
        color: #FFD700;
        font-weight: 700;
        font-size: 2rem;
        margin-bottom: 40px;
        text-shadow: 0 0 10px rgba(0,0,0,0.6);
        font-style: italic;
        text-decoration: underline;
    }

    .btn-gold {
        background: linear-gradient(45deg, #FFD700, #FFA500);
        border: none;
        color: #000;
        font-weight: bold;
        width: 100%;
        padding: 15px;
        border-radius: 8px;
        margin: 15px 0;
        transition: all 0.3s ease;
        cursor: pointer;
        display: inline-block;
        text-decoration: none;
        user-select: none;
        box-shadow: 0 5px 15px rgba(255, 215, 0, 0.5);
    }

    .btn-gold:hover {
        background: linear-gradient(45deg, #FFA500, #FFD700);
        box-shadow: 0 10px 30px rgba(255, 235, 0, 0.9);
        transform: translateY(-4px);
        color: #111;
        text-decoration: none;
    }
</style>
</head>
<body>
<div class="overlay">
    <div class="dashboard-box">
        <h1>
            <%
                AdminBean abean = (AdminBean)session.getAttribute("abean");
                if (abean != null) {
                    out.print("Welcome Mr. " + abean.getaFname() + "!!!");
                } else {
                    out.print("Welcome Admin!");
                }
            %>
        </h1>

        <a href="AddProduct.html" class="btn-gold">Add Product</a>
        <a href="view1" class="btn-gold">View Products</a>
        <a href="logout" class="btn-gold">Logout</a>
    </div>
</div>
</body>
</html>
