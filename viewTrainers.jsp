<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="com.cisco.dao.TrainerDAO" %>
<%@ page import="com.cisco.pojo.Trainer" %>
<%@ page import="java.sql.SQLException"%>
<%@ page import="java.io.*" %>


<html>
<head>
    <title>View Trainers</title>
</head>
<body>
    <h2>All Trainers</h2>
    <table border="1">
        <tr>
            <th>Name</th>
            <th>Email</th>
            <th>Gender</th>
            <th>Slot Date</th>
            <th>Available Slots</th>
        </tr>
        <%
            TrainerDAO trainerDAO = new TrainerDAO();
            List<Trainer> trainers = trainerDAO.getAllTrainers();
            for (Trainer trainer : trainers) {
        %>
        <tr>
            <td><%= trainer.gettName() %></td>
            <td><%= trainer.gettEmail() %></td>
            <td><%= trainer.gettGender() %></td>
            <td><%= trainer.getSlotdate() %></td>
            <td><%= trainer.getSlots() %></td>
        </tr>
        <%
            }
        %>
    </table>
</body>
</html>
