<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page pageEncoding="UTF-8" %>
<%@ page import="org.example.hisnet2.SubjectDAO" %>
<%@ page import="org.example.hisnet2.SubjectVO" %>
<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="org.apache.commons.fileupload.disk.DiskFileItemFactory" %>
<%@ page import="org.apache.commons.fileupload.servlet.ServletFileUpload" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.List" %>

<%
  if (!ServletFileUpload.isMultipartContent(request)) {
    out.println("<h3>폼이 잘못되었습니다.</h3>");
    return;
  }

  DiskFileItemFactory factory = new DiskFileItemFactory();
  ServletFileUpload upload = new ServletFileUpload(factory);
  String uploadPath = application.getRealPath("/img"); // 실제 경로
  File uploadDir = new File(uploadPath);
  if (!uploadDir.exists()) uploadDir.mkdir();

  SubjectVO subject = new SubjectVO();
  try {
    List<FileItem> items = upload.parseRequest(request);
    for (FileItem item : items) {
      if (item.isFormField()) {
        // 일반 입력 필드 처리
        switch (item.getFieldName()) {
          case "id":
            subject.setId(Integer.parseInt(item.getString("UTF-8")));
            break;
          case "category":
            subject.setCategory(item.getString("UTF-8"));
            break;
          case "code":
            subject.setCode(item.getString("UTF-8"));
            break;
          case "name":
            subject.setName(item.getString("UTF-8"));
            break;
          case "englishRatio":
            subject.setEnglishRatio(Integer.parseInt(item.getString("UTF-8")));
            break;
          case "credits":
            subject.setCredits(Integer.parseInt(item.getString("UTF-8")));
            break;
          case "classNum":
            subject.setClassNum(item.getString("UTF-8"));
            break;
          case "professor":
            subject.setProfessor(item.getString("UTF-8"));
            break;
          case "classTime":
            subject.setClassTime(item.getString("UTF-8"));
            break;
          case "classRoom":
            subject.setClassRoom(item.getString("UTF-8"));
            break;
          case "type":
            subject.setGrade(item.getString("UTF-8"));
            break;
        }
      } else {
        // 파일 업로드 처리
        String fileName = new File(item.getName()).getName();
        if (!fileName.isEmpty()) { // 파일이 업로드된 경우에만
          File uploadedFile = new File(uploadPath + File.separator + fileName);
          item.write(uploadedFile);
          subject.setProfP(fileName); // 파일 이름을 DB에 저장
        } else {
          // 파일이 업로드되지 않은 경우, 기존 파일 이름을 유지
          SubjectDAO dao = new SubjectDAO();
          SubjectVO existingSubject = dao.get(subject.getId());
          subject.setProfP(existingSubject.getProfP()); // 기존 파일 이름 유지
        }
      }
    }
  } catch (Exception e) {
    e.printStackTrace();
    out.println("<h3>파일 업로드 중 오류가 발생했습니다.</h3>");
    return; // 처리 중단
  }

  SubjectDAO dao = new SubjectDAO();
  dao.update(subject); // update 메서드 호출
  response.sendRedirect("list.jsp");
%>
