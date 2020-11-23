package Board;

import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

public class BoardDao {
    private static BoardDao instance;

    private static final String dbURL = "jdbc:mysql://localhost/lgnet?autoReconnect=true&useSSL=false";
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

    public int write(BoardContentBean boardContentBean, String nickname) {
        String title = boardContentBean.getTitle();
        String author = nickname;
        String content = boardContentBean.getContent();

        instance.getConnection();
        String write_INSERT_QUERY = "INSERT INTO tb_freeboard SET title = ?, content = ?, author = ?, date = ?";
        try {
            ps = connection.prepareStatement(write_INSERT_QUERY);
            ps.setString(1, title);
            ps.setString(2, content);
            ps.setString(3, author);
            ps.setString(4, getDate());
            return ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            instance.closeConnection();
        }
        return 0;
    }

    /* 글쓴일 GET */
    private String getDate() {
        java.util.Date date = new Date();
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        return simpleDateFormat.format(date);
    }

    public ArrayList<BoardInfoBox> readBoard() {
        ArrayList<BoardInfoBox> returnArray = new ArrayList<>();
        instance.getConnection();
        String SELECT_QUERY = "SELECT * FROM tb_freeboard";
        try {
            ps = connection.prepareStatement(SELECT_QUERY);
            resultSet = ps.executeQuery();
            while (resultSet.next()) {
                BoardInfoBox boardInfoBox = new BoardInfoBox(
                        resultSet.getInt(1),
                        resultSet.getString(2),
                        resultSet.getString(3),
                        resultSet.getString(4),
                        resultSet.getDate(5),
                        resultSet.getInt(6));
                returnArray.add(boardInfoBox);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            instance.closeConnection();
        }
        return returnArray;
    }

    public BoardInfoBox showPost(int post_no) {
        ArrayList<BoardInfoBox> returnArray = new ArrayList<>();
        instance.getConnection();
        String SELECT_QUERY = "SELECT * FROM tb_freeboard WHERE seq = ?";
        BoardInfoBox boardInfoBox = null;
        try {
            ps = connection.prepareStatement(SELECT_QUERY);
            ps.setInt(1, post_no);
            resultSet = ps.executeQuery();
            resultSet.next();
            boardInfoBox = new BoardInfoBox(
                    resultSet.getInt(1),
                    resultSet.getString(2),
                    resultSet.getString(3),
                    resultSet.getString(4),
                    resultSet.getDate(5),
                    resultSet.getInt(6));
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            instance.closeConnection();
        }
        return boardInfoBox;
    }

    public int deletePost(int post_no) {
        instance.getConnection();
        String SELECT_QUERY = "DELETE FROM tb_freeboard WHERE seq = ?";
        try {
            ps = connection.prepareStatement(SELECT_QUERY);
            ps.setInt(1, post_no);
            return ps.executeUpdate(); // 업데이트 (delete)된 개수를 return한다.
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            instance.closeConnection();
        }
        return 0; // 실패
    }

    public int addView(int post_no) {
        instance.getConnection();
        String SELECT_QUERY = "UPDATE tb_freeboard SET VIEWS = VIEWS + 1 WHERE SEQ = " + post_no + ";";
        try {
            ps = connection.prepareStatement(SELECT_QUERY);
            return ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            instance.closeConnection();
        }
        return 0; // 뭔가가 실패
    }
}
