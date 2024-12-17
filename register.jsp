<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="com.cisco.dao.TrainerDAO" %>
<%@ page import="com.cisco.pojo.Trainer" %>
<html>
<head>
    <title>Trainer Registration</title>
</head>
<body>
    <h2>Register as a Trainer</h2>
    <form action="register.jsp" method="post">
        <label for="tName">Name:</label>
        <input type="text" name="tName" required><br><br>

        <label for="tEmail">Email:</label>
        <input type="email" name="tEmail" required><br><br>

        <label for="tPassword">Password:</label>
        <input type="password" name="tPassword" required><br><br>

        <label for="tGender">Gender:</label>
        <select name="tGender" required>
            <option value="Male">Male</option>
            <option value="Female">Female</option>
            <option value="Other">Other</option>
        </select><br><br>

        <label for="slotdate">Slot Date:</label>
        <input type="date" name="slotdate" required><br><br>

        <label for="slots">Available Slots:</label>
        <input type="number" name="slots" value="30" required><br><br>

        <input type="submit" value="Register">
    </form>

    <%
        if (request.getMethod().equalsIgnoreCase("POST")) {
            String tName = request.getParameter("tName");
            String tEmail = request.getParameter("tEmail");
            String tPassword = request.getParameter("tPassword");
            String tGender = request.getParameter("tGender");
            java.sql.Date slotdate = java.sql.Date.valueOf(request.getParameter("slotdate"));
            int slots = Integer.parseInt(request.getParameter("slots"));

            Trainer trainer = new Trainer();
            trainer.settName(tName);
            trainer.settEmail(tEmail);
            trainer.settPassword(tPassword);
            trainer.settGender(tGender);
            trainer.setSlotdate(slotdate);
            trainer.setSlots(slots);

            TrainerDAO trainerDAO = new TrainerDAO();
            boolean isRegistered = trainerDAO.registerTrainer(trainer);

            if (isRegistered) {
                out.println("<p>Registration Successful!</p>");
            } else {
                out.println("<p>Registration Failed!</p>");
            }
        }
    %>
</body>
</html>
