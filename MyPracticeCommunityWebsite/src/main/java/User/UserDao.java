package User;

/* DB 연동 클래스 */

// Connection 객체를 자동완성으로 import할 때는 com.mysql.connection이 아닌
// java 표준인 java.sql.Connection 클래스를 import해야 한다.

import jdk.internal.org.jline.utils.Log;

import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.Date;

public class UserDao {
    private String id;
    private String password;
    private String email;
    private String nickName;
    private static final String dbURL = "jdbc:mysql://localhost/사용할db이름";
    private static final String dbID = "";
    private static final String dbPassword = "";

    private Connection connection; // 커넥션 객체
    private ResultSet resultSet; // sql 질의 결과 저장 객체
    private PreparedStatement ps;

    public UserDao() {
        /* DB connection */
        try {
            Class.forName("com.mysql.jdbc.Driver"); // mysql 드라이버 로딩
            connection = DriverManager.getConnection(dbURL, dbID, dbPassword);
            Log.debug("연결 성공");
        } catch (ClassNotFoundException e) {
            Log.debug("[ERROR] Driver 로딩 실패");
            e.printStackTrace();
        } catch (SQLException e) {
            Log.debug("[ERROR] connection 실패");
            e.printStackTrace();
        } finally {
            try {
                if (connection != null) {
                    connection.close();
                }
            } catch (SQLException e) {
                Log.debug("[ERROR] 커넥션 close 실패");
                e.printStackTrace();
            }
        }
    }

    /* int ->  -2 : 서버접속 오류 / -1 : 아이디 없음 / 0 : 비밀번호 불일치 / 1 : 로그인 성공 */
    public int login(String id, String password) {
        String loginSQL = "SELECT password FROM USER WHERE id = ?";
        try {
            ps = connection.prepareStatement(loginSQL);
            ps.setString(1, id);
            resultSet = ps.executeQuery();
            if (resultSet.next()) { // 결과가 true면
                return resultSet.getString(1).equals(password) ? 1 : 0;
            } else { // 결과가 없으면
                return -1;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return -2;
    }

    /* 중복 아이디 체크 */
    public boolean isDuplicateId(String id) {
        try {
            String sql = "SELECT id FROM USER WHERE id = ?";
            ps = connection.prepareStatement(sql);
            ps.setString(1, id);
            resultSet = ps.executeQuery();
            if (resultSet.next()) {
                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    /* 중복 닉네임 체크 */
    public boolean isDuplicateNickname(String nickName) {
        try {
            String sql = "SELECT nickname FROM USER WHERE nickname = ?";
            ps = connection.prepareStatement(sql);
            ps.setString(1, nickName);
            resultSet = ps.executeQuery();
            if (resultSet.next()) {
                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }


    /* 중복 닉네임 체크 */
    public boolean isDuplicateEmail(String email) {
        try {
            String sql = "SELECT email FROM USER WHERE email = ?";
            ps = connection.prepareStatement(sql);
            ps.setString(1, email);
            resultSet = ps.executeQuery();
            if (resultSet.next()) {
                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }


    /*
     * 회원가입
     * -2 : 접속 에러 / -1 : sql insert 실패 / 0 : 성공 */
    public int register(String id, String password, String email, String nickname) {
        /* 작성중 */
        if (!isDuplicateId(id) && !isDuplicateNickname(nickName) && !isDuplicateEmail(email)) {
            try {
                String SQL = "INSERT INTO USER VALUE (?, ?, ?, ?, ?)";
                ps = connection.prepareStatement(SQL);
                resultSet = ps.executeQuery();
                if (resultSet.next()) {
                    return 0;
                }
                return -1;
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return -2;
    }

    /* 가입일 GET */
    private String getDate() {
        Date date = new Date();
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        return simpleDateFormat.format(date);
    }
}
