package filter;

import javax.servlet.*;
import java.io.IOException;

public class CharacterEncodingFilter implements Filter {

    private String encoding;

    @Override
    public void init(FilterConfig config) throws ServletException {
        System.out.println("EncodingFilter init()");
        encoding = config.getInitParameter("encoding");
        if (encoding == null) {
            encoding = "UTF-8";
        }
    }

    @Override
    public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain) throws IOException, ServletException {
        System.out.println("EncodingFilter doFilter()");
        req.setCharacterEncoding(encoding);
        chain.doFilter(req, res);
    }

    @Override
    public void destroy() {
        System.out.println("EncodingFilter destroy()");
    }
}
