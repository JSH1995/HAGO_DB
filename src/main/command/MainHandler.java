package main.command;

import models.Content;
import models.ContentsForTypes;
import models.MainContents;
import mvc.command.CommandHandler;
import services.ContentService;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;

public class MainHandler implements CommandHandler {

    private static String FORM_VIEW = "/WEB-INF/view/main.jsp";

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

    /*관리자 계정으로 만든게 학습 컨텐츠에 올라감
    사용자의 Contents_state share을때 공유 컨텐츠에 올라감
    likes기준으로 개수가 많은순으로 뿌려줌*/

    private ContentService contentService = new ContentService();

    private String processForm(HttpServletRequest req, HttpServletResponse res) {
        /*Likes를 기준으로 가져온 Contents*/
        ArrayList<Content> hitContents = contentService.getHitContents();
        /*관리자가 올린거*/
        ArrayList<Content> studyContents = contentService.getStudyContents();
        ArrayList<Content> scienceContents = contentService.forTypes(Content.TYPE_SCIENCE, studyContents);
        ArrayList<Content> socialContents = contentService.forTypes(Content.TYPE_SOCIAL, studyContents);
        ArrayList<Content> languageContents = contentService.forTypes(Content.TYPE_LANGUAGE, studyContents);
        ArrayList<Content> mathContents = contentService.forTypes(Content.TYPE_MATH, studyContents);
        ContentsForTypes contentsForStudy = new ContentsForTypes(studyContents, scienceContents, socialContents, languageContents, mathContents);
        /*사용자가 올린거*/
        ArrayList<Content> shareContents = contentService.getShareContents();
        scienceContents = contentService.forTypes(Content.TYPE_SCIENCE, shareContents);
        socialContents = contentService.forTypes(Content.TYPE_SOCIAL, shareContents);
        languageContents = contentService.forTypes(Content.TYPE_LANGUAGE, shareContents);
        mathContents = contentService.forTypes(Content.TYPE_MATH, shareContents);
        ContentsForTypes contentsForShare = new ContentsForTypes(shareContents, scienceContents, socialContents, languageContents, mathContents);
        MainContents mainContents = new MainContents(hitContents, contentsForStudy, contentsForShare);
        req.setAttribute("contents", mainContents);
        return FORM_VIEW;
    }

    private String processSubmit(HttpServletRequest req, HttpServletResponse res) {
        /*Likes를 기준으로 가져온 Contents*/
        ArrayList<Content> hitContents = contentService.getHitContents();
        /*관리자가 올린거*/
        ArrayList<Content> studyContents = contentService.getStudyContents();
        ArrayList<Content> scienceContents = contentService.forTypes(Content.TYPE_SCIENCE, studyContents);
        ArrayList<Content> socialContents = contentService.forTypes(Content.TYPE_SOCIAL, studyContents);
        ArrayList<Content> languageContents = contentService.forTypes(Content.TYPE_LANGUAGE, studyContents);
        ArrayList<Content> mathContents = contentService.forTypes(Content.TYPE_MATH, studyContents);
        ContentsForTypes contentsForStudy = new ContentsForTypes(studyContents, scienceContents, socialContents, languageContents, mathContents);
        /*사용자가 올린거*/
        ArrayList<Content> shareContents = contentService.getShareContents();
        scienceContents = contentService.forTypes(Content.TYPE_SCIENCE, shareContents);
        socialContents = contentService.forTypes(Content.TYPE_SOCIAL, shareContents);
        languageContents = contentService.forTypes(Content.TYPE_LANGUAGE, shareContents);
        mathContents = contentService.forTypes(Content.TYPE_MATH, shareContents);
        ContentsForTypes contentsForShare = new ContentsForTypes(shareContents, scienceContents, socialContents, languageContents, mathContents);
        MainContents mainContents = new MainContents(hitContents, contentsForStudy, contentsForShare);
        req.setAttribute("contents", mainContents);
        req.setAttribute("type", "study");
        return FORM_VIEW;
    }
}
