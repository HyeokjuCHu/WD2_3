<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>과목 관리 시스템</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      background-color: #f4f4f4;
      margin: 0;
      padding: 0;
    }
    .header {
      background-color: #007BFF;
      color: white;
      padding: 10px 20px;
      text-align: center;
    }
    nav {
      margin: 20px 0;
    }
    nav a {
      margin: 0 15px;
      text-decoration: none;
      color: white;
      font-weight: bold;
    }
    nav a:hover {
      text-decoration: underline;
    }
  </style>
</head>
<body>
<div class="header">
  <h1>한동대학교</h1>
  <nav>
    <a href="index.jsp">홈</a>
    <a href="list.jsp">과목 목록</a>
    <a href="write.jsp">과목 추가</a>
  </nav>
</div>
