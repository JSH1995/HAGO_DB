package daos;

import jdbc.JdbcUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class LikeDao {

    public int getLikeCount(Connection connection, int content_no) throws SQLException {
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            int like = -1;
            pstmt = connection.prepareStatement("select count(*) from likes where Contents_No=?");
            pstmt.setInt(1,content_no);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                like = rs.getInt(1);
            } else {
                like = 0;
            }
            return like;
        } finally {
            JdbcUtil.close(rs);
            JdbcUtil.close(pstmt);
        }
    }

    public int getLikeState(Connection connection, int user_no, int content_no) throws SQLException {
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            int like = -1;
            pstmt = connection.prepareStatement("select EXISTS(select * from Likes where User_No=? and Contents_No=?)");
            pstmt.setInt(1, user_no);
            pstmt.setInt(2, content_no);
            rs = pstmt.executeQuery();
            //System.out.println("rs"+rs.next());
            if (rs.next()) {
                like = rs.getInt(1);
            } else {
                like = rs.getInt(1);
            }
            System.out.println("like" + like);
            return like;
        } finally {
            JdbcUtil.close(rs);
            JdbcUtil.close(pstmt);
        }
    }

    public int addLike(Connection connection, int user_no, int content_no) throws SQLException {
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        int nRs = -1;
        try {
            pstmt = connection.prepareStatement("insert into Likes values (?,?)");
            pstmt.setInt(1, user_no);
            pstmt.setInt(2, content_no);
            nRs = pstmt.executeUpdate();
            return 1;
        } finally {
            JdbcUtil.close(pstmt);
        }
    }

    public int delLike(Connection connection, int user_no, int content_no) throws SQLException {
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        int nRs = -1;
        try {
            pstmt = connection.prepareStatement("DELETE from Likes where User_No=? and Contents_No=?");
            pstmt.setInt(1, user_no);
            pstmt.setInt(2, content_no);
            nRs = pstmt.executeUpdate();
            return 1;
        } finally {
            JdbcUtil.close(pstmt);
        }
    }
}
