<%@page import="com.pack1.UserBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>User Home</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f7f6;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            margin: 0;
            color: #333;
            text-align: center;
        }

        .welcome-box {
            background-color: #ffffff;
            padding: 40px 60px;
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        }
        
        h1 {
            color: #007bff;
            font-size: 2.2em;
            margin-bottom: 30px;
        }
        
        .nav-link {
            display: block;
            margin: 15px 0;
            padding: 10px 30px;
            text-decoration: none;
            color: #ffffff;
            border-radius: 5px;
            font-weight: bold;
            transition: background-color 0.3s ease;
            max-width: 200px; /* Constrain link width */
            margin-left: auto;
            margin-right: auto;
        }

        #view-profile {
            background-color: #28a745; /* Green */
        }
        
        #view-profile:hover {
            background-color: #1e7e34;
        }

        #logout {
            background-color: #dc3545; /* Red */
        }

        #logout:hover {
            background-color: #c82333;
        }
    </style>
</head>
<body>
    <div class="welcome-box">
        <%-- Using JSP Expression Language (EL) is the modern way to access bean properties --%>
        <h1>Welcome ${applicationScope.ubean.user_name}</h1>
        
        <a href="view" class="nav-link" id="view-profile">View Profile</a>
        <%-- Assuming the correct action for logout should be 'logout' --%>
        <a href="logout" class="nav-link" id="logout">Logout</a> 
        
    </div>
</body>
</html>