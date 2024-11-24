<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page pageEncoding="UTF-8" %>

<%@ page import="org.example.hisnet2.SubjectDAO" %>
<%@ page import="org.example.hisnet2.SubjectVO" %>

<%
  int id = Integer.parseInt(request.getParameter("id"));

  SubjectDAO dao = new SubjectDAO();
  dao.incrementViewCount(id);
  SubjectVO vo = dao.get(id);
%>

<jsp:include page="top.jsp" />
<h2>과목 상세보기</h2>
<table>
  <tr>
    <th>ID</th>
    <td><%= vo.getId() %></td>
  </tr>
  <tr>
    <th>교수 사진</th>
    <td><img src="<%= request.getContextPath() + "/img/" + vo.getProfP() %>" alt="교수님 사진" style="width:50px; height:50px;"/></td>
  </tr>
  <tr>
    <th>이수구분</th>
    <td><%= vo.getCategory() %></td>
  </tr>
  <tr>
    <th>과목코드</th>
    <td><%= vo.getCode() %></td>
  </tr>
  <tr>
    <th>과목명</th>
    <td><%= vo.getName() %></td>
  </tr>
  <tr>
    <th>영어비율</th>
    <td><%= vo.getEnglishRatio() %></td>
  </tr>
  <tr>
    <th>학점</th>
    <td><%= vo.getCredits() %></td>
  </tr>
  <tr>
    <th>분반</th>
    <td><%= vo.getClassNum() %></td>
  </tr>
  <tr>
    <th>담당교수</th>
    <td><%= vo.getProfessor() %></td>
  </tr>
  <tr>
    <th>수업시간</th>
    <td><%= vo.getClassTime() %></td>
  </tr>
  <tr>
    <th>강의실</th>
    <td><%= vo.getClassRoom() %></td>
  </tr>
  <tr>
    <th>유형</th>
    <td><%= vo.getGrade() %></td>
  </tr>
  <tr>
    <th>조회수</th>
    <td><%= vo.getViewCount() %></td>
  </tr>
</table>
<a href="list.jsp">목록으로 돌아가기</a>
<jsp:include page="bottom.jsp" />
