package filter;

import services.AdminService;

import javax.servlet.*;
import java.io.IOException;

public class JwtAuthenticationFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        System.out.println("DelegationFilter init()");
    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        System.out.println("DelegationFilter doFilter()");
        servletRequest.setAttribute("admin", new AdminService().adminDB());
        filterChain.doFilter(servletRequest, servletResponse);
    }

    @Override
    public void destroy() {
        System.out.println("DelegationFilter doDestroy()");
    }
}
