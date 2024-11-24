<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page pageEncoding="UTF-8" %>

<%@ include file="top.jsp" %>

<div class="container">
    <h2>환영합니다!</h2>
    <img src="handong.svg" alt="Logo" class="logo">
    <p>이곳은 과목 관리 시스템입니다. 과목 목록을 보고 추가할 수 있습니다.</p>
</div>

<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f4f4f4;
        margin: 0;
        padding: 20px;
    }

    .container {
        max-width: 800px;
        margin: auto;
        background: white;
        padding: 20px;
        border-radius: 8px;
        box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
        text-align: center; /* 중앙 정렬 */
    }

    h2 {
        color: #333;
        margin-bottom: 20px;
    }

    .welcome-image {
        max-width: 100%; /* 반응형 이미지 */
        height: auto; /* 비율 유지 */
        margin-bottom: 20px; /* 이미지와 텍스트 간 간격 */
        border-radius: 8px; /* 이미지 둥글게 */
    }

    p {
        color: #555;
        font-size: 18px;
    }
</style>

<%@ include file="bottom.jsp" %>
