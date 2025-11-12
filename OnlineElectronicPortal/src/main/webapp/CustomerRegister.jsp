<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Message Page</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" 
      rel="stylesheet" 
      integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" 
      crossorigin="anonymous">

<style>
    body {
        background-image: url('https://png.pngtree.com/background/20230413/original/pngtree-business-e-shopping-picture-image_2422998.jpg');
        background-size: cover; 
        background-position: center; 
        background-attachment: fixed;
        min-height: 100vh;
        margin: 0;
        padding-top: 50px;
    }
    
    h1 {
        margin: 0 auto;
        background: rgba(0, 0, 0, 0.65);
        padding: 20px 30px;
        border-radius: 10px;
        color: #FFD700; 
        font-size: 1.5rem;
        font-weight: 600;
        box-shadow: 0 0 10px rgba(255, 215, 0, 0.3);
        animation: glowText 2s ease-in-out infinite alternate;
    }

    @keyframes glowText {
        from { box-shadow: 0 0 5px rgba(255, 215, 0, 0.5); }
        to { box-shadow: 0 0 20px rgba(255, 215, 0, 0.8), 0 0 5px rgba(255, 215, 0, 0.8); }
    }
    
    .login-include-section {
        margin-top: 30px;
    }
</style>
</head>
<body>
    
    <center>
        <h1>
        <%
        String data=(String)request.getAttribute("msg");
        out.println(data+"<br><br>");
        %>
        </h1>
    </center>
    
    <div class="login-include-section">
        <jsp:include page="CustomerLogin.html"></jsp:include>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" 
            integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" 
            crossorigin="anonymous">
    </script>
</body>
</html>