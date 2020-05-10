/*
package debug.dao;

import debug.model.Content;
import jdbc.JdbcUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class ContentDao {
    public ArrayList<Content> DaoContent(Connection connection) throws SQLException {
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        int nRs = 0;
        ArrayList<Content> contents = new ArrayList<>();
        try{
            pstmt = connection.prepareStatement("select * from Contents");
            rs = pstmt.executeQuery();
            while(rs.next()) {
                contents.add(new Content(rs.getInt("Contents_No"),rs.getString("Contents_Category"),rs.getString("Contents_State"),rs.getString("Contents_Name")
                ,rs.getString("Contents_Title"),rs.getString("Contents_Detail"),rs.getDate("Contents_Date"),
                        rs.getString("Contents_Contents"),rs.getInt("User_No"),rs.getInt("ConDetails_No")));
            }*/
/**//*

            return contents;
        } finally {
            JdbcUtil.close(pstmt);
        }
    }
}
*/
