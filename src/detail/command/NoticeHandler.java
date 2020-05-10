package detail.command;

import models.Announce;
import mvc.command.CommandHandler;
import services.NoticeService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;

public class NoticeHandler implements CommandHandler {
    private static String FORM_VIEW = "/WEB-INF/view/detail/notice.jsp";

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

        ArrayList<Announce> announces = new ArrayList<>();
        announces = new NoticeService().NoticeDB(0,5);
        int totalcnt = new NoticeService().NoticeTotalCnt();
        int totalpage = (int)Math.floor(totalcnt/5);
        if(totalcnt % 5 > 0) totalpage++;
            req.setAttribute("Notice",announces);
        req.setAttribute("handler_totalpage",totalpage);
        return FORM_VIEW;
    }

    private String processSubmit(HttpServletRequest req, HttpServletResponse res) {
        return FORM_VIEW;
    }
}
