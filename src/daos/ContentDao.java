package daos;

import jdbc.JdbcUtil;
import models.Content;
import models.Like;
import models.User;

import java.sql.*;
import java.time.LocalDate;
import java.util.ArrayList;

public class ContentDao {
    private AuthDao authDao = new AuthDao();
    private ContentDetailDao contentDetailDao = new ContentDetailDao();

    private Content getContent(Connection connection, int no, int count) throws SQLException {
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            pstmt = connection.prepareStatement("select * from contents where Contents_No=?");
            pstmt.setInt(1, no);
            rs = pstmt.executeQuery();
            Content content = null;
            if (rs.next()) {
                content = new Content(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4),
                        rs.getString(5), rs.getString(6), rs.getDate(7), rs.getString(8), rs.getInt(9), rs.getInt(10));
                content.setUser(authDao.getUser(connection, content.getUser_no()));
                content.setConDetail(contentDetailDao.getConDetail(connection, content.getConDetail_no()));
                content.setCount(count);
            }
            if (content != null) {
                return content;
            } else {
                throw new RuntimeException();
            }
        } finally {
            JdbcUtil.close(rs);
            JdbcUtil.close(pstmt);
        }
    }

    public Content getContent(Connection connection, int no) throws SQLException {
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            pstmt = connection.prepareStatement("select * from contents where Contents_No=?");
            pstmt.setInt(1, no);
            rs = pstmt.executeQuery();
            Content content = null;
            if (rs.next()) {
                content = new Content(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4),
                        rs.getString(5), rs.getString(6), rs.getDate(7), rs.getString(8), rs.getInt(9), rs.getInt(10));
                content.setUser(authDao.getUser(connection, content.getUser_no()));
                content.setConDetail(contentDetailDao.getConDetail(connection, content.getConDetail_no()));
            }
            if (content != null) {
                return content;
            } else {
                throw new RuntimeException();
            }
        } finally {
            JdbcUtil.close(rs);
            JdbcUtil.close(pstmt);
        }
    }

    public ArrayList<Content> getRecentContents(Connection connection, int no) throws SQLException {
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            ArrayList<Content> contents = new ArrayList<>();
            pstmt = connection.prepareStatement("select * from contents where User_No=? order by Contents_Date desc");
            pstmt.setInt(1, no);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                /*Contents_No, Contents_Category, Contents_State,Contents_Name,
                Contents_Title,Contents_Detail,Contents_Date,Contents_Contents, user_no, conDetail_no*/
                Content content = new Content(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4),
                        rs.getString(5), rs.getString(6), rs.getDate(7), rs.getString(8), rs.getInt(9), rs.getInt(10));
                contents.add(content);
            }
            for (int i = 0; i < contents.size(); i++) {
                contents.get(i).setUser(authDao.getUser(connection, contents.get(i).getUser_no()));
                contents.get(i).setConDetail(contentDetailDao.getConDetail(connection, contents.get(i).getConDetail_no()));
            }
            return contents;
        } finally {
            JdbcUtil.close(rs);
            JdbcUtil.close(pstmt);
        }
    }

    public ArrayList<Content> getEditContents(Connection connection, int no) throws SQLException {
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            ArrayList<Content> contents = new ArrayList<>();
            pstmt = connection.prepareStatement("select * from contents where User_No=? AND Contents_State=? order by Contents_Date desc");
            pstmt.setInt(1, no);
            pstmt.setString(2, "edit");
            rs = pstmt.executeQuery();
            while (rs.next()) {
                /*Contents_No, Contents_Category, Contents_State,Contents_Name,
                Contents_Title,Contents_Detail,Contents_Date,Contents_Contents, user_no, conDetail_no*/
                Content content = new Content(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4),
                        rs.getString(5), rs.getString(6), rs.getDate(7), rs.getString(8), rs.getInt(9), rs.getInt(10));
                contents.add(content);
            }
            for (int i = 0; i < contents.size(); i++) {
                contents.get(i).setUser(authDao.getUser(connection, contents.get(i).getUser_no()));
                contents.get(i).setConDetail(contentDetailDao.getConDetail(connection, contents.get(i).getConDetail_no()));
            }
            return contents;
        } finally {
            JdbcUtil.close(rs);
            JdbcUtil.close(pstmt);
        }
    }

    public ArrayList<Content> getShareContents(Connection connection, int no) throws SQLException {
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            ArrayList<Content> contents = new ArrayList<>();
            pstmt = connection.prepareStatement("select * from contents where User_No=? AND Contents_State=? order by Contents_Date desc");
            pstmt.setInt(1, no);
            pstmt.setString(2, "share");
            rs = pstmt.executeQuery();
            while (rs.next()) {
                /*Contents_No, Contents_Category, Contents_State,Contents_Name,
                Contents_Title,Contents_Detail,Contents_Date,Contents_Contents, user_no, conDetail_no*/
                Content content = new Content(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4),
                        rs.getString(5), rs.getString(6), rs.getDate(7), rs.getString(8), rs.getInt(9), rs.getInt(10));
                contents.add(content);
            }
            for (int i = 0; i < contents.size(); i++) {
                contents.get(i).setUser(authDao.getUser(connection, contents.get(i).getUser_no()));
                contents.get(i).setConDetail(contentDetailDao.getConDetail(connection, contents.get(i).getConDetail_no()));
            }
            return contents;
        } finally {
            JdbcUtil.close(rs);
            JdbcUtil.close(pstmt);
        }
    }

    public ArrayList<Content> getLikeContents(Connection connection, int no) throws SQLException {
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            ArrayList<Like> likes = new ArrayList<>();
            ArrayList<Content> cLikes = new ArrayList<>();
            pstmt = connection.prepareStatement("select * from likes where User_No=?");
            pstmt.setInt(1, no);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                likes.add(new Like(rs.getInt(1), rs.getInt(2)));
            }
            for (int i = likes.size() - 1; i >= 0; i--) {
                Content content = getContent(connection, likes.get(i).getContent_no());
                cLikes.add(content);
            }
            return cLikes;
        } finally {
            JdbcUtil.close(rs);
            JdbcUtil.close(pstmt);
        }
    }

    public boolean updateContent(Connection connection, int content_no, String name, String title, String category, String detail, String contents) throws SQLException {
        PreparedStatement pstmt = null;
        int nRs = -1;
        try {
            pstmt = connection.prepareStatement("update contents " +
                    "set Contents_Name=? , Contents_Title=?,Contents_Detail=?,Contents_Contents=?,Contents_Category=? " +
                    "where Contents_No=?");
            pstmt.setString(1, name);
            pstmt.setString(2, title);
            pstmt.setString(3, detail);
            pstmt.setString(4, contents);
            pstmt.setString(5, category);
            pstmt.setInt(6, content_no);
            nRs = pstmt.executeUpdate();
            if (nRs >= 0) {
                return true;
            }
            return false;
        } finally {
            JdbcUtil.close(pstmt);
        }
    }

    public int createContent(Connection connection, User user, String name, String title, String category, String detail, String contents) throws SQLException {
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        int nRs = -1;
        try {
            pstmt = connection.prepareStatement("insert into contents(Contents_Category, Contents_State, Contents_Name, Contents_Title," +
                    " Contents_Detail, Contents_Date, Contents_Contents, User_No, " +
                    "ConDetails_No) values(?,?,?,?,?,?,?,?,?)", Statement.RETURN_GENERATED_KEYS);
            pstmt.setString(1, category);
            pstmt.setString(2, "edit");
            pstmt.setString(3, name);
            pstmt.setString(4, title);
            pstmt.setString(5, detail);
            pstmt.setDate(6, Date.valueOf(LocalDate.now()));
            pstmt.setString(7, contents);
            pstmt.setInt(8, user.getNo());
            pstmt.setString(9, null);
            nRs = pstmt.executeUpdate();
            rs = pstmt.getGeneratedKeys();
            if (rs.next()) {
                if (nRs >= 0) {
                    return rs.getInt(1);
                } else {
                    throw new RuntimeException();
                }
            } else {
                throw new RuntimeException();
            }
        } finally {
            JdbcUtil.close(pstmt);
            JdbcUtil.close(rs);
        }
    }

    public boolean updateContent(Connection connection, String type, int content_no) throws SQLException {
        PreparedStatement pstmt = null;
        int nRs = -1;
        try {
            pstmt = connection.prepareStatement("update contents set Contents_State=? where Contents_No=?");
            pstmt.setString(1, type);
            pstmt.setInt(2, content_no);
            nRs = pstmt.executeUpdate();
            if (nRs >= 0) {
                return true;
            } else {
                return false;
            }
        } finally {
            JdbcUtil.close(pstmt);
        }
    }

    public ArrayList<Content> searchContent(Connection connection, String s) throws SQLException {
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        ArrayList<Content> contents = new ArrayList<Content>();
        try {
            pstmt = connection.prepareStatement("select * from Contents where Contents_State NOT IN ('edit') AND Contents_Name like '%" + s + "%' order by Contents_Date desc");
            rs = pstmt.executeQuery();
            while (rs.next()) {
                contents.add(getContent(connection, rs.getInt(1)));
            }
            return contents;
        } finally {
            JdbcUtil.close(rs);
            JdbcUtil.close(pstmt);
        }
    }

    public ArrayList<Content> getHitContents(Connection connection) throws SQLException {
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            ArrayList<Content> contents = new ArrayList<>();
            pstmt = connection.prepareStatement("select *, (select count(*) from likes where likes.Contents_No = contents.Contents_No) as count from contents where Contents_State = ? order by count desc, Contents_Date desc;");
            pstmt.setString(1, "share");
            rs = pstmt.executeQuery();
            while (rs.next()) {
                if (rs.getInt("count") > 0) {
                    contents.add(getContent(connection, rs.getInt(1), rs.getInt("count")));
                }
            }
            return contents;
        } finally {
            JdbcUtil.close(rs);
            JdbcUtil.close(pstmt);
        }
    }

    public ArrayList<Content> getShareContents(Connection connection) throws SQLException {
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            /*TODO 1번이 마스터라 가정*/
            ArrayList<Content> contents = new ArrayList<>();
            pstmt = connection.prepareStatement("select * from contents where Contents_State=? AND User_No NOT IN (1) order by Contents_Date desc;");
            pstmt.setString(1, "share");
            rs = pstmt.executeQuery();
            while (rs.next()) {
                contents.add(getContent(connection, rs.getInt(1)));
            }
            return contents;
        } finally {
            JdbcUtil.close(rs);
            JdbcUtil.close(pstmt);
        }
    }

    public ArrayList<Content> getStudyContents(Connection connection) throws SQLException {
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            /*TODO 1번이 마스터라 가정*/
            ArrayList<Content> contents = new ArrayList<>();
            pstmt = connection.prepareStatement("select * from contents where Contents_State=? AND User_No IN (1) order by Contents_Date desc;");
            pstmt.setString(1, "share");
            rs = pstmt.executeQuery();
            while (rs.next()) {
                contents.add(getContent(connection, rs.getInt(1)));
            }
            return contents;
        } finally {
            JdbcUtil.close(rs);
            JdbcUtil.close(pstmt);
        }
    }
}
