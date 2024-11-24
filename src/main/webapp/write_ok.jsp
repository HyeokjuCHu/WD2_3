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

    SubjectVO vo = new SubjectVO();
    try {
        List<FileItem> items = upload.parseRequest(request);
        for (FileItem item : items) {
            if (item.isFormField()) {
                switch (item.getFieldName()) {
                    case "category":
                        vo.setCategory(item.getString("UTF-8"));
                        break;
                    case "code":
                        vo.setCode(item.getString("UTF-8"));
                        break;
                    case "name":
                        vo.setName(item.getString("UTF-8"));
                        break;
                    case "englishRatio":
                        vo.setEnglishRatio(Integer.parseInt(item.getString("UTF-8")));
                        break;
                    case "credits":
                        vo.setCredits(Integer.parseInt(item.getString("UTF-8")));
                        break;
                    case "classNum":
                        vo.setClassNum(item.getString("UTF-8"));
                        break;
                    case "professor":
                        vo.setProfessor(item.getString("UTF-8"));
                        break;
                    case "classTime":
                        vo.setClassTime(item.getString("UTF-8"));
                        break;
                    case "classRoom":
                        vo.setClassRoom(item.getString("UTF-8"));
                        break;
                    case "type":
                        vo.setGrade(item.getString("UTF-8"));
                        break;
                }
            } else {
                String fileName = new File(item.getName()).getName();
                File uploadedFile = new File(uploadPath + File.separator + fileName);
                item.write(uploadedFile);
                vo.setProfP(fileName);
            }
        }
    } catch (Exception e) {
        e.printStackTrace();
        out.println("<h3>파일 업로드 중 오류가 발생했습니다.</h3>");
        return; // 처리 중단
    }

    SubjectDAO dao = new SubjectDAO();
    dao.add(vo);
    response.sendRedirect("list.jsp");
%>
