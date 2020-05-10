package debug.service;

import debug.dao.DebugDao;
import debug.model.Test;
import jdbc.JdbcUtil;
import jdbc.connection.ConnectionProvider;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

public class DebugService {

    /*        SemiproDao semiproDao = new SemiproDao();
        Semi semi = null;
        Connection conn = null;
        try{
            conn = ConnectionProvider.getConnection();
            semi = semiproDao.selectByNo(conn, userSession.getNo());
            return semi;

        }catch (SQLException e){
            throw new RuntimeException(e);
        }finally {
            JdbcUtil.close(conn);
        }*/
    public ArrayList<Test> DBTest() {
        Connection connection = null;
        try {
            connection = ConnectionProvider.getConnection();
            ArrayList<Test> tests = new DebugDao().DaoTest(connection);
            return tests;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            JdbcUtil.close(connection);
        }
    }
}
