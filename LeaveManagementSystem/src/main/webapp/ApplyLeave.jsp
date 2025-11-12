<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Apply Leave</title>
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
        padding: 40px 30px;
        width: 360px;
        text-align: center;
    }

    h2 {
        margin-bottom: 30px;
        color: #d4ffd8;
        text-shadow: 0 0 6px rgba(76, 175, 80, 0.9);
        font-weight: 700;
        font-size: 2rem;
    }

    form {
        display: grid;
        grid-template-columns: 1fr 1fr;
        gap: 12px 20px; /* vertical 12px, horizontal 20px */
        color: #d4ffd8;
        align-items: center;
    }

    label {
        font-weight: 600;
        font-size: 0.9rem;
        text-align: left;
    }

    input[type="text"],
    input[type="date"] {
        padding: 10px;
        border-radius: 8px;
        border: 1.5px solid #76c893;
        background: rgba(255, 255, 255, 0.2);
        color: #e6f2e6;
        font-size: 1rem;
        outline: none;
        transition: border-color 0.3s ease;
        grid-column: span 1;
    }

    input[type="text"]::placeholder,
    input[type="date"]::placeholder {
        color: #c0d9c0;
    }

    input[type="text"]:focus,
    input[type="date"]:focus {
        border-color: #4caf50;
        background: rgba(255, 255, 255, 0.3);
    }

    /* Reason field and submit take full width */
    label[for="reason"],
    input#reason,
    input[type="submit"] {
        grid-column: 1 / -1;
    }

    input[type="submit"] {
        margin-top: 10px;
        padding: 14px 0;
        background-color: #4caf50;
        color: #f0f2f5;
        font-size: 1.1rem;
        font-weight: 700;
        border: none;
        border-radius: 10px;
        cursor: pointer;
        box-shadow: 0 5px 15px rgba(76, 175, 80, 0.6);
        transition: background-color 0.3s ease, box-shadow 0.3s ease;
    }

    input[type="submit"]:hover {
        background-color: #388e3c;
        box-shadow: 0 8px 25px rgba(56, 142, 60, 0.8);
    }

    a {
        display: inline-block;
        margin-top: 25px;
        color: #4caf50;
        font-weight: 600;
        text-decoration: none;
        transition: color 0.3s ease;
    }

    a:hover {
        color: #2e7d32;
    }

    /* Responsive for smaller screens */
    @media (max-width: 420px) {
        .container {
            width: 95%;
            padding: 30px 20px;
        }
        form {
            grid-template-columns: 1fr;
            gap: 15px 0;
        }
        label, input[type="text"], input[type="date"], input[type="submit"] {
            grid-column: auto;
            text-align: left;
        }
        input[type="submit"] {
            margin-top: 20px;
        }
    }
</style>
</head>
<body>
    <div class="container">
        <h2>Apply for Leave</h2>
        <form action="leave" method="post">
            <label for="lid">LeaveId</label>
            <input type="text" id="lid" name="lid" placeholder="Enter Leave ID" required>

            <label for="name">UserName</label>
            <input type="text" id="name" name="name" placeholder="Enter User Name" required>

            <label for="fdate">From Date</label>
            <input type="date" id="fdate" name="fdate" required>

            <label for="tdate">To Date</label>
            <input type="date" id="tdate" name="tdate" required>

            <label for="reason">Reason</label>
            <input type="text" id="reason" name="reason" placeholder="Reason for leave" required>

            <input type="submit" value="Apply">
        </form>
        <a href="userHome.jsp">Back to Home</a>
    </div>
</body>
</html>
