package services;

import daos.NoticeDao;
import jdbc.JdbcUtil;
import jdbc.connection.ConnectionProvider;
import models.Announce;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

public class NoticeService {
    public ArrayList<Announce> NoticeDB() {
        Connection connection = null;
        try {
            connection = ConnectionProvider.getConnection();
            ArrayList<Announce> announces = new NoticeDao().DaoNotice(connection);
            return announces;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            JdbcUtil.close(connection);
        }
    }
    public ArrayList<Announce> NoticeDB(int sNum, int v) {
        Connection connection = null;
        try {
            connection = ConnectionProvider.getConnection();
            ArrayList<Announce> announces = new NoticeDao().DaoNotice(connection, sNum, v);
            return announces;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            JdbcUtil.close(connection);
        }
    }
    public int NoticeTotalCnt() {
        Connection connection = null;
        try{
            connection = ConnectionProvider.getConnection();
            int nRs = new NoticeDao().TotalCnt(connection);
            return nRs;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            JdbcUtil.close(connection);
        }
    }
}
