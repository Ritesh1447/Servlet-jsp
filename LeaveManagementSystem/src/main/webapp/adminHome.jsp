<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="javax.servlet.http.Cookie" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Admin Home</title>
    <style>
        /* Reset */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            height: 100vh;
            background: url('https://images.unsplash.com/photo-1508780709619-79562169bc64?auto=format&fit=crop&w=1950&q=80') no-repeat center center fixed;
            background-size: cover;
            display: flex;
            justify-content: center;
            align-items: center;
            position: relative;
            color: #f0f2f5;
        }

        /* Dark overlay */
        body::before {
            content: '';
            position: absolute;
            inset: 0;
            background: rgba(0, 0, 0, 0.6);
            z-index: 0;
        }

        .container {
            position: relative;
            z-index: 1;
            width: 450px;
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(12px);
            border-radius: 16px;
            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.5);
            padding: 40px 30px;
            text-align: center;
        }

        h1 {
            font-weight: 700;
            font-size: 2rem;
            margin-bottom: 10px;
            color: #d4ffd8;
            text-shadow: 0 0 5px rgba(76, 175, 80, 0.8);
        }

        p {
            font-size: 1.1rem;
            margin-bottom: 30px;
            color: #cce5cc;
        }

        ul {
            list-style: none;
            padding: 0;
            margin: 0 auto;
            max-width: 300px;
        }

        li {
            margin: 18px 0;
        }

        a {
            color: #a8d5a8;
            text-decoration: none;
            font-weight: 600;
            font-size: 1.1rem;
            padding: 10px 15px;
            border-radius: 8px;
            display: inline-block;
            transition: background-color 0.3s, color 0.3s;
            backdrop-filter: blur(6px);
            background: rgba(255, 255, 255, 0.12);
            box-shadow: 0 0 8px rgba(168, 213, 168, 0.4);
        }

        a:hover {
            background-color: #4caf50;
            color: #fff;
            box-shadow: 0 0 15px #4caf50;
        }

        @media (max-width: 480px) {
            .container {
                width: 90%;
                padding: 30px 20px;
            }
        }
    </style>
</head>
<body>
<%
    String username = null;
    String role = null;

    Cookie[] cookies = request.getCookies();
    if (cookies != null) {
        for (Cookie c : cookies) {
            if ("username".equals(c.getName())) {
                username = c.getValue();
            }
            if ("role".equals(c.getName())) {
                role = c.getValue();
            }
        }
    }

    if (username == null || role == null || !role.equalsIgnoreCase("admin")) {
        response.sendRedirect("index.html"); 
        return;
    }
%>

<div class="container">
    <h1>Welcome, <%= username %>! (Admin)</h1>
    <p>Admin Dashboard.</p>

    <ul>
        <li><a href="aview">View All Leave Requests</a></li>
        <li><a href="logout.jsp">Logout</a></li>
    </ul>
</div>

</body>
</html>
