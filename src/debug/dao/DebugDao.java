package debug.dao;

import debug.model.Test;
import jdbc.JdbcUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class DebugDao {

    public ArrayList<Test> DaoTest(Connection connection) throws SQLException {
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        int nRs = 0;
        ArrayList<Test> tests = new ArrayList<>();
        try {
            pstmt = connection.prepareStatement("select * from test");
            /** TODO select data
             *  rs = pstmt.executeQuery();
             *  IF Data is More than One
             *      whilte(rs.next()){
             *          ArrayList.add(rs.getString("Column Name or Column Index") or rs.getInt("Column Name or Column Index"))
             *      }
             *      return ArrayList;
             *  ELSE Data is Only One or Not
             *       rs.next();
             *       return rs.getString("Column Name or Column Index");
             * */
            rs = pstmt.executeQuery();
            while (rs.next()) {
                tests.add(new Test(rs.getInt("id"), rs.getString("name")));
            }
            return tests;
            /** TODO update insert delete data
             *  nRs = pstmt.executeUpdate();
             * */
        } finally {
            JdbcUtil.close(pstmt);
        }
    }
}
