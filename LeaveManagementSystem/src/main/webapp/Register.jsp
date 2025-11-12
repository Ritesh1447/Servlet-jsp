<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Registration</title>
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
        position: relative;
        color: #ffffff;
        display: flex;
        align-items: center;
        justify-content: center;
    }

    /* Overlay for readability */
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
        width: 400px;
        padding: 30px;
        background: rgba(255, 255, 255, 0.1);
        backdrop-filter: blur(10px);
        border-radius: 12px;
        box-shadow: 0 8px 30px rgba(0, 0, 0, 0.5);
    }

    h2 {
        text-align: center;
        color: #ffffff;
        margin-bottom: 25px;
        font-weight: 600;
        letter-spacing: 1px;
    }

    input[type="text"],
    input[type="password"],
    select {
        width: 100%;
        padding: 12px;
        margin: 10px 0 20px;
        border: none;
        border-radius: 8px;
        background-color: rgba(255, 255, 255, 0.2);
        color: #ffffff;
        font-size: 15px;
    }

    input[type="text"]::placeholder,
    input[type="password"]::placeholder {
        color: #e0e0e0;
    }

    select {
        color: #ffffff;
        background-color: rgba(255, 255, 255, 0.2);
    }

    select option {
        background-color: #444;
        color: #fff;
    }

    input[type="submit"] {
        width: 100%;
        padding: 12px;
        background: linear-gradient(to right, #ff416c, #ff4b2b);
        color: white;
        border: none;
        border-radius: 8px;
        font-size: 16px;
        font-weight: bold;
        cursor: pointer;
        transition: background 0.3s ease, transform 0.2s ease;
    }

    input[type="submit"]:hover {
        background: linear-gradient(to right, #ff4b2b, #ff416c);
        transform: translateY(-2px);
    }

    /* Responsive */
    @media (max-width: 480px) {
        .container {
            width: 90%;
            padding: 20px;
        }
    }
</style>
</head>
<body>

<div class="container">
    <h2>User Registration</h2>
    <form action="register" method="post">
        User ID:
        <input type="text" name="id" placeholder="Enter user ID" required><br>

        User Name:
        <input type="text" name="uname" placeholder="Enter username" required><br>

        Password:
        <input type="password" name="pwd" placeholder="Enter password" required><br>

        Role:
        <select name="role" required>
            <option value="">-- Select Role --</option>
            <option value="admin">Admin</option>
            <option value="user">User</option>
        </select><br>

        <input type="submit" value="Register">
    </form>
</div>

</body>
</html>
