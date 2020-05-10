package jdbc;

import org.apache.commons.dbcp2.*;
import org.apache.commons.pool2.impl.GenericObjectPool;
import org.apache.commons.pool2.impl.GenericObjectPoolConfig;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import java.io.IOException;
import java.io.StringReader;
import java.sql.DriverManager;
import java.util.Properties;


public class DBCPInitListener implements ServletContextListener {

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        // web.xml의 context-param 갑들을 String 형태로 저장한다.
        String poolConfig = sce.getServletContext().getInitParameter("poolConfig");
        Properties prop = new Properties();
        try {
            // context-param값들을 Properties타입으로 로딩한다.
            prop.load(new StringReader(poolConfig));
        } catch (IOException e) {
            throw new RuntimeException("config load fail", e);
        }

        loadJDBCDriver(prop);
        initConnectionPool(prop);
    }

    private void loadJDBCDriver(Properties prop) {
        // Properties 의 poolConfig의 값 중 jdbcdriver 값을 String형태로 저장한다.
        String driverClass = prop.getProperty("jdbcdriver");
        try {
            Class.forName(driverClass);
        } catch (ClassNotFoundException ex) {
            throw new RuntimeException("fail to load JDBC Driver", ex);
        }
    }

    private void initConnectionPool(Properties prop) {
        try {
            String jdbcUrl = prop.getProperty("jdbcUrl");
            String username = prop.getProperty("dbUser");
            String pw = prop.getProperty("dbPass");
            // 커넥션 풀이 새로운 커넥션을 생성할 때 사용할 커넥션 팩토리를 생성한다.
            ConnectionFactory connFactory = new DriverManagerConnectionFactory(jdbcUrl, username, pw);
            // PoolableConnection을 생성하는 팩토리를 생성한다. DBCP는 커넥션 풀에 커넥션을 보관할 때 PoolableConnection을 사용한다. 이 클래스는 내부적으로 실제 커낵션을 담고 있으며
            // 커넥션 풀을 관리하는데 필요한 기능을 추가로 제공한다.
            PoolableConnectionFactory poolableConnFactory = new PoolableConnectionFactory(connFactory, null);
            String validationQuery = prop.getProperty("validationQuery");
            if (validationQuery != null && !validationQuery.isEmpty()) {
                poolableConnFactory.setValidationQuery(validationQuery);
            }

            // 커넥션 풀의 설정 정보를 생성한다.
            GenericObjectPoolConfig poolConfig = new GenericObjectPoolConfig();
            // 유휴 커넥션 검사 주기
            poolConfig.setTimeBetweenEvictionRunsMillis(1000L * 60L * 5L);
            // 풀에 보관 중인 커넥션이 유효한지 검사할지 여부
            poolConfig.setTestWhileIdle(true);
            // 커넥션 최소 개수
            int minIdle = getIntProperty(prop, "minIdle", 5);
            poolConfig.setMinIdle(minIdle);
            // 커넥션 최대 개수
            int maxTotal = getIntProperty(prop, "maxTotal", 50);
            poolConfig.setMaxTotal(maxTotal);

            // 커넥션 풀을 생성한다. 커넥션 풀 팩토리와 커넥션 풀 설정을 파라미터로 전달받는다. pooableConnFactory, poolConfig
            GenericObjectPool<PoolableConnection> connectionPool = new GenericObjectPool<>(poolableConnFactory, poolConfig);
            // PoolableConnectionFactory에도 커넥션 풀을 연결한다.
            poolableConnFactory.setPool(connectionPool);

            // 커넥션 풀을 제공하는 JDBC드라이버를 등록한다.
            Class.forName("org.apache.commons.dbcp2.PoolingDriver");
            PoolingDriver driver = (PoolingDriver) DriverManager.getDriver("jdbc:apache:commons:dbcp:");
            String poolName = prop.getProperty("poolName");
            driver.registerPool(poolName, connectionPool);
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
    }

    private int getIntProperty(Properties prop, String propName, int defaultValue) {
        String value = prop.getProperty(propName);
        if (value == null) return defaultValue;
        return Integer.parseInt(value);
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {

    }
}

