package services;

import daos.QnaDao;
import jdbc.JdbcUtil;
import jdbc.connection.ConnectionProvider;
import models.CustomCenter;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

public class QnaService {
    public ArrayList<CustomCenter> QnaDB(int sNum) {
        Connection connection = null;
        try{
            connection = ConnectionProvider.getConnection();
            ArrayList<CustomCenter> customCenters = new QnaDao().DaoQna(connection, sNum);
            return  customCenters;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            JdbcUtil.close(connection);
        }
    }
    public int QnaTotalCnt(){
        Connection connection = null;
        try{
            connection = ConnectionProvider.getConnection();
            int nRs = new QnaDao().TotalCnt(connection);
            return nRs;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            JdbcUtil.close(connection);
        }
    }
}
