package debug.service;

import debug.dao.ConDetailDao;
import debug.model.ConDetail;
import jdbc.JdbcUtil;
import jdbc.connection.ConnectionProvider;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

public class ConDetailService {
    public ArrayList<ConDetail> ConDetailDB() {
        Connection connection = null;
        try{
            connection = ConnectionProvider.getConnection();
            ArrayList<ConDetail> conDetails = new ConDetailDao().DaoConDetail(connection);
            return conDetails;
        } catch (SQLException e){
            throw new RuntimeException(e);
        } finally {
            JdbcUtil.close(connection);
        }
    }
}
