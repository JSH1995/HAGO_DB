package filter;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Arrays;
import java.util.List;

public class SessionCheckFilter implements Filter {
    private String contextPath;
    private List<String> excludedUrls;

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        System.out.println("SessionCheckFilter init()");
        contextPath = filterConfig.getServletContext().getContextPath();
        String excludePattern = filterConfig.getInitParameter("excludedUrls");
        excludedUrls = Arrays.asList(excludePattern.split(","));
    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        System.out.println("SessionCheckFilter doFilter()");
        HttpServletRequest req = (HttpServletRequest) servletRequest;
        HttpServletResponse res = (HttpServletResponse) servletResponse;
        String path = ((HttpServletRequest) req).getServletPath();
        if (excludedUrls.contains(path)) {
            /*main.do, login.do, register.do*/
            filterChain.doFilter(servletRequest, servletResponse);
        } else {
            /*그외 로그인 필요한 url들*/
            if (req.getSession().getAttribute("USER") == null) {
                System.out.println("User is null");
                /*is not log in*/
                res.sendRedirect(contextPath + "/login.do");
            } else {
                /*is log in*/
                String userType = (String) req.getSession().getAttribute("USER");
                if (userType.equals("ADMIN")) {
                    /*is admin*/
                    filterChain.doFilter(servletRequest, servletResponse);
                } else {
                    /*is not admin but user log in*/
                    filterChain.doFilter(servletRequest, servletResponse);
                }
            }
        }
    }

    @Override
    public void destroy() {
        System.out.println("SessionCheckFilter destroy()");
    }
}
