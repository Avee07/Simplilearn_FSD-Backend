<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="com.cisco.dao.TrainerDAO" %>
<html>
<head>
    <title>Delete Trainer</title>
</head>
<body>
    <h2>Delete Trainer</h2>

    <%
        String tEmail = request.getParameter("tEmail");
        TrainerDAO trainerDAO = new TrainerDAO();
        boolean isDeleted = trainerDAO.deleteTrainer(tEmail);

        if (isDeleted) {
            out.println("<p>Trainer deleted successfully!</p>");
        } else {
            out.println("<p>Failed to delete trainer.</p>");
        }
    %>

</body>
</html>
