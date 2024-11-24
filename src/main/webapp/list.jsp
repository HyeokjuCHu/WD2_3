<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page pageEncoding="UTF-8" %>

<%@ page import="java.util.List" %>
<%@ page import="org.example.hisnet2.SubjectDAO" %>
<%@ page import="org.example.hisnet2.SubjectVO" %>
<%@ include file="top.jsp" %>

<div class="container">
  <h1>과목 목록</h1>

  <form action="list.jsp" method="get" class="search-form">
    <input type="text" name="searchTerm" placeholder="검색어를 입력하세요" value="<%= request.getParameter("searchTerm") != null ? request.getParameter("searchTerm") : "" %>"/>
    <input type="submit" value="검색" />
  </form>

  <form action="list.jsp" method="get" class="sort-form">
    <select name="orderBy">
      <option value="">정렬 기준 선택</option>
      <option value="credits ASC" <%= "credits ASC".equals(request.getParameter("orderBy")) ? "selected" : "" %>>학점 오름차순</option>
      <option value="credits DESC" <%= "credits DESC".equals(request.getParameter("orderBy")) ? "selected" : "" %>>학점 내림차순</option>
    </select>
    <input type="submit" value="정렬" />
  </form>

  <table>
    <thead>
    <tr>
      <th>ID</th>
      <th>교수 사진</th>
      <th>이수구분</th>
      <th>과목코드</th>
      <th>과목명</th>
      <th>영어비율</th>
      <th>학점</th>
      <th>분반</th>
      <th>담당교수</th>
      <th>수업시간</th>
      <th>강의실</th>
      <th>유형</th>
      <th class="wide-cell">Actions</th>
    </tr>
    </thead>
    <tbody>
    <%
      SubjectDAO dao = new SubjectDAO();
      String searchTerm = request.getParameter("searchTerm");
      String orderBy = request.getParameter("orderBy"); // 정렬 기준 가져오기
      List<SubjectVO> list;

      // 검색어와 정렬 기준을 이용하여 리스트 가져오기
      if (searchTerm != null && !searchTerm.isEmpty()) {
        list = dao.list(searchTerm, orderBy); // 정렬 기준 추가
      } else {
        list = dao.list(null, orderBy); // 정렬 기준 추가
      }

      for (SubjectVO vo : list) {
    %>
    <tr>
      <td><%= vo.getId() %></td>
      <td><img src="<%= request.getContextPath() + "/img/" + vo.getProfP() %>" alt="교수님 사진" style="width:50px; height:50px;"/></td>
      <td><%= vo.getCategory() %></td>
      <td><%= vo.getCode() %></td>
      <td><%= vo.getName() %></td>
      <td><%= vo.getEnglishRatio() %></td>
      <td><%= vo.getCredits() %></td>
      <td><%= vo.getClassNum() %></td>
      <td><%= vo.getProfessor() %></td>
      <td><%= vo.getClassTime() %></td>
      <td><%= vo.getClassRoom() %></td>
      <td><%= vo.getGrade() %></td>
      <td>
        <a href="view.jsp?id=<%= vo.getId() %>">보기</a>
        <a href="edit.jsp?id=<%= vo.getId() %>">수정</a>
        <a href="delete_ok.jsp?id=<%= vo.getId() %>">삭제</a>
      </td>
    </tr>
    <%
      }
    %>
    </tbody>
  </table>
</div>

<style>
  body {
    font-family: Arial, sans-serif;
    background-color: #f4f4f4;
    margin: 0;
    padding: 20px;
  }

  .container {
    max-width: 1200px;
    margin: auto;
    background: white;
    padding: 20px;
    border-radius: 8px;
    box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
  }

  h1 {
    text-align: center;
    color: #333;
    margin-bottom: 20px;
  }

  table {
    width: 100%;
    border-collapse: collapse;
    margin: 20px 0;
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

  tr:hover {
    background-color: #f1f1f1;
  }

  a {
    color: #007BFF;
    text-decoration: none;
    margin-right: 10px;
  }

  a:hover {
    text-decoration: underline;
  }
  .wide-cell{
    width:30px;
  }

  .search-form {
    margin-bottom: 20px;
    text-align: center;
  }

  .search-form input[type="text"] {
    padding: 10px;
    width: 300px;
    border: 1px solid #ddd;
    border-radius: 4px;
  }

  .search-form input[type="submit"] {
    padding: 10px 15px;
    background-color: #007BFF;
    color: white;
    border: none;
    border-radius: 4px;
    cursor: pointer;
  }

  .search-form input[type="submit"]:hover {
    background-color: #0056b3;
  }

  .sort-form {
    margin-bottom: 20px;
    text-align: center;
  }

  .sort-form select {
    padding: 10px;
    width: 150px;
    border: 1px solid #ddd;
    border-radius: 4px;
    margin-right: 10px;
    cursor: pointer;
  }

  .sort-form input[type="submit"] {
    padding: 10px 15px;
    background-color: #28a745;
    color: white;
    border: none;
    border-radius: 4px;
    cursor: pointer;
  }

  @media (max-width: 768px) {
    table, thead, tbody, th, td, tr {
      display: block;
    }

    thead tr {
      position: absolute;
      top: -9999px;
      left: -9999px;
    }

    tr {
      margin-bottom: 15px;
    }

    td {
      text-align: right;
      padding-left: 50%;
      position: relative;
    }

    td::before {
      content: attr(data-label);
      position: absolute;
      left: 10px;
      width: 50%;
      padding-left: 10px;
      text-align: left;
      font-weight: bold;
    }
  }
</style>


<%@ include file="bottom.jsp" %>
