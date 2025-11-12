<%@page import="com.pack1.UserBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Profile</title>
<style>
    /* 1. Base Styles & Centering */
    body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background-color: #f4f7f6; /* Light background */
        display: flex;
        justify-content: center;
        align-items: center;
        min-height: 100vh;
        margin: 0;
        color: #333;
    }

    /* 2. Profile Card Container (Applying styles to the <center> tag) */
    center {
        background-color: #ffffff;
        padding: 40px;
        border-radius: 10px;
        box-shadow: 0 8px 16px rgba(0, 0, 0, 0.1);
        width: 100%;
        max-width: 400px;
        margin: 0; /* Override default margins */
    }

    /* 3. Session Heading */
    h1 {
        color: #007bff;
        font-size: 1.5em;
        margin-bottom: 30px;
        padding-bottom: 10px;
        border-bottom: 2px solid #e9ecef;
        text-align: center;
    }

    /* 4. Form Layout (Flexbox for alignment) */
    form {
        display: flex;
        flex-direction: column;
        gap: 15px; /* Space between form fields/groups */
        text-align: left; /* Align field labels to the left */
    }
    
    /* Style for the text labels before the input field */
    form > input[type="text"] {
        margin-left: 10px; /* Space the input field away from the label text */
    }

    /* 5. Input Fields */
    input[type="text"] {
        width: calc(100% - 100px); /* Calculate width for input, leaving room for label */
        padding: 10px;
        border: 1px solid #ced4da;
        border-radius: 5px;
        box-sizing: border-box;
        font-size: 14px;
        float: right; /* Align inputs to the right */
    }

    /* Clearing the float after each row of inputs */
    form > br {
        display: none; /* Hide the original breaks */
    }

    /* 6. Submit Button */
    input[type="submit"] {
        background-color: #ffc107; /* Yellow for 'Update' action */
        color: #333;
        padding: 12px 25px;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        font-size: 16px;
        font-weight: bold;
        margin-top: 20px;
        transition: background-color 0.3s ease;
        width: 100%;
    }

    input[type="submit"]:hover {
        background-color: #e0a800;
    }
</style>
</head>
<body>
	<center>
	<%
	String f_name=(String)request.getAttribute("fname");
	UserBean ub	=(UserBean)application.getAttribute("ubean");
	
	out.println("<h1>");
	out.println("Editing Profile for "+ub.getUser_fname()+"");
	out.println("</h1>");
	
	%>
	
	<form action="update" method="post">
    <%-- Note: The labels are left as text nodes, and inputs are floated right for alignment --%>
	FirstName <input type="text" name="ufname" value="<%=ub.getUser_fname() %>"><br><br>
	LastName <input type="text" name="ulname" value="<%=ub.getUser_lname() %>"><br><br>
	Mail Id <input type="text" name="umail" value="<%=ub.getUser_mail() %>"><br><br>
	Phone <input type="text" name="uphone" value="<%=ub.getUser_phone() %>"><br><br>
	<input type="submit" value="Update">
	</form>
	
	</center>

</body>
</html>