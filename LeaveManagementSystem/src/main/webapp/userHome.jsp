<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="javax.servlet.http.Cookie" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Home</title>
<style>
    /* Reset */
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }

    body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        min-height: 100vh;
        background: url('https://images.unsplash.com/photo-1506744038136-46273834b3fb?auto=format&fit=crop&w=1950&q=80') no-repeat center center fixed;
        background-size: cover;
        display: flex;
        justify-content: center;
        align-items: center;
        padding: 40px 20px;
        color: #f0f2f5;
        position: relative;
    }

    body::before {
        content: "";
        position: fixed;
        inset: 0;
        background: rgba(0, 0, 0, 0.55);
        z-index: 0;
    }

    .container {
        position: relative;
        z-index: 1;
        background: rgba(255, 255, 255, 0.15);
        backdrop-filter: blur(12px);
        border-radius: 16px;
        box-shadow: 0 8px 32px rgba(0, 0, 0, 0.4);
        width: 90%;
        max-width: 500px;
        padding: 40px 30px;
        text-align: center;
        color: #d4ffd8;
    }

    h1 {
        font-size: 2.5rem;
        font-weight: 700;
        margin-bottom: 8px;
        text-shadow: 0 0 6px rgba(76, 175, 80, 0.9);
    }

    h3 {
        font-weight: 500;
        margin-bottom: 30px;
        color: #a8d5a8;
    }

    ul {
        list-style: none;
        padding: 0;
    }

    li {
        margin: 15px 0;
    }

    a {
        text-decoration: none;
        color: #f0f2f5;
        background-color: #4caf50;
        padding: 12px 28px;
        border-radius: 8px;
        font-weight: 600;
        font-size: 1.1rem;
        display: inline-block;
        width: 100%;
        max-width: 300px;
        transition: background-color 0.3s ease, box-shadow 0.3s ease;
        box-shadow: 0 4px 10px rgba(76, 175, 80, 0.4);
    }

    a:hover {
        background-color: #388e3c;
        box-shadow: 0 6px 20px rgba(56, 142, 60, 0.7);
    }
</style>
</head>
<body>
<%
    String username = null;
    Cookie[] cookies = request.getCookies();

    if (cookies != null) {
        for (Cookie ck : cookies) {
            if (ck.getName().equals("username")) {
                username = ck.getValue();
                break;
            }
        }
    }

    if (username == null) {
        response.sendRedirect("login.html");
        return;
    }
%>

<div class="container">
    <h1>Welcome, <%= username %>!</h1>
    <h3>User Dashboard.</h3>

    <ul>
        <li><a href="ApplyLeave.jsp">Apply for Leave</a></li>
        <li><a href="view">View Leave Status</a></li>
        <li><a href="logout.jsp">Logout</a></li>
    </ul>
</div>

</body>
</html>
