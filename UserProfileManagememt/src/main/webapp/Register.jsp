<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Action Status</title>
<style>
    /* 1. Base Styles & Layout */
    body {
        font-family: 'Verdana', sans-serif;
        background-color: #e9ecef; /* Light background */
        display: flex;
        justify-content: center;
        align-items: center;
        min-height: 100vh;
        margin: 0;
        color: #343a40;
    }

    /* 2. Status Card Container (Styling the <center> tag) */
    center {
        background-color: #ffffff;
        padding: 40px;
        border-radius: 10px;
        box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15); /* Clear shadow */
        width: 90%;
        max-width: 450px;
        text-align: center;
    }

    /* 3. Status Message Heading */
    h1 {
        font-size: 1.6em;
        font-weight: 600;
        color: #28a745; /* Success Green default */
        margin: 0 0 20px 0;
        padding-bottom: 15px;
        border-bottom: 2px solid #e9ecef;
    }

    /* 4. Separator for Included Content */
    .included-section {
        margin-top: 30px;
        padding-top: 20px;
        border-top: 1px solid #ccc;
    }

    /* Note: If the status message is an error, we can override the color */
    .error-msg {
        color: #dc3545 !important; /* Red for errors */
    }
</style>
<script>
    // Simple script to check the message content and apply an error class if needed
    window.onload = function() {
        const h1 = document.querySelector('center > h1');
        if (h1) {
            const text = h1.textContent.toLowerCase();
            if (text.includes('error') || text.includes('failed') || text.includes('unsuccessful')) {
                h1.classList.add('error-msg');
            }
        }
    };
</script>
</head>
<body>
	<center>
	<%
	String data=(String)request.getAttribute("msg");
	out.println("<h1>"+data+"</h1>");
	%>

    <div class="included-section">
        <jsp:include page="index.html"/>
    </div>


</body>
</html>