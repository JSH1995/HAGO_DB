package daos;

import jdbc.JdbcUtil;
import models.Announce;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class NoticeDao {

    public ArrayList<Announce> DaoNotice(Connection connection) throws SQLException {
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        int nRs = 0;
        ArrayList<Announce> announces = new ArrayList<Announce>();
        try{
            pstmt = connection.prepareStatement("select * from Announce");
            rs = pstmt.executeQuery();
            while(rs.next()){
                announces.add(new Announce(rs.getInt("Announce_No"),rs.getString("Announce_Title"),
                        rs.getString("Announce_Details"),rs.getDate("Announce_Date")));

            }
            return announces;
        } finally {
            JdbcUtil.close(rs);
            JdbcUtil.close(pstmt);
        }
    }
    public ArrayList<Announce> DaoNotice(Connection connection, int sNum, int v) throws SQLException {
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        int nRs = 0;
        ArrayList<Announce> announces = new ArrayList<Announce>();
        try{
            pstmt = connection.prepareStatement("select * from Announce limit ? offset ?");
            pstmt.setInt(1,v);
            pstmt.setInt(2,sNum*5);

            rs = pstmt.executeQuery();
            while(rs.next()){
                announces.add(new Announce(rs.getInt(1),rs.getString(2),
                        rs.getString(3),rs.getDate(4)));

            }
            return announces;
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
            pstmt = connection.prepareStatement("select count(*) from Announce");
            rs = pstmt.executeQuery();
            if(rs.next()) nRs = rs.getInt(1);
            return nRs;
        } finally {
            JdbcUtil.close(pstmt);
            JdbcUtil.close(rs);
        }
    }
}
