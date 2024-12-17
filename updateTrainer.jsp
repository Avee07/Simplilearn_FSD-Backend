<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.cisco.dao.TrainerDAO" %>
<%@ page import="com.cisco.pojo.Trainer" %>
<html>
<head>
    <title>Update Trainer</title>
</head>
<body>
    <h2>Update Trainer Details</h2>

    <%
        String tEmail = request.getParameter("tEmail");
        TrainerDAO trainerDAO = new TrainerDAO();
        Trainer trainer = trainerDAO.getTrainerByEmail(tEmail);
    %>

    <form action="updateTrainer.jsp" method="post">
        <label for="tName">Name:</label>
        <input type="text" name="tName" value="<%= trainer.gettName() %>" required><br><br>

        <label for="tEmail">Email:</label>
        <input type="email" name="tEmail" value="<%= trainer.gettEmail() %>" readonly><br><br>

        <label for="tPassword">Password:</label>
        <input type="password" name="tPassword" value="<%= trainer.gettPassword() %>" required><br><br>

        <label for="tGender">Gender:</label>
        <select name="tGender">
            <option value="Male" <%= "Male".equals(trainer.gettGender()) ? "selected" : "" %>>Male</option>
            <option value="Female" <%= "Female".equals(trainer.gettGender()) ? "selected" : "" %>>Female</option>
            <option value="Other" <%= "Other".equals(trainer.gettGender()) ? "selected" : "" %>>Other</option>
        </select><br><br>

        <label for="slotdate">Slot Date:</label>
        <input type="date" name="slotdate" value="<%= trainer.getSlotdate() %>" required><br><br>

        <label for="slots">Available Slots:</label>
        <input type="number" name="slots" value="<%= trainer.getSlots() %>" required><br><br>

        <input type="submit" value="Update">
    </form>

    <%
        if (request.getMethod().equalsIgnoreCase("POST")) {
            trainer.settName(request.getParameter("tName"));
            trainer.settPassword(request.getParameter("tPassword"));
            trainer.settGender(request.getParameter("tGender"));
            trainer.setSlotdate(java.sql.Date.valueOf(request.getParameter("slotdate")));
            trainer.setSlots(Integer.parseInt(request.getParameter("slots")));

            boolean updated = trainerDAO.updateTrainer(trainer);
            if (updated) {
                out.println("<p>Trainer updated successfully!</p>");
            } else {
                out.println("<p>Failed to update trainer.</p>");
            }
        }
    %>
</body>
</html>
