<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page pageEncoding="UTF-8" %>
<%

  request.setCharacterEncoding("UTF-8");

%>

<%@ page import="org.example.hisnet2.SubjectDAO" %>
<%@ page import="org.example.hisnet2.SubjectVO" %>
<%@ include file="top.jsp" %>
<%
  SubjectDAO dao = new SubjectDAO();
  int id = Integer.parseInt(request.getParameter("id"));
  SubjectVO subject = dao.get(id);
%>

<div class="container">
  <h1>과목 수정</h1>
  <form action="edit_ok.jsp" method="post" accept-charset="UTF-8" enctype="multipart/form-data">
    <input type="hidden" name="id" value="<%= subject.getId() %>">
    <label for="category">이수구분</label>
    <input type="text" id="category" name="category" value="<%= subject.getCategory() %>" required>
    <label for="code">과목코드</label>
    <input type="text" id="code" name="code" value="<%= subject.getCode() %>" required>
    <label for="name">과목명</label>
    <input type="text" id="name" name="name" value="<%= subject.getName() %>" required>
    <label for="englishRatio">영어비율</label>
    <input type="number" id="englishRatio" name="englishRatio" value="<%= subject.getEnglishRatio() %>" required>
    <label for="credits">학점</label>
    <input type="number" id="credits" name="credits" value="<%= subject.getCredits() %>" required>
    <label for="classNum">분반</label>
    <input type="text" id="classNum" name="classNum" value="<%= subject.getClassNum() %>" required>
    <label for="professor">담당교수</label>
    <input type="text" id="professor" name="professor" value="<%= subject.getProfessor() %>" required>
    <label for="classTime">수업시간</label>
    <input type="text" id="classTime" name="classTime" value="<%= subject.getClassTime() %>" required>
    <label for="classRoom">강의실</label>
    <input type="text" id="classRoom" name="classRoom" value="<%= subject.getClassRoom() %>" required>
    <label for="type">유형</label>
    <input type="text" id="type" name="type" value="<%= subject.getGrade() %>" required>
    <label for="profP">교수님 사진</label>
    <input type="file" name="profP" accept="image/*" />
    <input type="submit" value="수정하기">
  </form>

</div>
<%@ include file="bottom.jsp" %>
