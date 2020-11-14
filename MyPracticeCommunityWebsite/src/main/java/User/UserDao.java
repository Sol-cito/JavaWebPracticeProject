package User;

/* DB 연동 클래스 */

// Connection 객체를 자동완성으로 import할 때는 com.mysql.connection이 아닌
// java 표준인 java.sql.Connection 클래스를 import해야 한다.

//import jdk.internal.org.jline.utils.Log;

import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.Date;

public class UserDao {

    private static UserDao instance;

    private String id;
    private String password;
    private String email;
    private String nickName;
    private static final String dbURL = "jdbc:mysql://localhost/lgnet";
    private static final String dbID = "dataenggu";
    private static final String dbPassword = "Solda9010!";

    private Connection connection; // 커넥션 객체
    private ResultSet resultSet; // sql 질의 결과 저장 객체
    private PreparedStatement ps;

    /* DB unit test */
//    public static void main(String[] args) {
//        UserDao userDao = new UserDao();
//    }

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

    /* 비동기화 Singleton Pattern 적용  */
    public static UserDao getInstance() {
        if (instance == null) {
            instance = new UserDao();
        }
        return instance;
    }

    private UserDao() {
    }


    /* javabean 을 이용한 가입 로직 */
    public int register(MemberBean memberBean) {
        id = memberBean.getId();
        password = memberBean.getPassword();
        email = memberBean.getEmail();
        nickName = memberBean.getNickname();
        instance.getConnection();

        if (isDuplicateId(id) || isDuplicateEmail(email) || isDuplicateNickname(nickName)) {
            System.out.println("중복 아이디/이메일/닉네임임");
            return -3;
        }
        String INSERT_SQL = "INSERT INTO tb_user VALUE (?, PASSWORD(?), ?, ?, ?)";
        try {
            ps = connection.prepareStatement(INSERT_SQL);
            ps.setString(1, id);
            ps.setString(2, password);
            ps.setString(3, email);
            ps.setString(4, nickName);
            ps.setString(5, getDate());
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
        return -2; // DB접속 에러
    }


    /* int ->  -2 : 서버접속 오류 / -1 : 아이디 없음 / 0 : 비밀번호 불일치 / 1 : 로그인 성공 */
    public int login(MemberBean memberBean) {
        id = memberBean.getId();
        password = memberBean.getPassword();
        instance.getConnection();
        String loginSQL = "SELECT id, nickname FROM tb_user WHERE id = ? and password = PASSWORD('" + password + "')";
        try {
            ps = connection.prepareStatement(loginSQL);
            ps.setString(1, id);
            resultSet = ps.executeQuery();
            if (resultSet.next()) { // 결과가 true면
                memberBean.setNickname(resultSet.getString(2)); // 닉네임을 set한다 -> 세션을 위해서
                return 1;
            } else { // 결과가 없으면
                return -1;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            instance.closeConnection();
        }
        return -2;
    }

    /* 중복 아이디 체크 */
    public boolean isDuplicateId(String id) {
        try {
            String sql = "SELECT id FROM tb_user WHERE id = ?";
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
            String sql = "SELECT nickname FROM tb_user WHERE nickname = ?";
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
            String sql = "SELECT email FROM tb_user WHERE email = ?";
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

    /* 가입일 GET */
    private String getDate() {
        Date date = new Date();
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        return simpleDateFormat.format(date);
    }
}
