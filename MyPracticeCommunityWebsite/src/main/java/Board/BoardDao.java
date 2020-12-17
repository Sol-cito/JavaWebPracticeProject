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
            return ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            instance.closeConnection();
        }
        return 0;
    }

    public int modify(BoardContentBean boardContentBean, int page_no) {
        String title = boardContentBean.getTitle();
        String content = boardContentBean.getContent();
        instance.getConnection();
        String modify_Update_QUERY = "UPDATE tb_freeboard SET title = ? , content = ? WHERE seq = ?";
        try {
            ps = connection.prepareStatement(modify_Update_QUERY);
            ps.setString(1, title);
            ps.setString(2, content);
            ps.setInt(3, page_no);
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

    public int getCommentNumOfPost(int post_no) {
        int result = 0;
        instance.getConnection();
        String SELECT_JOIN_QUERY =
                "SELECT count(b.rel_seq) "
                        + "FROM tb_freeboard a, tb_comment b "
                        + "WHERE a.seq = b.rel_seq "
                        + "AND a.seq = " + post_no + " "
                        + "GROUP BY b.rel_seq";
        try {
            ps = connection.prepareStatement(SELECT_JOIN_QUERY);
            resultSet = ps.executeQuery();
            resultSet.next();
            result = resultSet.getInt(1);
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            instance.closeConnection();
        }
        return result;
    }

    public BoardInfoBox showPost(int post_no, int flag) {
        /*
        flag --- 1 : 게시글 조회 / 2 : 게시글 수정
        */
        instance.getConnection();
        String SELECT_QUERY = "SELECT * FROM tb_freeboard WHERE seq = ?";
        BoardInfoBox boardInfoBox = null;
        try {
            ps = connection.prepareStatement(SELECT_QUERY);
            ps.setInt(1, post_no);
            resultSet = ps.executeQuery();
            resultSet.next();
            String postContent = "";
            if (flag == 1) {
                postContent = switchSpecialCharsAndTags(resultSet.getString(3), 1);
            } else if (flag == 2) {
                postContent = switchSpecialCharsAndTags(resultSet.getString(3), 2);
            }
            boardInfoBox = new BoardInfoBox(
                    resultSet.getInt(1),
                    resultSet.getString(2),
                    postContent,
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

    public int makeComment(CommentContentBean commentContentBean) {
        int rel_Seq = commentContentBean.getRel_Seq();
        String commentContent = commentContentBean.getCommentContent();
        String author = commentContentBean.getAuthor();
        instance.getConnection();
        String write_INSERT_QUERY = "INSERT INTO tb_comment SET rel_seq = ?, content = ?, author = ?, date = ?";
        try {
            ps = connection.prepareStatement(write_INSERT_QUERY);
            ps.setInt(1, rel_Seq);
            ps.setString(2, commentContent);
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

    public ArrayList<CommentInfoBox> getComments(int post_no) {
        ArrayList<CommentInfoBox> commentBoxList = new ArrayList<>();
        instance.getConnection();
        String SELECT_QUERY =
                "SELECT AUTHOR, CONTENT, DATE, num_like, num_dislike " +
                        "FROM tb_comment " +
                        "WHERE rel_seq = " + post_no;
        try {
            ps = connection.prepareStatement(SELECT_QUERY);
            resultSet = ps.executeQuery();
            while (resultSet.next()) {
                CommentInfoBox commentInfoBox = new CommentInfoBox(
                        resultSet.getString(1),
                        resultSet.getString(2),
                        resultSet.getDate(3),
                        resultSet.getInt(4),
                        resultSet.getInt(5));
                commentBoxList.add(commentInfoBox);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            instance.closeConnection();
        }
        return commentBoxList;
    }


    public String switchSpecialCharsAndTags(String target, int flag) {
        System.out.println("============처음에 들어온 : ");
        System.out.println(target);

        /*
        flag --- 1 : 게시글 조회 / 2 : 게시글 수정
        */
        String[] specialChars = {
                "\r\n",
        };
        for (int i = 0; i < specialChars.length; i++) {
            if (flag == 1) {
                target = target.replaceAll(specialChars[i], "<br>");
            } else if (flag == 2) {
                target = target.replaceAll("<br>", specialChars[i]);
            }
        }
        System.out.println("================나가는 : ");
        System.out.println(target);
        return target;
    }
}
