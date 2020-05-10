package debug.service;


import debug.dao.LikeDao;
import debug.model.Like;
import jdbc.JdbcUtil;
import jdbc.connection.ConnectionProvider;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

public class LikeService {
    public ArrayList<Like> LikeDB() {
        Connection connection = null;
        try{
            connection = ConnectionProvider.getConnection();
            ArrayList<Like> likes = new LikeDao().DaoLike(connection);
            return likes;
        } catch (SQLException e){
            throw new RuntimeException(e);
        } finally {
            JdbcUtil.close(connection);
        }
    }
}
