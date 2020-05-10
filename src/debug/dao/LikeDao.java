package debug.dao;

import debug.model.ConDetail;
import debug.model.Content;
import debug.model.Like;
import debug.model.User;
import jdbc.JdbcUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class LikeDao {
    public ArrayList<Like> DaoLike(Connection connection) throws SQLException {
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        ResultSet rs1 = null;
        ResultSet rs2 = null;
        ResultSet rs3 = null;
        ResultSet rs4 = null;
        //ArrayList<Like> likes = new ArrayList<>();

        try{
            ArrayList<Like> likes = new ArrayList<Like>();
            pstmt = connection.prepareStatement("select * from Likes");
            rs = pstmt.executeQuery();
            while(rs.next()) {
                pstmt = connection.prepareStatement("select * from User where User_No=?");
                pstmt.setInt(1,rs.getInt("User_No"));
                rs1 = pstmt.executeQuery();
                pstmt = connection.prepareStatement("select * from Contents where Contents_No=?");
                pstmt.setInt(1,rs1.getInt("Contents_No"));
                rs2 = pstmt.executeQuery();
                pstmt = connection.prepareStatement("select * from User where User_No=?");
                pstmt.setInt(1,rs2.getInt("User_No"));
                rs3 = pstmt.executeQuery();
                pstmt = connection.prepareStatement("select * from ConDetails where ConDetails_No=?");
                pstmt.setInt(1,rs2.getInt("ConDetails_No"));
                rs4 = pstmt.executeQuery();

                likes.add(new Like(new
                        User(rs1.getInt("User_No"),rs1.getDate("User_RegDate"),
                        rs1.getDate("User_BirthDate"),rs1.getString("User_ID"),
                        rs1.getString("User_Password"),rs1.getString("User_Email"),
                        rs1.getString("User_Gender"),
                        rs1.getString("User_NickName"),rs1.getInt("User_Phone"),rs1.getInt("User_Agree"),
                        rs1.getString("User_img")),
                        new Content(rs2.getInt("Contents_No"),rs2.getString("Contents_Category"),rs2.getString("Contents_State"),rs2.getString("Contents_Name")
                                ,rs2.getString("Contents_Title"),rs2.getString("Contents_Detail"),rs2.getDate("Contents_Date"),
                                rs2.getString("Contents_Contents"),new User
                                (rs3.getInt("User_No"),rs3.getDate("User_RegDate"),
                                        rs3.getDate("User_BirthDate"),rs3.getString("User_ID"),
                                        rs3.getString("User_Password"),rs3.getString("User_Email"),
                                        rs3.getString("User_Gender"),
                                        rs3.getString("User_NickName"),rs3.getInt("User_Phone"),rs3.getInt("User_Agree"),
                                        rs3.getString("User_img")),
                                new ConDetail(rs4.getInt("ConDetails_No"),rs4.getString("Contents_Json")))
                ));
            }
            return likes;
        } finally {
            JdbcUtil.close(pstmt);
        }
    }
}
