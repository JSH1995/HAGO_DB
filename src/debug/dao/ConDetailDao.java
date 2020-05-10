package debug.dao;

import debug.model.ConDetail;
import jdbc.JdbcUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class ConDetailDao {
    public ArrayList<ConDetail> DaoConDetail(Connection connection) throws SQLException {
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        int nRs = 0;
        ArrayList<ConDetail> conDetails = new ArrayList<>();
        try{
            pstmt = connection.prepareStatement("select * from ConDetails");
            rs = pstmt.executeQuery();
            while(rs.next()) {
                conDetails.add(new ConDetail(rs.getInt("ConDetails_No"),rs.getString("Contents_Json")));
            }
            return conDetails;
        } finally {
            JdbcUtil.close(pstmt);
        }
    }
}
