<%@page import="com.pack1.UserBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Profile</title>
<style>
    /* Styling to improve readability and visual appeal */
    body {
        font-family: 'Arial', sans-serif;
        background-color: #f4f7f6; /* Light background */
        margin: 0;
        padding: 50px 0; /* Add vertical padding for content */
        color: #333;
    }

    /* Style the main content area */
    center {
        background-color: #ffffff; /* White card background */
        padding: 40px;
        border-radius: 10px;
        box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        width: 90%;
        max-width: 600px;
        margin: 0 auto; /* Center the box */
        line-height: 1.6; /* Improve text spacing */
        text-align: left; /* Align text inside the box for better reading */
    }

    /* Style the dynamic output heading */
    h1 {
        font-size: 1.2em; /* Keep text readable but not huge */
        font-weight: normal;
        margin: 0; /* Remove default margin */
    }
    
    /* Style the session information block */
    .session-info {
        border: 1px solid #ced4da;
        padding: 15px;
        border-radius: 5px;
        margin-bottom: 20px;
        background-color: #f8f9fa; /* Slightly off-white background */
    }

    /* Style the static action links block */
    .actions-h1 {
        border-top: 1px solid #ccc;
        padding-top: 20px;
        margin-top: 20px;
        text-align: center;
    }

    /* Style the links as buttons */
    a {
        display: inline-block;
        padding: 10px 20px;
        text-decoration: none;
        border-radius: 5px;
        font-weight: bold;
        transition: background-color 0.3s, color 0.3s;
        margin: 0 10px;
    }

    /* Edit Button Styling */
    a[href="EditProfile.jsp"] {
        background-color: #ffc107; /* Yellow */
        color: #333;
    }
    a[href="EditProfile.jsp"]:hover {
        background-color: #e0a800;
    }

    /* Logout Button Styling */
    a[href="logout"] {
        background-color: #dc3545; /* Red */
        color: white;
    }
    a[href="logout"]:hover {
        background-color: #c82333;
    }
</style>
</head>
<body>
	<center>
    <%-- Wrapped the scriptlet output in a div for targeted styling --%>
    <div class="session-info">
	<%
	String f_name=(String)request.getAttribute("fname");
	UserBean ub	=(UserBean)application.getAttribute("ubean");
	
	String pwd=ub.getUser_password();
	String secure_pwd=pwd.substring(0,1)+"*****"+pwd.substring(pwd.length()-1);
	out.println("<h1>");
	out.println("This Session belongs to <strong>"+f_name+"</strong><br><br>");
    // Applying the class to the H1 that contains the data for style isolation
	out.println("<span style='font-weight: normal; font-size: 1.1em;'>");
	out.println("Username: <strong>"+ub.getUser_name()+"</strong><br>");
	out.println("Password: <strong>"+secure_pwd+" </strong><br>");
	out.println("Name: <strong>"+ub.getUser_fname()+" "+ub.getUser_lname()+"</strong><br>");
	out.println("Email: <strong>"+ub.getUser_mail()+"</strong><br>");
	out.println("Phone: <strong>"+ub.getUser_phone()+"</strong>");
	out.println("</span>");
	out.println("</h1>");
	%>
    </div>
	<h1 class="actions-h1">
	<a href="EditProfile.jsp">Edit Profile</a>
	<a href="logout">Logout</a>
	</h1>
	
	</center>
	
</body>
</html>