<%@page import="com.pack1.UserBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Status Page</title>
<style>
    /* Base Styles & Centering */
    body {
        font-family: 'Verdana', sans-serif;
        background-color: #e9ecef; /* Light gray background */
        display: flex;
        justify-content: center;
        align-items: center;
        min-height: 100vh;
        margin: 0;
        color: #343a40;
    }

    /* Card Container (Replacing <center> with a styled element) */
    center {
        /* While <center> is used in HTML, CSS styles the content within it */
        background-color: #ffffff;
        padding: 40px;
        border-radius: 10px;
        box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        width: 90%;
        max-width: 450px;
        /* The <center> tag handles horizontal centering, but we style the box */
    }

    /* Heading for Session Info */
    .session-info {
        font-size: 1.1em;
        margin-bottom: 20px;
        padding: 15px;
        background-color: #fff3cd; /* Light yellow background */
        border: 1px solid #ffeeba;
        border-radius: 5px;
        color: #856404; /* Dark yellow text */
    }

    /* Heading for Status Message */
    .status-message {
        font-size: 1.4em;
        font-weight: bold;
        color: #28a745; /* Green for success/status */
        margin-bottom: 30px;
        border-bottom: 2px solid #28a745;
        padding-bottom: 10px;
    }

    /* Styling for the Navigation Block (your second <h1>) */
    .navigation {
        margin-top: 20px;
        padding-top: 15px;
        border-top: 1px solid #ccc;
    }

    /* Styling Links as Buttons */
    a {
        display: inline-block;
        padding: 10px 20px;
        text-decoration: none;
        border-radius: 5px;
        font-weight: bold;
        transition: background-color 0.3s, color 0.3s;
        margin: 5px 0; /* Vertical spacing between links */
    }

    /* View Profile Button */
    a[href="view"] {
        background-color: #007bff; /* Primary Blue */
        color: white;
    }
    a[href="view"]:hover {
        background-color: #0056b3;
    }

    /* Logout Button */
    a[href="logout"] {
        background-color: #dc3545; /* Red */
        color: white;
    }
    a[href="logout"]:hover {
        background-color: #c82333;
    }
    
    /* Hide the original <br> tags to control spacing with margin/padding */
    br {
        display: none;
    }
    
</style>
</head>
<body>
	<center>
    <%-- Using a div to style the scriptlet output --%>
    <div class="session-info">
		<%
		 String f_name=(String)request.getAttribute("fname");
		 String data=(String)request.getAttribute("msg");
		UserBean ub=(UserBean)application.getAttribute("ubean");
		out.println("<h1>");
		out.println("This Session belongs to <strong>"+f_name+"</strong>");
		out.println("</h1>");
		%>
    </div>
    
    <div class="status-message">
        <% 
            out.println("<h2>"+data+"</h2>");
        %>
    </div>

    <%-- Separating the navigation links for clearer styling --%>
		<h1 class="navigation">
		<a href="view">View Profie</a>
		<a href="logout">Logout</a>
		</h1>
	</center>

</body>
</html>