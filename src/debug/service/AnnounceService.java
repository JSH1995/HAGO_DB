package debug.service;

import debug.dao.AnnounceDao;
import debug.model.Announce;
import jdbc.JdbcUtil;
import jdbc.connection.ConnectionProvider;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

public class AnnounceService {
    public ArrayList<Announce> AnnounceDB() {
        Connection connection = null;
        try{
            connection = ConnectionProvider.getConnection();
            ArrayList<Announce> announces = new AnnounceDao().DaoAnnounce(connection);
            return announces;
        } catch (SQLException e){
            throw new RuntimeException(e);
        } finally {
            JdbcUtil.close(connection);
        }
    }
}
