/*
package debug.dao;

import debug.model.Comment;
import jdbc.JdbcUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class CommentDao {
    public ArrayList<Comment> DaoComment(Connection connection) throws SQLException {
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        int nRs = 0;
        ArrayList<Comment> comments = new ArrayList<>();
        try{
            pstmt = connection.prepareStatement("select * from Comments");
            rs = pstmt.executeQuery();
            while(rs.next()) {
                comments.add(new Comment(rs.getInt("User_No"),rs.getInt("Contents_No"),
                        rs.getString("Comments_Comment"),rs.getDate("Comments_Date")));
            }
            return comments;
        } finally {
            JdbcUtil.close(pstmt);
        }
    }
}
*/
