package detail.command;


import models.User;
import mvc.command.CommandHandler;
import services.AuthService;
import services.ContentService;
import util.InputScriptInjection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.SQLException;

public class ContentCreateHandler implements CommandHandler {

    private static String FORM_VIEW = "/WEB-INF/view/detail/content_create.jsp";
    private static String ERROR_VIEW = "/WEB-INF/view/error/error_500.jsp";
    private static String BEFORE_VIEW = "/WEB-INF/view/Auth/profile_confirm.jsp";

    private AuthService authService = new AuthService();
    private ContentService contentService = new ContentService();

    @Override
    public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
        /*TODO 2가지 Case
         *  1. Edit 상태에서 들어온것
         *  2. Create 상태에서 들어온것*/
        if (req.getMethod().equalsIgnoreCase("GET")) {
            return processForm(req, res);
        } else if (req.getMethod().equalsIgnoreCase("POST")) {
            return processSubmit(req, res);
        } else {
            res.setStatus(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
            return null;
        }
    }

    private String processForm(HttpServletRequest req, HttpServletResponse res) throws SQLException {
        String id = (String) req.getSession().getAttribute("USER");
        System.out.println("ContentCreateHandler");
        User user = authService.getUser(id);
        req.setAttribute("user", user);
        System.out.println("type : " + req.getParameter("type"));
        if (req.getParameter("type") != null && req.getParameter("type").equals("edit")) {
            /*CASE1 EDIT*/
            int content_no = Integer.parseInt(req.getParameter("content_no"));
            if (!authService.contentAuth(user.getNo(), content_no)) {
                return ERROR_VIEW;
            }
            req.setAttribute("content", contentService.getContent(content_no));
            req.setAttribute("state", 1);
        } else {
            /*CASE2 CREATE*/
            req.setAttribute("state", 2);
        }
        System.out.println("ContentCreateHandler state : " + req.getAttribute("state"));
        return FORM_VIEW;
    }

    private String processSubmit(HttpServletRequest req, HttpServletResponse res) throws SQLException {
        String id = (String) req.getSession().getAttribute("USER");
        User user = authService.getUser(id);
        req.setAttribute("user", user);

        InputScriptInjection IScript = new InputScriptInjection();
        String name = IScript.ScriptInjection(req.getParameter("inputTitle"));
        String title = IScript.ScriptInjection(req.getParameter("inputDescript"));
        String detail = IScript.ScriptInjection(req.getParameter("inputDetailDescript"));
        String category = req.getParameter("inputCategory");
        String contents = req.getParameter("inputContents");
        //contents.indexOf(0);

        System.out.println("Handler Contents : " + contents);
        if (req.getParameter("type") != null && req.getParameter("type").equals("edit")) {
            /*CASE1 EDIT*/
            int content_no = Integer.parseInt(req.getParameter("content_no"));
            if (!authService.contentAuth(user.getNo(), content_no)) {
                return ERROR_VIEW;
            }
            contentService.updateContent(content_no, name, title, category, detail, contents);
            req.setAttribute("content", contentService.getContent(content_no));
            req.setAttribute("state", 1);
        } else {
            /*CASE2 CREATE*/
            int content_no = contentService.createContent(name, title, category, detail, contents, user);
            req.setAttribute("content", contentService.getContent(content_no));
            req.setAttribute("state", 2);
        }
        return FORM_VIEW;
    }
}
