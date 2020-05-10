package debug.service;

import debug.dao.AdminManageDao;
import debug.model.AdminManage;
import jdbc.JdbcUtil;
import jdbc.connection.ConnectionProvider;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

public class AdminManageService {
    public ArrayList<AdminManage> AdminDB() {
        Connection connection = null;
        try{
            connection = ConnectionProvider.getConnection();
            ArrayList<AdminManage> adminManages = new AdminManageDao().DaoAdminManage(connection);
            return adminManages;
        } catch (SQLException e){
            throw new RuntimeException(e);
        } finally {
            JdbcUtil.close(connection);
        }
    }
}
