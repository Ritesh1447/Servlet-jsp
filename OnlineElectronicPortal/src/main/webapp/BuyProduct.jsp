<%@page import="com.pack1.ProductBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <title>Buy Product</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">

    <style>
        body {
            background-image: url('https://png.pngtree.com/background/20230413/original/pngtree-business-e-shopping-picture-image_2422998.jpg');
            background-size: cover;
            background-repeat: no-repeat;
            background-attachment: fixed;
            background-color: #000;
            color: #fff;
        }

        .buy-container {
            background: rgba(0, 0, 0, 0.7);
            padding: 40px;
            border-radius: 15px;
            max-width: 900px;
            margin-top: 60px;
            box-shadow: 0 0 20px rgba(255, 215, 0, 0.3);
        }

        .form-label {
            font-weight: bold;
            color: #FFD700;
        }

        .form-control {
            background-color: rgba(255, 255, 255, 0.05) !important;
            color: #fff !important;
            border: 1px solid #888;
        }

        .form-control:focus {
            border-color: #FFD700;
            box-shadow: 0 0 5px #FFD700;
            background-color: rgba(255, 255, 255, 0.1);
        }

        .form-control[readonly] {
            background-color: rgba(255,255,255,0.05);
            color: #ccc;
        }

        .btn-gold {
            background: linear-gradient(45deg, #FFD700, #FFA500);
            color: #000;
            font-weight: bold;
            border: none;
        }

        .btn-gold:hover {
            background: linear-gradient(45deg, #FFA500, #FFD700);
            color: #000;
            box-shadow: 0 0 10px #FFD700;
        }

        h2 {
            color: #FFD700;
            text-shadow: 0 0 5px #FFD700;
        }
    </style>
</head>
<body>

    <div class="container d-flex justify-content-center align-items-center min-vh-100">
        <div class="buy-container">
            <h2 class="text-center mb-4">Buy Product</h2>

            <%
                ProductBean pb = (ProductBean)request.getAttribute("pbean");
            %>

            <form action="updatec" method="post">
                <div class="row">
                    <div class="mb-3 col-md-6">
                        <label class="form-label">Product Code</label>
                        <input type="text" name="ppcode" class="form-control" value="<%=pb.getpCode()%>" readonly>
                    </div>
                    <div class="mb-3 col-md-6">
                        <label class="form-label">Product Name</label>
                        <input type="text" name="pname" class="form-control" value="<%=pb.getpName()%>" readonly>
                    </div>
                    <div class="mb-3 col-md-6">
                        <label class="form-label">Product Company</label>
                        <input type="text" name="pcompany" class="form-control" value="<%=pb.getpCompany()%>" readonly>
                    </div>
                    <div class="mb-3 col-md-6">
                        <label class="form-label">Product Price</label>
                        <input type="text" name="pprice" class="form-control" value="<%=pb.getpPrice()%>" readonly>
                    </div>
                    <div class="mb-3 col-md-6">
                        <label class="form-label">Available Quantity</label>
                        <input type="text" name="pqty" class="form-control" value="<%=pb.getpQty()%>" readonly>
                    </div>
                    <div class="mb-3 col-md-6">
                        <label class="form-label">Required Quantity to Buy</label>
                        <input type="number" name="reqqty" class="form-control" min="1" max="<%=pb.getpQty()%>" required>
                    </div>
                    <div class="mb-4 col-md-6">
                        <label class="form-label">Reg No</label>
                        <input type="number" name="regno" class="form-control" min="1" max="10000" required>
                    </div>
                </div>

                <div class="d-grid mt-3">
                    <input type="submit" value="Buy Now" class="btn btn-gold btn-block">
                </div>
            </form>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
</body>
</html>
