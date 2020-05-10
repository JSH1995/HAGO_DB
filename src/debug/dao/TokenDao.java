package debug.dao;

import debug.model.Token;
import jdbc.JdbcUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class TokenDao {
    public ArrayList<Token> DaoToken(Connection connection) throws SQLException {
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        int nRs = 0;
        ArrayList<Token> tokens = new ArrayList<>();
        try{
            pstmt = connection.prepareStatement("select * from Token");
            rs = pstmt.executeQuery();
            while(rs.next()) {
                tokens.add(new Token(rs.getInt("Token_No"),rs.getString("Token_email"),rs.getString("Token_Number")));
            }
            return tokens;
        } finally {
            JdbcUtil.close(pstmt);
        }
    }
}
