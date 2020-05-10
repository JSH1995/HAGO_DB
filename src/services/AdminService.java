package services;

import daos.AdminDao;
import jdbc.JdbcUtil;
import jdbc.connection.ConnectionProvider;
import models.AdminManage;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

public class AdminService {
    private AdminDao adminDao = new AdminDao();

    public AdminManage adminDB() {
        Connection connection = null;
        try{
            connection = ConnectionProvider.getConnection();
            AdminManage admin = new AdminDao().DaoAdmin(connection);
            return admin;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            JdbcUtil.close(connection);
        }
    }
}
