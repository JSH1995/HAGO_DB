package daos;

import jdbc.JdbcUtil;
import models.ConDetail;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ContentDetailDao {

    public ConDetail getConDetail(Connection connection, int no) throws SQLException {
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            pstmt = connection.prepareStatement("select * from condetails where ConDetails_No=?");
            pstmt.setInt(1, no);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                return new ConDetail(rs.getInt(1), rs.getString(2));
            }
            return null;
        } finally {
            JdbcUtil.close(rs);
            JdbcUtil.close(pstmt);
        }
    }
}
