package debug.dao;

import debug.model.CustomCenter;
import jdbc.JdbcUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class CustomCenterDao {
    public ArrayList<CustomCenter> DaoCustomCenter(Connection connection) throws SQLException {
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        int nRs = 0;
        ArrayList<CustomCenter> customCenters = new ArrayList<>();
        try{
            pstmt = connection.prepareStatement("select * from CustomCenter");
            rs = pstmt.executeQuery();
            while(rs.next()) {
                customCenters.add(new CustomCenter(rs.getInt("CustomCenter_No"),rs.getString("CustomCenter_Question"),
                        rs.getString("CustomCenter_Answer"),rs.getTimestamp("CustomCenter_Date")));
            }
            return customCenters;
        } finally {
            JdbcUtil.close(pstmt);
        }
    }
}
