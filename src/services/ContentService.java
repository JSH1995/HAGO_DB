package services;

import daos.AuthDao;
import daos.ContentDao;
import jdbc.JdbcUtil;
import jdbc.connection.ConnectionProvider;
import models.Content;
import models.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;

public class ContentService {
    private ContentDao contentDao = new ContentDao();

    public Content getContent(int no) throws SQLException {
        Connection connection = null;
        try {
            connection = ConnectionProvider.getConnection();
            return contentDao.getContent(connection, no);
        } finally {
            JdbcUtil.close(connection);
        }
    }

    public ArrayList<Content> getRecentContents(int no) {
        Connection connection = null;
        try {
            connection = ConnectionProvider.getConnection();
            return contentDao.getRecentContents(connection, no);
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException();
        } finally {
            JdbcUtil.close(connection);
        }
    }

    public ArrayList<Content> getEditContents(int no) {
        Connection connection = null;
        try {
            connection = ConnectionProvider.getConnection();
            return contentDao.getEditContents(connection, no);
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException();
        } finally {
            JdbcUtil.close(connection);
        }
    }

    public ArrayList<Content> getShareContents(int no) {
        Connection connection = null;
        try {
            connection = ConnectionProvider.getConnection();
            return contentDao.getShareContents(connection, no);
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException();
        } finally {
            JdbcUtil.close(connection);
        }
    }

    public ArrayList<Content> getLikeContents(int no) {
        Connection connection = null;
        try {
            connection = ConnectionProvider.getConnection();
            return contentDao.getLikeContents(connection, no);
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException();
        } finally {
            JdbcUtil.close(connection);
        }
    }

    public boolean updateContent(int content_no, String name, String title, String category, String detail, String contents) {
        Connection connection = null;
        try {
            connection = ConnectionProvider.getConnection();
            return contentDao.updateContent(connection, content_no, name, title, category, detail, contents);
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException();
        } finally {
            JdbcUtil.close(connection);
        }
    }

    public int createContent(String name, String title, String category, String detail, String contents, User user) {
        Connection connection = null;
        try {
            connection = ConnectionProvider.getConnection();
            return contentDao.createContent(connection, user, name, title, category, detail, contents);
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException();
        } finally {
            JdbcUtil.close(connection);
        }
    }

    public boolean updateContent(String state, int content_no) {
        Connection connection = null;
        try {
            connection = ConnectionProvider.getConnection();
            return contentDao.updateContent(connection, state, content_no);
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException();
        } finally {
            JdbcUtil.close(connection);
        }
    }

    public ArrayList<Content> searchContent(String s) {
        Connection connection = null;
        try {
            connection = ConnectionProvider.getConnection();
            return new ContentDao().searchContent(connection, s);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            JdbcUtil.close(connection);
        }
    }

    public ArrayList<Content> getShareContents() {
        Connection connection = null;
        try {
            connection = ConnectionProvider.getConnection();
            return contentDao.getShareContents(connection);
        } catch (SQLException e) {
            e.printStackTrace();
            return new ArrayList<Content>();
        } finally {
            JdbcUtil.close(connection);
        }
    }

    public ArrayList<Content> getHitContents() {
        Connection connection = null;
        try {
            connection = ConnectionProvider.getConnection();
            return contentDao.getHitContents(connection);
        } catch (SQLException e) {
            e.printStackTrace();
            return new ArrayList<Content>();
        } finally {
            JdbcUtil.close(connection);
        }
    }

    public ArrayList<Content> getStudyContents() {
        Connection connection = null;
        try {
            connection = ConnectionProvider.getConnection();
            return contentDao.getStudyContents(connection);
        } catch (SQLException e) {
            e.printStackTrace();
            return new ArrayList<Content>();
        } finally {
            JdbcUtil.close(connection);
        }
    }

    public ArrayList<Content> forTypes(String type, ArrayList<Content> contents) {
        ArrayList<Content> forTypes = new ArrayList<>();
        for (int i = 0; i < contents.size(); i++) {
            if(contents.get(i).getCategory().equals(type)){
                forTypes.add(contents.get(i));
            }
        }
        return forTypes;
    }
}
