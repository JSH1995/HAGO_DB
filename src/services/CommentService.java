package services;

import daos.CommentDao;
import jdbc.JdbcUtil;
import jdbc.connection.ConnectionProvider;
import models.Comment;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

public class CommentService {
    private CommentDao commentDao = new CommentDao();

    public ArrayList<Comment> getComments(int content_no) {
        Connection connection = null;
        try {
            connection = ConnectionProvider.getConnection();
            return commentDao.getComments(connection, content_no);
        } catch (SQLException e) {
            e.printStackTrace();
            return new ArrayList<Comment>();
        } finally {
            JdbcUtil.close(connection);
        }
    }

    public int addComment(int user_no, int contents_no, String comment) throws SQLException {
        Connection connection = null;
        try{
            connection = ConnectionProvider.getConnection();
            return commentDao.addComment(connection,user_no,contents_no,comment);
        }finally {
            JdbcUtil.close(connection);
        }
    }

    public Comment getComment(int comment_no) throws SQLException {
        Connection connection = null;
        try{
            connection = ConnectionProvider.getConnection();
            return commentDao.getComment(connection,comment_no);
        }finally {
            JdbcUtil.close(connection);
        }
    }
}
