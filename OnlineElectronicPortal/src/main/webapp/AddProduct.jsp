<%@page import="com.pack1.AdminBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Welcome</title>

<!-- Google Fonts -->
<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="addprojsp.css">

 

</head>
<body>
  <div class="overlay">
    <div class="welcome-box">
      <h1>
        <%
          AdminBean abean = (AdminBean) session.getAttribute("abean");
          String data = (String) request.getAttribute("msg");
          if (abean != null) {
              out.print("Welcome Mr. " + abean.getaFname() + "!!!");
          } else {
              out.print("Welcome Admin!");
          }
        %>
      </h1>

      <div class="message">
        <%
          if (data != null) {
              out.print(data);
          }
        %>
      </div>

      <a href="AddProduct.html" class="btn-link">Add Product</a>
      <a href="view1" class="btn-link">View Products</a>
      <a href="logout" class="btn-link">Logout</a>
    </div>
  </div>
</body>
</html>
