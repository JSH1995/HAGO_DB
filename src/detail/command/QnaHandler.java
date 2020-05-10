package detail.command;

import models.Announce;
import models.CustomCenter;
import mvc.command.CommandHandler;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import services.NoticeService;
import services.QnaService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

public class QnaHandler implements CommandHandler {
    private static String FORM_VIEW = "/WEB-INF/view/detail/qna.jsp";

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

    private String processForm(HttpServletRequest req, HttpServletResponse res) throws JSONException {
        System.out.println("QNA" + req.getParameter("id") + req.getQueryString());

        ArrayList<CustomCenter> customCenters = new ArrayList<>();
        customCenters = new QnaService().QnaDB(0);
        int totalcnt = new QnaService().QnaTotalCnt();
        int totalpage = (int)Math.floor(totalcnt/5);
        if(totalcnt % 5 > 0) totalpage++;

            req.setAttribute("Qna", customCenters);

        req.setAttribute("handler_totalpage",totalpage);

        return FORM_VIEW;
    }

    private String processSubmit(HttpServletRequest req, HttpServletResponse res) {
        return FORM_VIEW;
    }
}

