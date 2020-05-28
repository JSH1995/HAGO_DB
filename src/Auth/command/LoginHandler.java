package Auth.command;

import models.User;
import mvc.command.CommandHandler;
import services.AuthService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LoginHandler implements CommandHandler {
    private static String FORM_VIEW = "/WEB-INF/view/Auth/login.jsp";
    private static String MOVE_VIEW = "/WEB-INF/view/main.jsp";
    private static String ERROR_VIEW = "/WEB-INF/view/error/error_500.jsp";

    private AuthService authService = new AuthService();

    @Override
    public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
        if (req.getMethod().equalsIgnoreCase("GET")) {
            return processForm(req, res);
        } else if (req.getMethod().equalsIgnoreCase("POST")) {
            return processSubmit(req, res);
        } else {
            res.setStatus(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
            return null;
        }
    }

    private String processForm(HttpServletRequest req, HttpServletResponse res) {
        if (req.getSession().getAttribute("USER") != null) {
            return MOVE_VIEW;
        }
        return FORM_VIEW;
    }

    private String processSubmit(HttpServletRequest req, HttpServletResponse res) {
        if (req.getSession().getAttribute("USER") != null) {
            return MOVE_VIEW;
        }
        String id = req.getParameter("inputId");
        String password = req.getParameter("inputPassword");
        switch (authService.loginService(id, password)) {
            case 1:
                /*success session create and setAttribute*/
                req.getSession().setAttribute("USER", id);
                req.setAttribute("isLogin", 1);
                break;
            case 2:
                /*password failed*/
                req.setAttribute("isLogin", 2);
                break;
            case 3:
                /*id not exist*/
                req.setAttribute("isLogin", 3);
                break;
            case 4:
                /*default server error*/
                req.setAttribute("isLogin", 4);
                return ERROR_VIEW;
            default:
                req.setAttribute("isLogin", 5);
                break;
        }
        return FORM_VIEW;
    }
}
