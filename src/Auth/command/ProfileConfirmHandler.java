package Auth.command;

import models.User;
import mvc.command.CommandHandler;
import services.AuthService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ProfileConfirmHandler implements CommandHandler {
    private static String FORM_VIEW = "/WEB-INF/view/Auth/profile_confirm.jsp";
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
        String id = (String) req.getSession().getAttribute("USER");
        User user = authService.getUser(id);
        System.out.println("user profileConfirm Handler : " + user.toString());
        req.setAttribute("user", user);
        return FORM_VIEW;
    }

    private String processSubmit(HttpServletRequest req, HttpServletResponse res) {
        String id = (String) req.getSession().getAttribute("USER");
        User user = authService.getUser(id);
        req.setAttribute("user", user);
        String password = req.getParameter("inputPassword");
        int state = authService.confirmId(id, password);
        req.setAttribute("state", state);
        if (state == 1) {
            req.getSession().setAttribute("PROFILE", "AUTHED");
        }
        if (req.getParameter("type") != null) {
            if (req.getParameter("type").equals("create")) {
                req.setAttribute("type", "create");
            } else if (req.getParameter("type").equals("cEdit")) {
                req.setAttribute("type", "cEdit");
                req.setAttribute("content_no", req.getParameter("content_no"));
            } else {
                req.setAttribute("type", "edit");
            }
        } else {
        }
        return FORM_VIEW;
    }
}
