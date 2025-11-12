<%@page import="java.util.Iterator"%>
<%@page import="Pack1.LeaveBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Leaves</title>

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
        color: #e0f2e9;
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
        padding: 30px 40px;
        width: 90%;
        max-width: 900px;
        text-align: center;
    }

    h2 {
        margin-bottom: 30px;
        font-weight: 700;
        font-size: 2.2rem;
        color: #a9dfbf;
        text-shadow: 0 0 6px rgba(76, 175, 80, 0.9);
    }

    table {
        width: 100%;
        border-collapse: collapse;
        border-radius: 12px;
        overflow: hidden;
        box-shadow: 0 0 10px rgba(76, 175, 80, 0.4);
        background: rgba(255, 255, 255, 0.25);
        color: #1b1b1b;
        font-weight: 600;
        font-size: 1rem;
    }

    th, td {
        padding: 14px 20px;
        border-bottom: 1px solid rgba(76, 175, 80, 0.3);
        text-align: center;
    }

    th {
        background: #4caf50cc;
        color: white;
        font-weight: 700;
        letter-spacing: 0.05em;
    }

    tr:nth-child(even) {
        background: rgba(255, 255, 255, 0.12);
    }

    tr:hover {
        background-color: rgba(76, 175, 80, 0.15);
        cursor: default;
    }

    .no-record {
        font-size: 1.3rem;
        color: #a3a3a3;
        padding: 20px 0;
        font-weight: 600;
    }

    .btn-back {
        display: inline-block;
        padding: 10px 20px;
        background-color: #4caf50cc;
        color: white;
        text-decoration: none;
        font-weight: 600;
        border-radius: 8px;
        box-shadow: 0 4px 12px rgba(76, 175, 80, 0.6);
        transition: background-color 0.3s ease;
        margin-top: 25px;
    }

    .btn-back:hover {
        background-color: #3a9d40;
    }
</style>

</head>
<body>
<div class="container">
    <h2>Leave Application Status</h2>

    <%
    ArrayList<LeaveBean> al = (ArrayList<LeaveBean>) request.getAttribute("list");
    if (al == null || al.size() == 0) {
    %>
        <div class="no-record">No Record Found</div>
    <%
    } else {
    %>
        <table>
            <tr>
                <th>Leave ID</th>
                <th>Username</th>
                <th>From Date</th>
                <th>To Date</th>
                <th>Reason</th>
                <th>Status</th>
            </tr>

            <%
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
            </tr>
            <% } %>
        </table>
    <% } %>

    <a href="userHome.jsp" class="btn-back">Back to Home</a>

</div>
</body>
</html>
