<%@page import="java.util.Iterator"%>
<%@page import="com.pack1.AdminBean"%>
<%@page import="com.pack1.ProductBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Product Details</title>

<!-- Google Fonts -->
<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="ViewProduct.css">
</head>
<body>
  <div class="overlay">
    <div class="content-box">
      <h1>
        <%
          AdminBean abean = (AdminBean)session.getAttribute("abean");
          ArrayList<ProductBean> al = (ArrayList<ProductBean>)session.getAttribute("productList");
          if (abean != null) {
              out.print("Mr. " + abean.getaFname() + ", below are your product details");
          } else {
              out.print("Product Details");
          }
        %>
      </h1>

      <div class="product-list">
        <%
          if (al == null || al.size() == 0) {
              out.println("<p>Products are NOT available !!! :(</p>");
          } else {
              Iterator<ProductBean> i = al.iterator();
              while(i.hasNext()) {
                  ProductBean pb = i.next();
        %>
          <div class="product-item">
            <span><strong>Code:</strong> <%= pb.getpCode() %> &nbsp;&nbsp;</span>
            <span><strong>Name:</strong> <%= pb.getpName() %> &nbsp;&nbsp;</span>
            <span><strong>Company:</strong> <%= pb.getpCompany() %> &nbsp;&nbsp;</span>
            <span><strong>Price:</strong> <%= pb.getpPrice() %> &nbsp;&nbsp;</span>
            <span><strong>Qty:</strong> <%= pb.getpQty() %></span>
            <span class="product-links">
              <a href="edit?pcode=<%= pb.getpCode() %>">Edit</a>
              <a href="delete?pcode=<%= pb.getpCode() %>">Delete</a>
            </span>
          </div>
        <%
              }
          }
        %>
      </div>

      <a href="Logout" class="logout-btn">Logout</a>
    </div>
  </div>
</body>
</html>
