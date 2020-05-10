package daos;

import jdbc.JdbcUtil;
import models.AdminManage;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class AdminDao {
    public AdminManage DaoAdmin(Connection connection) throws SQLException {
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        int nRs = 0;
        try {
            pstmt = connection.prepareStatement("select * from Admin_Manage where Admin_No=?");
            pstmt.setInt(1, 1);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                return new AdminManage(rs.getInt(1), rs.getString(2)
                        , rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6),
                        rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10));
            }
            return null;
        } finally {
            JdbcUtil.close(rs);
            JdbcUtil.close(pstmt);
        }
    }
}
