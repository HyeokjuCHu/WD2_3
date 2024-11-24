<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page pageEncoding="UTF-8" %>
<jsp:include page="top.jsp" />
<%

    request.setCharacterEncoding("UTF-8");

%>

<div class="container">
    <h2>과목 추가하기</h2>
    <form action="write_ok.jsp" method="post" accept-charset="utf-8" enctype="multipart/form-data">
        <table>
            <tr>
                <th>이수구분</th>
                <td><input type="text" name="category" required /></td>
            </tr>
            <tr>
                <th>과목코드</th>
                <td><input type="text" name="code" required /></td>
            </tr>
            <tr>
                <th>과목명</th>
                <td><input type="text" name="name" required /></td>
            </tr>
            <tr>
                <th>영어비율</th>
                <td><input type="text" name="englishRatio" required /></td>
            </tr>
            <tr>
                <th>학점</th>
                <td><input type="text" name="credits" required /></td>
            </tr>
            <tr>
                <th>분반</th>
                <td><input type="text" name="classNum" required /></td>
            </tr>
            <tr>
                <th>담당교수</th>
                <td><input type="text" name="professor" required /></td>
            </tr>
            <tr>
                <th>수업시간</th>
                <td><input type="text" name="classTime" required /></td>
            </tr>
            <tr>
                <th>강의실</th>
                <td><input type="text" name="classRoom" required /></td>
            </tr>
            <tr>
                <th>유형</th>
                <td><input type="text" name="type" required /></td>
            </tr>
            <tr>
                <th>교수님 사진</th>
                <td><input type="file" name="profP" accept="image/*" required /></td>
            </tr>
        </table>
        <input type="submit" value="추가" />
    </form>
    <a href="list.jsp">목록으로 돌아가기</a>
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
    }

    h2 {
        text-align: center;
        color: #333;
        margin-bottom: 20px;
    }

    table {
        width: 100%;
        border-collapse: collapse;
        margin-bottom: 20px;
    }

    th, td {
        padding: 12px;
        text-align: left;
        border-bottom: 1px solid #ddd;
    }

    th {
        background-color: #007BFF;
        color: white;
    }

    input[type="text"], input[type="checkbox"] {
        width: calc(100% - 20px);
        padding: 10px;
        border: 1px solid #ddd;
        border-radius: 4px;
    }

    input[type="submit"] {
        background-color: #007BFF;
        color: white;
        border: none;
        padding: 10px;
        border-radius: 4px;
        cursor: pointer;
        font-size: 16px;
        margin-top: 10px;
        width: 100%;
    }

    input[type="submit"]:hover {
        background-color: #0056b3;
    }

    a {
        display: block;
        text-align: center;
        margin-top: 20px;
        color: #007BFF;
        text-decoration: none;
    }

    a:hover {
        text-decoration: underline;
    }
</style>

<jsp:include page="bottom.jsp" />
