package org.example.hisnet2;

import org.example.hisnet2.JDBCUtil;
import org.example.hisnet2.SubjectVO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class SubjectDAO {
    private Connection conn;

    public SubjectDAO() {
        try {
            conn = JDBCUtil.getConnection();
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }


    public void add(SubjectVO subject) {
        String sql = "INSERT INTO subjects (category, code, name, englishRatio, credits, classNum, professor, classTime, classRoom, grade,profP) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, subject.getCategory());
            pstmt.setString(2, subject.getCode());
            pstmt.setString(3, subject.getName());
            pstmt.setInt(4, subject.getEnglishRatio());
            pstmt.setInt(5, subject.getCredits());
            pstmt.setString(6, subject.getClassNum());
            pstmt.setString(7, subject.getProfessor());
            pstmt.setString(8, subject.getClassTime());
            pstmt.setString(9, subject.getClassRoom());
            pstmt.setString(10, subject.getGrade());
            pstmt.setString(11, subject.getProfP());
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }



    public List<SubjectVO> list(String searchTerm, String orderBy) {
        List<SubjectVO> subjectList = new ArrayList<>();
        String sql = "SELECT * FROM subjects";

        if (searchTerm != null && !searchTerm.isEmpty()) {
            sql += " WHERE name LIKE ? OR code LIKE ?";
        }

        // 정렬 추가
        if (orderBy != null && !orderBy.isEmpty()) {
            sql += " ORDER BY " + orderBy; // SQL 인젝션 방지를 위해 사용자가 입력한 값이 아닌, 미리 정의된 정렬 방식만 사용해야 합니다.
        }

        try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
            if (searchTerm != null && !searchTerm.isEmpty()) {
                pstmt.setString(1, "%" + searchTerm + "%");
                pstmt.setString(2, "%" + searchTerm + "%");
            }
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                SubjectVO subject = new SubjectVO();
                subject.setId(rs.getInt("id"));
                subject.setCategory(rs.getString("category"));
                subject.setCode(rs.getString("code"));
                subject.setName(rs.getString("name"));
                subject.setEnglishRatio(rs.getInt("englishRatio"));
                subject.setCredits(rs.getInt("credits"));
                subject.setClassNum(rs.getString("classNum"));
                subject.setProfessor(rs.getString("professor"));
                subject.setClassTime(rs.getString("classTime"));
                subject.setClassRoom(rs.getString("classRoom"));
                subject.setGrade(rs.getString("grade"));
                subject.setProfP(rs.getString("profP"));
                subjectList.add(subject);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return subjectList;
    }

    // 특정 과목 조회
    public SubjectVO get(int id) {
        SubjectVO subject = null;
        String sql = "SELECT * FROM subjects WHERE id = ?";
        try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, id);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    subject = new SubjectVO();
                    subject.setId(rs.getInt("id"));
                    subject.setCategory(rs.getString("category"));
                    subject.setCode(rs.getString("code"));
                    subject.setName(rs.getString("name"));
                    subject.setEnglishRatio(rs.getInt("englishRatio"));
                    subject.setCredits(rs.getInt("credits"));
                    subject.setClassNum(rs.getString("classNum"));
                    subject.setProfessor(rs.getString("professor"));
                    subject.setClassTime(rs.getString("classTime"));
                    subject.setClassRoom(rs.getString("classRoom"));
                    subject.setGrade(rs.getString("grade"));
                    subject.setProfP(rs.getString("profP"));
                    subject.setViewCount(rs.getInt("view_count"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return subject;
    }

    // 과목 수정
// 과목 수정
    public int update(SubjectVO subject) {
        String sql = "UPDATE subjects SET category = ?, code = ?, name = ?, englishRatio = ?, credits = ?, classNum = ?, professor = ?, classTime = ?, classRoom = ?, grade = ?, profP = ? WHERE id = ?";
        try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, subject.getCategory());
            pstmt.setString(2, subject.getCode());
            pstmt.setString(3, subject.getName());
            pstmt.setInt(4, subject.getEnglishRatio());
            pstmt.setInt(5, subject.getCredits());
            pstmt.setString(6, subject.getClassNum());
            pstmt.setString(7, subject.getProfessor());
            pstmt.setString(8, subject.getClassTime());
            pstmt.setString(9, subject.getClassRoom());
            pstmt.setString(10, subject.getGrade());
            pstmt.setString(11, subject.getProfP());
            pstmt.setInt(12, subject.getId());

            return pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            return 0;
        }
    }

    // 과목 삭제
    public void delete(int id) {
        String sql = "DELETE FROM subjects WHERE id = ?";
        try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, id);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void incrementViewCount(int subjectId) {
        String sql = "UPDATE subjects SET view_count = view_count + 1 WHERE id = ?";
        try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, subjectId);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }


    // 데이터베이스 연결 종료
    public void close() {
        if (conn != null) {
            try {
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
