package debug.service;

import debug.dao.UserDao;
import debug.model.User;
import jdbc.JdbcUtil;
import jdbc.connection.ConnectionProvider;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

public class UserService {
    public ArrayList<User> UserDB() {
        Connection connection = null;
        try{
            connection = ConnectionProvider.getConnection();
            ArrayList<User> users = new UserDao().DaoUser(connection);
            return users;
        } catch (SQLException e){
            throw new RuntimeException(e);
        } finally {
            JdbcUtil.close(connection);
        }
    }
}
