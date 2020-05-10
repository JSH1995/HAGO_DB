package main.command;

import models.Content;
import models.ContentsForTypes;
import mvc.command.CommandHandler;
import services.ContentService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;

public class SearchHandler implements CommandHandler {

    private static String FORM_VIEW = "/WEB-INF/view/search.jsp";
    private static String BEFORE_VIEW = "/WEB-INF/view/main.jsp";

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

    private ContentService contentService = new ContentService();

    private String processForm(HttpServletRequest req, HttpServletResponse res) {
        String searchValue = req.getParameter("inputSearch");
        System.out.println("search : "+searchValue);
        ArrayList<Content> searchContents = new ContentService().searchContent(searchValue);
        System.out.println(searchContents.toString());
        /*관리자가 올린거*/
        ArrayList<Content> studyContents = searchContents;
        ArrayList<Content> scienceContents = contentService.forTypes(Content.TYPE_SCIENCE, studyContents);
        ArrayList<Content> socialContents = contentService.forTypes(Content.TYPE_SOCIAL, studyContents);
        ArrayList<Content> languageContents = contentService.forTypes(Content.TYPE_LANGUAGE, studyContents);
        ArrayList<Content> mathContents = contentService.forTypes(Content.TYPE_MATH, studyContents);
        ContentsForTypes contentsForSearch = new ContentsForTypes(studyContents, scienceContents, socialContents, languageContents, mathContents);
        req.setAttribute("contents", contentsForSearch);
        return FORM_VIEW;
    }

    private String processSubmit(HttpServletRequest req, HttpServletResponse res) {
        String searchValue = req.getParameter("inputSearch");
        System.out.println("search : "+searchValue);
        ArrayList<Content> searchContents = new ContentService().searchContent(searchValue);
        System.out.println(searchContents.toString());
        /*관리자가 올린거*/
        ArrayList<Content> studyContents = searchContents;
        ArrayList<Content> scienceContents = contentService.forTypes(Content.TYPE_SCIENCE, studyContents);
        ArrayList<Content> socialContents = contentService.forTypes(Content.TYPE_SOCIAL, studyContents);
        ArrayList<Content> languageContents = contentService.forTypes(Content.TYPE_LANGUAGE, studyContents);
        ArrayList<Content> mathContents = contentService.forTypes(Content.TYPE_MATH, studyContents);
        ContentsForTypes contentsForSearch = new ContentsForTypes(studyContents, scienceContents, socialContents, languageContents, mathContents);
        req.setAttribute("contents", contentsForSearch);
        return FORM_VIEW;
    }
}
