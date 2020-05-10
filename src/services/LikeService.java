package services;

import daos.LikeDao;
import jdbc.JdbcUtil;
import jdbc.connection.ConnectionProvider;

import java.sql.Connection;
import java.sql.SQLException;

public class LikeService {
    private LikeDao likeDao = new LikeDao();

    public int getLikeCount(int contents_no) throws SQLException {
        Connection connection = null;
        try{
            connection = ConnectionProvider.getConnection();
            return likeDao.getLikeCount(connection,contents_no);
        }finally {
            JdbcUtil.close(connection);
        }
    }

    public int getLikeState(int user_no, int contents_no) throws SQLException {
        Connection connection = null;
        try{
            connection = ConnectionProvider.getConnection();
            return likeDao.getLikeState(connection, user_no, contents_no);
        } finally {
            JdbcUtil.close(connection);
        }
    }

    public int addLike(int user_no, int contents_no) throws SQLException {
        Connection connection = null;
        try {
            connection = ConnectionProvider.getConnection();
            return likeDao.addLike(connection, user_no, contents_no);
        } finally {
            JdbcUtil.close(connection);
        }
    }

    public int delLike(int user_no, int contents_no) throws SQLException {
        Connection connection = null;
        try {
            connection = ConnectionProvider.getConnection();
            return likeDao.delLike(connection, user_no, contents_no);
        } finally {
            JdbcUtil.close(connection);
        }
    }
}
