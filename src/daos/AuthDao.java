package daos;

import jdbc.JdbcUtil;
import models.User;

import java.sql.*;
import java.time.LocalDate;

public class AuthDao {

    public boolean deleteToken(Connection connection, String email) throws SQLException {
        PreparedStatement pstmt = null;
        int nRs = -1;
        try {
            pstmt = connection.prepareStatement("delete from token where Token_Email=?");
            pstmt.setString(1, email);
            nRs = pstmt.executeUpdate();
            if (nRs >= 0) {
                return true;
            }
            return false;
        } finally {
            JdbcUtil.close(pstmt);
        }
    }

    public boolean loginDao(Connection connection, String id, String password) throws SQLException {
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        boolean login = false;
        try {
            pstmt = connection.prepareStatement("select * from user where User_ID=?");
            pstmt.setString(1, id);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                if (rs.getString("User_Password").equals(password)) {
                    login = true;
                } else {
                    login = false;
                }
            }
            return login;
        } finally {
            JdbcUtil.close(rs);
            JdbcUtil.close(pstmt);
        }
    }

    public boolean existID(Connection connection, String id) throws SQLException {
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            pstmt = connection.prepareStatement("select * from user where User_ID=?");
            pstmt.setString(1, id);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                System.out.println("1");
                return true;
            } else {
                System.out.println("2");
                return false;
            }
        } finally {
            JdbcUtil.close(rs);
            JdbcUtil.close(pstmt);
        }
    }

    public boolean existMail(Connection connection, String email) throws SQLException {
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            pstmt = connection.prepareStatement("select * from user where User_Email=?");
            pstmt.setString(1, email);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                return true;
            } else {
                return false;
            }
        } finally {
            JdbcUtil.close(rs);
            JdbcUtil.close(pstmt);
        }
    }

    public boolean saveTempToken(Connection connection, String email, String token) throws SQLException {
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        int nRs = 0;
        try {
            pstmt = connection.prepareStatement("insert into token(token_email, token_number) values(?,?);");
            pstmt.setString(1, email);
            pstmt.setString(2, token);
            nRs = pstmt.executeUpdate();
            return true;
        } finally {
            JdbcUtil.close(rs);
            JdbcUtil.close(pstmt);
        }
    }

    public String getToken(Connection connection, String email) throws SQLException {
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        int nRs = 0;
        try {
            pstmt = connection.prepareStatement("select * from token where Token_Email=? order by Token_No desc");
            pstmt.setString(1, email);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                return rs.getString("Token_Number");
            } else {
                return null;
            }
        } finally {
            JdbcUtil.close(rs);
            JdbcUtil.close(pstmt);
        }
    }

    public int register(Connection connection, String id, String password, String nickName, String gender, int year, int month, int day, String email, int phone, boolean allAgree) throws SQLException {
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            pstmt = connection.prepareStatement("insert into user(User_RegDate, User_BirthDate, User_ID, User_Password, User_Email, User_Gender, User_NickName, User_Phone, User_Agree, User_Img) " +
                    "values(?,?,?,?,?,?,?,?,?,?) ", Statement.RETURN_GENERATED_KEYS);
            pstmt.setDate(1, Date.valueOf(LocalDate.now()));
            pstmt.setString(2, year + "-" + month + "-" + day);
            pstmt.setString(3, id);
            pstmt.setString(4, password);
            pstmt.setString(5, email);
            pstmt.setString(6, gender);
            pstmt.setString(7, nickName);
            pstmt.setInt(8, phone);
            pstmt.setBoolean(9, allAgree);
            pstmt.setString(10, null);
            pstmt.executeUpdate();
            rs = pstmt.getGeneratedKeys();
            if (rs.next()) {
                deleteToken(connection, email);
                return rs.getInt(1);
            }
            return 0;
        } finally {
            JdbcUtil.close(rs);
            JdbcUtil.close(pstmt);
        }
    }

    public String findPassword(Connection connection, String id, String email) throws SQLException {
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            pstmt = connection.prepareStatement("select * from user where User_ID=? AND User_Email=?");
            pstmt.setString(1, id);
            pstmt.setString(2, email);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                return rs.getString("User_Password");
            }
            return null;
        } finally {
            JdbcUtil.close(rs);
            JdbcUtil.close(pstmt);
        }
    }

    public String findId(Connection connection, String email) throws SQLException {
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            pstmt = connection.prepareStatement("select * from user where User_Email=?");
            pstmt.setString(1, email);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                return rs.getString("User_ID");
            }
            return null;
        } finally {
            JdbcUtil.close(rs);
            JdbcUtil.close(pstmt);
        }
    }

    public boolean confirmId(Connection connection, String id, String password) throws SQLException {
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            pstmt = connection.prepareStatement("select * from user where User_ID=?");
            pstmt.setString(1, id);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                if (rs.getString("User_Password").equals(password)) {
                    return true;
                } else {
                    return false;
                }
            } else {
                return false;
            }
        } finally {
            JdbcUtil.close(rs);
            JdbcUtil.close(pstmt);
        }
    }

    public User getUser(Connection connection, String id) throws SQLException {
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            pstmt = connection.prepareStatement("select * from user where User_ID=?");
            pstmt.setString(1, id);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                /*int no, Date regDate, Date birthDate, String id, String password, String email, String gender, String nickname, int phone, int agree, String img*/
                return new User(rs.getInt(1),
                        rs.getDate(2),
                        rs.getDate(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getInt(9),
                        rs.getBoolean(10),
                        rs.getString(11));
            }
            return null;
        } finally {
            JdbcUtil.close(rs);
            JdbcUtil.close(pstmt);
        }
    }

    public User getUser(Connection connection, int no) throws SQLException {
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            pstmt = connection.prepareStatement("select * from user where User_No=?");
            pstmt.setInt(1, no);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                /*int no, Date regDate, Date birthDate, String id, String password, String email, String gender, String nickname, int phone, int agree, String img*/
                return new User(rs.getInt(1),
                        rs.getDate(2),
                        rs.getDate(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getInt(9),
                        rs.getBoolean(10),
                        rs.getString(11));
            }
            return null;
        } finally {
            JdbcUtil.close(rs);
            JdbcUtil.close(pstmt);
        }
    }

    public boolean setProfile(Connection connection, int user_no, String path) throws SQLException {
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        int nRs = -1;
        try {
            pstmt = connection.prepareStatement("update user set User_Img=? where User_No=?");
            pstmt.setString(1, path);
            pstmt.setInt(2, user_no);
            nRs = pstmt.executeUpdate();
            if (nRs >= -1) {
                return true;
            } else {
                return false;
            }
        } finally {
            JdbcUtil.close(rs);
            JdbcUtil.close(pstmt);
        }
    }

    public int updateUser(Connection connection, String id, String password, String nickName, int year, int month, int day, String email, int phone) throws SQLException {
        PreparedStatement pstmt = null;
        int nRs = -1;
        try {
            pstmt = connection.prepareStatement("update user set User_Password=?,User_NickName=?,User_BirthDate=?,User_Email=?,User_Phone=? where User_ID=?");
            pstmt.setString(1, password);
            pstmt.setString(2, nickName);
            pstmt.setString(3, year + "-" + month + "-" + day);
            pstmt.setString(4, email);
            pstmt.setInt(5, phone);
            pstmt.setString(6, id);
            nRs = pstmt.executeUpdate();
            if (nRs >= 0) {
                return 1;
            } else {
                return -1;
            }
        } finally {
            JdbcUtil.close(pstmt);
        }
    }

    public boolean contentAuth(Connection connection, int no, int content_no) throws SQLException {
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        boolean check = false;
        try {
            pstmt = connection.prepareStatement("select * from contents where User_No=?");
            pstmt.setInt(1, no);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                if (rs.getInt("Contents_No") == content_no) {
                    check = true;
                    break;
                }
                check = false;
            }
            return check;
        } finally {
            JdbcUtil.close(pstmt);
        }
    }

    public boolean integrity(Connection connection, String id, String email) throws SQLException {
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            pstmt = connection.prepareStatement("select * from user where User_ID=? AND User_Email=?");
            pstmt.setString(1, id);
            pstmt.setString(2, email);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                return true;
            }
            return false;
        } finally {
            JdbcUtil.close(pstmt);
        }
    }
}
