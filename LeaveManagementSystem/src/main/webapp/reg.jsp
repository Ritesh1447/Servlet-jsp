<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
<style>
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
        align-items: center;
        justify-content: center;
        position: relative;
    }

    /* Dark overlay for readability */
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
        width: 900px;
        max-width: 95%;
        background: rgba(255, 255, 255, 0.08);
        backdrop-filter: blur(10px);
        border-radius: 16px;
        box-shadow: 0 8px 32px rgba(0, 0, 0, 0.5);
        display: flex;
        flex-direction: column;
        align-items: center;
        padding: 40px;
    }

    .message {
        width: 100%;
        padding: 16px 24px;
        margin-bottom: 25px;
        text-align: center;
        font-size: 1.2em;
        font-weight: 500;
        border-radius: 10px;
        backdrop-filter: blur(8px);
        background: rgba(255, 255, 255, 0.15);
        transition: all 0.3s ease-in-out;
    }

    .success {
        color: #d4ffd8;
        border-left: 6px solid #4CAF50;
        box-shadow: 0 0 10px #4CAF50aa;
    }

    .error {
        color: #ffd4d4;
        border-left: 6px solid #f44336;
        box-shadow: 0 0 10px #f44336aa;
    }

    /* Optional: fade-in animation */
    .message {
        animation: fadeIn 0.6s ease-in-out;
    }

    @keyframes fadeIn {
        from { opacity: 0; transform: translateY(-10px); }
        to { opacity: 1; transform: translateY(0); }
    }

    /* Include form styling from index.html (if needed) */
    .form-wrapper {
        width: 100%;
    }

    @media (max-width: 768px) {
        .container {
            padding: 20px;
        }
    }
</style>
</head>
<body>

<div class="container">
    <%-- Show message inside container (doesn't affect layout flow) --%>
    <%
        String data = (String) request.getAttribute("msg");
        if (data != null && !data.trim().isEmpty()) {
            String cssClass = data.toLowerCase().contains("success") ? "success" : "error";
    %>
        <div class="message <%= cssClass %>">
            <%= data %>
        </div>
    <%
        }
    %>

    <div class="form-wrapper">
        <jsp:include page="index.html" />
    </div>
</div>

</body>
</html>
