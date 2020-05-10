/*
package debug.service;

import debug.dao.CommentDao;
import debug.model.Comment;
import jdbc.JdbcUtil;
import jdbc.connection.ConnectionProvider;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

public class CommentService {
    public ArrayList<Comment> CommentDB() {
        Connection connection = null;
        try{
            connection = ConnectionProvider.getConnection();
            ArrayList<Comment> comments = new CommentDao().DaoComment(connection);
            return comments;
        } catch (SQLException e){
            throw new RuntimeException(e);
        } finally {
            JdbcUtil.close(connection);
        }
    }
}
*/
