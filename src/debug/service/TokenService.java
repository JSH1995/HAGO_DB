package debug.service;


import debug.dao.TokenDao;
import debug.model.Token;
import jdbc.JdbcUtil;
import jdbc.connection.ConnectionProvider;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

public class TokenService {
    public ArrayList<Token> TokenDB() {
        Connection connection = null;
        try{
            connection = ConnectionProvider.getConnection();
            ArrayList<Token> tokens = new TokenDao().DaoToken(connection);
            return tokens;
        } catch (SQLException e){
            throw new RuntimeException(e);
        } finally {
            JdbcUtil.close(connection);
        }
    }
}
