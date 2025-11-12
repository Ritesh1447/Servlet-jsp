<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
    Cookie[] cookies = request.getCookies();
    if (cookies != null) {
        for (Cookie ck : cookies) {
            if ("username".equals(ck.getName()) || "role".equals(ck.getName())) {
                ck.setMaxAge(0); // delete cookie
                response.addCookie(ck); // re-add to delete
            }
        }
    }

    response.sendRedirect("index.html"); // redirect to login or home
%>
