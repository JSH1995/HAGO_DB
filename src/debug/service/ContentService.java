/*
package debug.service;

import debug.dao.ContentDao;
import debug.model.Content;
import jdbc.JdbcUtil;
import jdbc.connection.ConnectionProvider;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

public class ContentService {
    public ArrayList<Content> ContentDB() {
        Connection connection = null;
        try{
            connection = ConnectionProvider.getConnection();
            ArrayList<Content> contents = new ContentDao().DaoContent(connection);
            return contents;
        } catch (SQLException e){
            throw new RuntimeException(e);
        } finally {
            JdbcUtil.close(connection);
        }
    }
}
*/
