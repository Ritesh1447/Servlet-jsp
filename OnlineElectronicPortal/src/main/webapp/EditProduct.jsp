<%@page import="com.pack1.ProductBean"%>
<%@page import="com.pack1.AdminBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Edit Product Details</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" 
          rel="stylesheet" 
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" 
          crossorigin="anonymous">
    
    <style>
        body {
            /* Set the provided image as the background */
            background-image: url('https://png.pngtree.com/background/20230413/original/pngtree-business-e-shopping-picture-image_2422998.jpg');
            background-size: cover; 
            background-position: center; 
            background-attachment: fixed;
            min-height: 100vh;
            margin: 0;
            display: flex; /* For centering content */
            align-items: center; 
            justify-content: center; 
        }
        
        .form-container {
            /* Semi-transparent dark background for readability */
            background-color: rgba(0, 0, 0, 0.85);
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 0 20px rgba(255, 215, 0, 0.5); /* Gold shadow for effect */
            width: 90%;
            max-width: 450px;
            text-align: center;
        }
        
        /* Set the text color to Gold (#FFD700) */
        .gold-text {
            color: #FFD700 !important;
        }

        /* Style for the submit button */
        .btn-gold {
            background-color: #FFD700;
            color: #000000; /* Black text for contrast */
            border: 1px solid #FFD700;
            font-weight: bold;
            padding: 10px 30px;
            transition: all 0.3s ease;
        }
        
        .btn-gold:hover {
            background-color: #e0c865; 
            border-color: #e0c865;
            color: #000000;
        }

        /* Styling for the input labels and text */
        .form-label, .form-text-display {
            color: #FFD700;
            font-weight: bold;
            display: block; /* Ensures label is on its own line */
            margin-bottom: 5px;
        }
    </style>
</head>
<body>

    <div class="form-container">
        
        <h3 class="gold-text mb-4">
        <%
            AdminBean ab = (AdminBean)session.getAttribute("abean");
            ProductBean pb = (ProductBean)request.getAttribute("pbean");
            
            // Check for null to prevent potential NullPointerException
            if (ab != null && pb != null) {
                out.println("Hello Mr. " + ab.getaFname() + "!<br>Edit Product: " + pb.getpName());
            } else if (pb != null) {
                out.println("Edit Product: " + pb.getpName());
            } else {
                out.println("Product Details Not Available");
            }
        %>
        </h3>
        
        <% if (pb != null) { %>
            <div class="mb-4">
                <span class="form-text-display">Product Code: <%= pb.getpCode() %></span>
                <span class="form-text-display">Company: <%= pb.getpCompany() %></span>
            </div>

            <form action="update" method="post" class="text-start">
                
                <div class="mb-3">
                    <label for="pprice" class="form-label">Product Price (Rs)</label>
                    <input type="text" class="form-control" id="pprice" name="pprice" value="<%=pb.getpPrice() %>" required>
                </div>
                
                <div class="mb-4">
                    <label for="pqty" class="form-label">Product Quantity</label>
                    <input type="text" class="form-control" id="pqty" name="pqty" value="<%=pb.getpQty()%>" required>
                </div>
                
                <input type="hidden" name="pcode" value="<%=pb.getpCode()%>">
                
                <div class="d-grid">
                    <input type="submit" value="Update Product" class="btn btn-gold btn-lg">
                </div>
            </form>
        <% } %>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" 
            integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" 
            crossorigin="anonymous">
    </script>
</body>
</html>