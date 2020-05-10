package daos;

import jdbc.JdbcUtil;
import models.CustomCenter;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class QnaDao {
    public ArrayList<CustomCenter> DaoQna(Connection connection, int sNum) throws SQLException {
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        int nRs = 0;
        sNum = sNum*5;
        ArrayList<CustomCenter> customCenters = new ArrayList<CustomCenter>();
        try{
            //pstmt = connection.prepareStatement("select * from CustomCenter");
            pstmt = connection.prepareStatement("select * from CustomCenter limit 5 offset ?");
            pstmt.setInt(1,sNum);
            rs = pstmt.executeQuery();
            while(rs.next()){
                customCenters.add(new CustomCenter(rs.getInt(1),rs.getString(2),
                        rs.getString(3),rs.getDate(4)));
            }
            return customCenters;
        } finally {
            JdbcUtil.close(rs);
            JdbcUtil.close(pstmt);
        }
    }
    public int TotalCnt(Connection connection) throws SQLException{
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        int nRs = 0;
        try{
            pstmt = connection.prepareStatement("select count(*) from CustomCenter");
            rs = pstmt.executeQuery();
            if(rs.next()) nRs = rs.getInt(1);
            return nRs;
        } finally {
            JdbcUtil.close(pstmt);
            JdbcUtil.close(rs);
        }
    }
}
