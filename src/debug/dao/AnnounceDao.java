package debug.dao;

import debug.model.Announce;
import jdbc.JdbcUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class AnnounceDao {
    public ArrayList<Announce> DaoAnnounce(Connection connection) throws SQLException {
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        int nRs = 0;
        ArrayList<Announce> announces = new ArrayList<>();
        try{
            pstmt = connection.prepareStatement("select * from Announce");
            rs = pstmt.executeQuery();
            while(rs.next()) {
                announces.add(new Announce(rs.getInt("Announce_No"),rs.getString("Announce_Title"),
                        rs.getString("Announce_Details"),rs.getTimestamp("Announce_Date")));
            }
            return announces;
        } finally {
            JdbcUtil.close(pstmt);
        }
    }
}
