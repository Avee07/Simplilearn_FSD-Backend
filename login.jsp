<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="com.cisco.dao.TrainerDAO" %>
<html>
<head>
    <title>Trainer Login</title>
</head>
<body>
    <h2>Trainer Login</h2>
    <form action="login.jsp" method="post">
        <label for="tEmail">Email:</label>
        <input type="email" name="tEmail" required><br><br>

        <label for="tPassword">Password:</label>
        <input type="password" name="tPassword" required><br><br>

        <input type="submit" value="Login">
    </form>

    <%
        if (request.getMethod().equalsIgnoreCase("POST")) {
            String tEmail = request.getParameter("tEmail");
            String tPassword = request.getParameter("tPassword");

            TrainerDAO trainerDAO = new TrainerDAO();
            boolean isValidUser = trainerDAO.validateLogin(tEmail, tPassword);

            if (isValidUser) {
                out.println("<p>Login Successful!</p>");
                out.println("<a href='viewTrainers.jsp'>View Trainers</a>");
                out.println("<a href='updateTrainer.jsp?tEmail=" + tEmail + "'>Update Profile</a>");
                out.println("<a href='deleteTrainer.jsp?tEmail=" + tEmail + "'>Delete Profile</a>");
            } else {
                out.println("<p>Invalid email or password!</p>");
            }
        }
    %>
</body>
</html>
