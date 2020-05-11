package services;

import daos.AuthDao;
import jdbc.JdbcUtil;
import jdbc.connection.ConnectionProvider;
import models.User;

import javax.servlet.http.HttpSession;
import java.sql.Connection;
import java.sql.SQLException;

public class AuthService {
    private AuthDao authDao = new AuthDao();

    public int loginService(String id, String password) {
        Connection connection = null;
        try {
            connection = ConnectionProvider.getConnection();
            if (authDao.existID(connection, id)) {
                if (authDao.loginDao(connection, id, password)) {
                    /*login success*/
                    return 1;
                } else {
                    /*login failed cause password not exactly*/
                    return 2;
                }
            } else {
                /*id is not exist*/
                return 3;
            }
        } catch (Exception e) {
            e.printStackTrace();
            return 4;
        } finally {
            JdbcUtil.close(connection);
            /*exception error*/
        }
    }

    public int duplicatedId(String id) {
        Connection connection = null;
        try {
            connection = ConnectionProvider.getConnection();
            System.out.println("DEBUG1");
            if (!authDao.existID(connection, id)) {
                System.out.println("DEBUG2");
                /*ID 없을 때*/
                return 1;
            } else {
                /*ID 있을 때*/
                return 2;
            }
        } catch (SQLException e) {
            e.printStackTrace();
            /*Error*/
            return 3;
        } finally {
            JdbcUtil.close(connection);
        }
    }

    public int duplicatedMail(String email) {
        Connection connection = null;
        try {
            connection = ConnectionProvider.getConnection();
            if (!authDao.existMail(connection, email)) {
                /*Mail 없을 때*/
                return 1;
            } else {
                /*Mail 있을 때*/
                return 2;
            }
        } catch (SQLException e) {
            e.printStackTrace();
            /*Error*/
            return 3;
        } finally {
            JdbcUtil.close(connection);
        }
    }

    public boolean saveTempToken(String email, String token) throws Exception {
        Connection connection = null;
        try {
            connection = ConnectionProvider.getConnection();
            if (authDao.saveTempToken(connection, email, token)) {
                return true;
            } else {
                return false;
            }
        } catch (SQLException e) {
            throw new RuntimeException();
        } finally {
            JdbcUtil.close(connection);
        }
    }

    public int register(String id, String password, String nickName, String gender, int year, int month, int day, String email, String authStr, int phone, boolean allAgree) {
        Connection connection = null;
        try {
            connection = ConnectionProvider.getConnection();
            String token = authDao.getToken(connection, email);
            if (compare(token, authStr)) {
                /*Token이 같음*/
                return authDao.register(connection, id, password, nickName, gender, year, month, day, email, phone, allAgree);
            } else {
                /*Token이 틀림*/
                return -2;
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException();
        } finally {
            JdbcUtil.close(connection);
        }
    }

    /*TODO UTIL로 옮겨야함 나중에*/
    public boolean compare(String token, String authStr) {
        if (token != null) {
            if (token.equals(authStr)) {
                return true;
            } else {
                return false;
            }
        } else {
            return false;
        }
    }

    public String findId(String email) {
        Connection connection = null;
        try {
            connection = ConnectionProvider.getConnection();
            return authDao.findId(connection, email);
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException();
        } finally {
            JdbcUtil.close(connection);
        }
    }

    public String findPassword(String id, String email) {
        Connection connection = null;
        try {
            connection = ConnectionProvider.getConnection();
            return authDao.findPassword(connection, id, email);
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException();
        } finally {
            JdbcUtil.close(connection);
        }
    }

    public int confirmId(String id, String password) {
        Connection connection = null;
        try {
            if (id != null) {
                connection = ConnectionProvider.getConnection();
                if (authDao.confirmId(connection, id, password)) {
                    /*Success*/
                    return 1;
                } else {
                    /*Failed*/
                    return 2;
                }
            } else {
                return 3;
            }
        } catch (Exception e) {
            e.printStackTrace();
            /*Error*/
            return 3;
        } finally {
            JdbcUtil.close(connection);
        }
    }

    public User getUser(String id) {
        Connection connection = null;
        try {
            connection = ConnectionProvider.getConnection();
            User user = authDao.getUser(connection, id);
            if (user != null) {
                return user;
            }
            return null;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        } finally {
            JdbcUtil.close(connection);
        }
    }

    public boolean setProfile(int user_no, String path) {
        Connection connection = null;
        try {
            System.out.println("setProfile");
            connection = ConnectionProvider.getConnection();
            return authDao.setProfile(connection, user_no, path);
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        } finally {
            JdbcUtil.close(connection);
        }
    }

    public int logoutService(HttpSession session) {
        if (session != null) {
            session.removeAttribute("USER");
            if (session.getAttribute("PROFILE") != null) {
                session.removeAttribute("PROFILE");
            }
            return 1;
        } else {
            return 2;
        }
    }

    public int updateUser(String id, String password, String nickName, int year, int month, int day, int phone) {
        Connection connection = null;
        try {
            connection = ConnectionProvider.getConnection();
            //String token = authDao.getToken(connection, email);
            int state = -1;
            /*if (compare(token, authStr)) {
                state = authDao.updateUser(connection, id, password, nickName, year, month, day, email, phone);
                if (state == 1) {
                    authDao.deleteToken(connection, email);
                }
            } else {
                state = 0;
            }*/
            state = authDao.updateUser(connection, id, password, nickName, year, month, day,phone);


            return state;
        } catch (SQLException e) {
            e.printStackTrace();
            return -1;
        } finally {
            JdbcUtil.close(connection);
        }
    }

    public boolean contentAuth(int no, int content_no) {
        Connection connection = null;
        try {
            connection = ConnectionProvider.getConnection();
            return authDao.contentAuth(connection, no, content_no);
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException();
        } finally {
            JdbcUtil.close(connection);
        }
    }

    public boolean integrity(String id, String email) throws SQLException {
        Connection connection = null;
        try {
            connection = ConnectionProvider.getConnection();
            return authDao.integrity(connection, id, email);
        } finally {
            JdbcUtil.close(connection);
        }
    }
}
