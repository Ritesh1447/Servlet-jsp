<%@page import="com.pack1.AdminBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Admin Home</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" 
          rel="stylesheet" 
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" 
          crossorigin="anonymous">
    
    <style>
        body {
            /* Set the provided image as the background */
            background-image: url('https://png.pngtree.com/background/20230413/original/pngtree-business-e-shopping-picture-image_2422998.jpg');
            background-size: cover; 
            background-position: center; /* Center the background image */
            background-attachment: fixed; 
            min-height: 100vh; 
            margin: 0;
            display: flex; /* For centering content */
            align-items: center; /* Vertically center */
            justify-content: center; 
        }
        
        .main-container {
            /* Semi-transparent dark background for readability */
            background-color: rgba(0, 0, 0, 0.8);
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 0 20px rgba(255, 215, 0, 0.5); /* Gold shadow for effect */
            width: 90%;
            max-width: 500px;
            text-align: center;
        }
        
        /* Set the text color to Gold (#FFD700) */
        .gold-text {
            color: #FFD700 !important;
        }

        /* Style for the links/buttons */
        .btn-gold {
            background-color: #FFD700;
            color: #000000; /* Black text for contrast */
            border: 1px solid #FFD700;
            font-weight: bold;
            transition: all 0.3s ease;
        }
        
        .btn-gold:hover {
            background-color: #e0c865; /* Slightly darker gold on hover */
            border-color: #e0c865;
            color: #000000;
        }
    </style>
</head>
<body>

    <div class="main-container">
        
        <h1 class="gold-text mb-4">
        <%
            AdminBean abean = (AdminBean)session.getAttribute("abean");
            String data = (String)request.getAttribute("msg");
        
            if (abean != null) {
                out.println("Hello, " + abean.getaFname() + "!");
            } else {
                out.println("Welcome, Administrator!");
            }
        %>
        </h1>
        
        <p class="lead gold-text mb-5">
        <%
            if (data != null && !data.isEmpty()) {
                out.println(data);
            } else {
                out.println("What would you like to manage today?");
            }
        %>
        </p>
        
        <div class="d-grid gap-3">
            <a href="AddProduct.html" class="btn btn-gold btn-lg">Add New Product</a>
            <a href="view1" class="btn btn-gold btn-lg">View All Products</a>
            <a href="logout" class="btn btn-gold btn-lg">Logout</a> 
        </div>

    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" 
            integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" 
            crossorigin="anonymous">
    </script>
</body>
</html>