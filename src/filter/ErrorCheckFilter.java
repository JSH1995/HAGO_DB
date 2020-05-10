package filter;

import javax.servlet.*;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.Properties;

public class ErrorCheckFilter implements Filter {

    private String contextPath;
    private ArrayList<String> urls = new ArrayList<>();

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        System.out.println("ErrorCheckFilter init()");
        contextPath = filterConfig.getServletContext().getContextPath();
        String configFile = filterConfig.getInitParameter("configFile");
        Properties prop = new Properties();
        System.out.println(filterConfig.getServletContext().getRealPath(configFile));
        try (FileReader fis = new FileReader(filterConfig.getServletContext().getRealPath(configFile))) {
            prop.load(fis);
        } catch (IOException e) {
            throw new ServletException(e);
        }
        Iterator keyIter = prop.keySet().iterator();
        while (keyIter.hasNext()) {
            String command = (String) keyIter.next();
            String handlerClassName = prop.getProperty(command);
            urls.add(command);
        }
    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        System.out.println("ErrorCheckFilter doFilter()");
        HttpServletRequest req = (HttpServletRequest) servletRequest;
        HttpServletResponse res = (HttpServletResponse) servletResponse;
        String path = ((HttpServletRequest) req).getServletPath();
        System.out.println("Error Check URL : " + urls.toString() + " / " + path);
        if (urls.contains(path)) {
            filterChain.doFilter(servletRequest, servletResponse);
        } else {
            throw new Error("is not handler");
        }
    }

    @Override
    public void destroy() {
        System.out.println("ErrorCheckFilter destroy()");
    }
}
