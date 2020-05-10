package debug.dao;

import debug.model.AdminManage;
import jdbc.JdbcUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class AdminManageDao {
    public ArrayList<AdminManage> DaoAdminManage(Connection connection) throws SQLException {
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        int nRs = 0;
        ArrayList<AdminManage> adminManages = new ArrayList<>();
        try{
            pstmt = connection.prepareStatement("select * from Admin_Manage");
            rs = pstmt.executeQuery();
            while(rs.next()) {
                adminManages.add(new AdminManage(rs.getInt("Admin_No"),rs.getString("Admin_BannerAll"),
                        rs.getString("Admin_BannerLeran"),rs.getString("Admin_BannerShare"),
                        rs.getString("Admin_ComIntro"),rs.getString("Admin_ComVideo"),
                        rs.getString("Admin_ComInsta"),
                        rs.getString("Admin_ComFacebook"),rs.getString("Admin_Location"),rs.getString("Admin_GoogleForm")));
            }
            return adminManages;
        } finally {
            JdbcUtil.close(pstmt);
        }
    }
}
