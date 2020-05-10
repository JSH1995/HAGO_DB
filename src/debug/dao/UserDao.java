package debug.dao;

import debug.model.User;
import jdbc.JdbcUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class UserDao {

    public ArrayList<User> DaoUser(Connection connection) throws SQLException {
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        int nRs = 0;
        ArrayList<User> users = new ArrayList<>();
        try{
            pstmt = connection.prepareStatement("select * from User");
            rs = pstmt.executeQuery();
            while(rs.next()) {
                users.add(new User(rs.getInt("User_No"),rs.getDate("User_RegDate"),
                        rs.getDate("User_BirthDate"),rs.getString("User_ID"),
                        rs.getString("User_Password"),rs.getString("User_Email"),
                        rs.getString("User_Gender"),
                        rs.getString("User_NickName"),rs.getInt("User_Phone"),rs.getInt("User_Agree"),
                        rs.getString("User_img")));
            }
            return users;
        } finally {
            JdbcUtil.close(pstmt);
        }
    }
}
