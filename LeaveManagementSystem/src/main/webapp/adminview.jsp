<%@page import="Pack1.LeaveBean"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Leave Requests</title>
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
        background: url('https://images.unsplash.com/photo-1519389950473-47ba0277781c?auto=format&fit=crop&w=1950&q=80') no-repeat center center fixed;
        background-size: cover;
        display: flex;
        justify-content: center;
        align-items: flex-start;
        padding: 50px 20px;
        color: #f0f2f5;
        position: relative;
        min-height: 100vh;
    }

    body::before {
        content: '';
        position: fixed;
        inset: 0;
        background: rgba(0, 0, 0, 0.55);
        z-index: 0;
    }

    .container {
        position: relative;
        z-index: 1;
        background: rgba(255, 255, 255, 0.1);
        backdrop-filter: blur(12px);
        border-radius: 16px;
        box-shadow: 0 8px 32px rgba(0, 0, 0, 0.4);
        width: 90%;
        max-width: 1100px;
        padding: 30px 40px;
        overflow-x: auto;
    }

    h2 {
        color: #d4ffd8;
        font-weight: 700;
        font-size: 2rem;
        margin-bottom: 25px;
        text-align: center;
        text-shadow: 0 0 8px rgba(76, 175, 80, 0.9);
    }

    table {
        width: 100%;
        border-collapse: collapse;
        color: #e0e8e0;
        box-shadow: 0 0 10px rgba(76, 175, 80, 0.3);
        border-radius: 10px;
        overflow: hidden;
        background: rgba(255, 255, 255, 0.15);
        backdrop-filter: blur(8px);
    }

    th, td {
        padding: 14px 12px;
        text-align: center;
        border-bottom: 1px solid rgba(255, 255, 255, 0.2);
        font-size: 1rem;
    }

    th {
        background-color: rgba(76, 175, 80, 0.8);
        color: #f0f2f5;
        font-weight: 600;
        text-shadow: 0 0 5px #4caf50;
    }

    tr:hover {
        background-color: rgba(76, 175, 80, 0.15);
    }

    select {
        padding: 6px 10px;
        border-radius: 6px;
        border: none;
        font-size: 1rem;
        background-color: rgba(255,255,255,0.25);
        color: #1a1a1a;
        font-weight: 600;
        cursor: pointer;
        transition: background-color 0.3s;
    }

    select:hover, select:focus {
        background-color: rgba(255,255,255,0.4);
        outline: none;
    }

    input[type="submit"] {
        padding: 8px 18px;
        background-color: #4caf50;
        border: none;
        color: white;
        font-weight: 700;
        font-size: 1rem;
        cursor: pointer;
        border-radius: 6px;
        transition: background-color 0.3s, box-shadow 0.3s;
    }

    input[type="submit"]:hover {
        background-color: #388e3c;
        box-shadow: 0 0 10px #388e3c;
    }

    a {
        display: inline-block;
        margin-top: 30px;
        color: #a8d5a8;
        font-weight: 600;
        font-size: 1.1rem;
        text-decoration: none;
        padding: 10px 25px;
        border-radius: 8px;
        background: rgba(255, 255, 255, 0.12);
        backdrop-filter: blur(6px);
        box-shadow: 0 0 8px rgba(168, 213, 168, 0.4);
        transition: background-color 0.3s, color 0.3s;
    }

    a:hover {
        background-color: #4caf50;
        color: #fff;
        box-shadow: 0 0 15px #4caf50;
    }

    /* Responsive table */
    @media (max-width: 768px) {
        table, th, td {
            font-size: 0.9rem;
        }
        input[type="submit"], select {
            font-size: 0.9rem;
            padding: 6px 14px;
        }
    }
</style>
</head>
<body>

<div class="container">
    <h2>Leave Requests</h2>

    <table cellpadding="10" cellspacing="0">
        <tr>
            <th>Leave ID</th>
            <th>Username</th>
            <th>From Date</th>
            <th>To Date</th>
            <th>Reason</th>
            <th>Status</th>
            <th>Update Status</th>
        </tr>

    <%
        ArrayList<LeaveBean> al = (ArrayList<LeaveBean>) request.getAttribute("list");
        if (al == null || al.size() == 0) {
    %>
        <tr><td colspan="7" style="color:#f0f2f5;">No leave requests found.</td></tr>
    <%
        } else {
            Iterator<LeaveBean> i = al.iterator();
            while (i.hasNext()) {
                LeaveBean lb = i.next();

                String from = lb.getFromdate().substring(0, 10);
                String to = lb.getTo_date().substring(0, 10);
                String fromFormatted = from.substring(8, 10) + "-" + from.substring(5, 7) + "-" + from.substring(0, 4);
                String toFormatted = to.substring(8, 10) + "-" + to.substring(5, 7) + "-" + to.substring(0, 4);
    %>
        <tr>
            <td><%= lb.getLeaveId() %></td>
            <td><%= lb.getUsername() %></td>
            <td><%= fromFormatted %></td>
            <td><%= toFormatted %></td>
            <td><%= lb.getReason() %></td>
            <td><%= lb.getStatus() %></td>
            <td>
                <form action="updateStatus" method="post">
                    <input type="hidden" name="lid" value="<%= lb.getLeaveId() %>" />
                    <select name="status">
                        <option value="Pending" <%= "Pending".equalsIgnoreCase(lb.getStatus()) ? "selected" : "" %>>Pending</option>
                        <option value="Approved" <%= "Approved".equalsIgnoreCase(lb.getStatus()) ? "selected" : "" %>>Approved</option>
                        <option value="Rejected" <%= "Rejected".equalsIgnoreCase(lb.getStatus()) ? "selected" : "" %>>Rejected</option>
                    </select>
                    <input type="submit" value="Update" />
                </form>
            </td>
        </tr>
    <%
            }
        }
    %>
    </table>

    <a href="adminHome.jsp">Back to Admin Home</a>
</div>

</body>
</html>
