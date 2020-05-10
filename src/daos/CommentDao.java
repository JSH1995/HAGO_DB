package daos;

import jdbc.JdbcUtil;
import models.Comment;
import util.Time;

import java.sql.*;
import java.time.LocalDate;
import java.util.ArrayList;

public class CommentDao {

    private AuthDao authDao = new AuthDao();
    private ContentDao contentDao = new ContentDao();

    public ArrayList<Comment> getComments(Connection connection, int content_no) throws SQLException {
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            ArrayList<Comment> comments = new ArrayList<>();
            pstmt = connection.prepareStatement("select * from comments where Contents_No=? order by Comments_Date desc");
            pstmt.setInt(1, content_no);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                comments.add(new Comment(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getDate(4)));
            }
            for (int i = 0; i < comments.size(); i++) {
                comments.get(i).setUser(authDao.getUser(connection, comments.get(i).getUser_no()));
                comments.get(i).setContent(contentDao.getContent(connection, comments.get(i).getContent_no()));
            }
            return comments;
        } finally {
            JdbcUtil.close(pstmt);
            JdbcUtil.close(rs);
        }
    }

    public int addComment(Connection connection, int user_no, int contents_no, String comment) throws SQLException {
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        int nRs = -1;
        try {
            pstmt = connection.prepareStatement("insert into comments values (?,?,?,?)");
            pstmt.setInt(1, user_no);
            pstmt.setInt(2, contents_no);
            pstmt.setString(3, comment);
            pstmt.setString(4, Time.getTimeBySecond());
            nRs = pstmt.executeUpdate();
            return 1;
        } finally {
            JdbcUtil.close(pstmt);
        }
    }

    public Comment getComment(Connection connection, int comment_no) throws SQLException {
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            pstmt = connection.prepareStatement("select * from comments where Contents_No=?");
            pstmt.setInt(1, comment_no);
            rs = pstmt.executeQuery();
            Comment comment = null;
            if (rs.next()) {
                comment = new Comment(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getDate(4));
                comment.setUser(authDao.getUser(connection, comment.getUser_no()));
                comment.setContent(contentDao.getContent(connection, comment.getContent_no()));
            }
            return comment;
        } finally {
            JdbcUtil.close(rs);
            JdbcUtil.close(pstmt);
        }
    }
}
