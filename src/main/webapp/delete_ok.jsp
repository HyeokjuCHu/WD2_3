<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page pageEncoding="UTF-8" %>

<%@ page import="org.example.hisnet2.SubjectDAO" %>

<%
  int id = Integer.parseInt(request.getParameter("id"));
  SubjectDAO dao = new SubjectDAO();
  dao.delete(id);

  response.sendRedirect("list.jsp");
%>
