package debug.service;

import debug.dao.CustomCenterDao;
import debug.model.CustomCenter;
import jdbc.JdbcUtil;
import jdbc.connection.ConnectionProvider;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

public class CustomCenterService {
    public ArrayList<CustomCenter> CustomCenterDB() {
        Connection connection = null;
        try{
            connection = ConnectionProvider.getConnection();
            ArrayList<CustomCenter> customCenters = new CustomCenterDao().DaoCustomCenter(connection);
            return customCenters;
        } catch (SQLException e){
            throw new RuntimeException(e);
        } finally {
            JdbcUtil.close(connection);
        }
    }
}
