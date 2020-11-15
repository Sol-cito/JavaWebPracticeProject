package Board;

import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.Date;

public class BoardDao {
    private static BoardDao instance;

    private static final String dbURL = "jdbc:mysql://localhost/lgnet";
    private static final String dbID = "dataenggu";
    private static final String dbPassword = "Solda9010!";

    private Connection connection;
    private ResultSet resultSet; // sql 질의 결과 저장 객체
    private PreparedStatement ps;

    private BoardDao() {
    }

    public static BoardDao getInstance() {
        if (instance == null) {
            instance = new BoardDao();
        }
        return instance;
    }

    private void getConnection() {
        try {
            Class.forName("com.mysql.jdbc.Driver"); // mysql 드라이버 로딩
            connection = DriverManager.getConnection(dbURL, dbID, dbPassword);
            System.out.println("연결 성공!!!");
        } catch (ClassNotFoundException e) {
            System.out.println("[ERROR] driver 로딩 실패 ");
            e.printStackTrace();
        } catch (SQLException e) {
            System.out.println("[ERROR] Connection 실패 ");
            e.printStackTrace();
        }
    }

    private void closeConnection() {
        try {
            if (connection != null) {
                connection.close();
            }
        } catch (SQLException e) {
            System.out.println("[ERROR] Connection close 실패 ");
            e.printStackTrace();
        }
    }

    public int write(BoardContentBean boardContentBean) {
        String title = boardContentBean.getTitle();
        String author = boardContentBean.getAuthor();
        String content = boardContentBean.getContent();

        instance.getConnection();
        String write_INSERT_QUERY = "INSERT INTO tb_freeboard SET title = ?, content = ?, author = ?, date = ?";
        try {
            ps = connection.prepareStatement(write_INSERT_QUERY);
            ps.setString(1, title);
            ps.setString(2, content);
            ps.setString(3, author);
            ps.setString(4, getDate());
            int insert_result = ps.executeUpdate();
            if (insert_result == 1) {
                System.out.println("Registration Success");
                System.out.println("Update 건수 : " + insert_result + "건");
                // PreparedStatement - autocommit임
                return 0; // 성공
            }
            System.out.println("[ERROR] insert Error (update건수 0건)");
            return -1; // INSERT 에러
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            instance.closeConnection();
        }
        return -2;
    }

    /* 글쓴일 GET */
    private String getDate() {
        java.util.Date date = new Date();
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        return simpleDateFormat.format(date);
    }
}
