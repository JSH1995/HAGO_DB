package debug.command;

import com.oreilly.servlet.MultipartRequest;
import debug.service.*;
import mvc.command.CommandHandler;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import util.Constant;
import util.Directory;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.Date;

public class DebugHandler implements CommandHandler {

    private static String FORM_VIEW = "/WEB-INF/view/debug.jsp";

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

    private String processForm(HttpServletRequest req, HttpServletResponse res) throws IOException, JSONException {
        Date now = new Date();
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        System.out.println(dateFormat.format(now));
        Directory directory = new Directory(req.getServletContext().getRealPath("/"), "files/images/temp");
        long time = System.currentTimeMillis();
        String newFileName = time + "_" + "사대보험.PNG";
        String newFilePath = "files/images/test";
        if (directory.copyFile(directory.getDirectoryPath(), newFilePath, "사대보험.PNG", newFileName)) {
            System.out.println(true);
        }
        /*JSONObject jsonObject = new JSONObject();
        JSONArray jsonArray = new JSONArray();
        for (int i = 0; i < 3; i++) {
            JSONObject detail = new JSONObject();
            if (i == 0 || i == 2) {
                detail.put("title", "블록코딩이 먼가요?");
                detail.put("detail", "교육용 프로그래밍 언어(EPL) 입니다. 응용프로그램을 설계하기 위해 만들어진 프로그래밍 언어가 아닌 컴퓨팅 사고력과 알고리즘 학습을 하기 위한 목적으로 만들어진 프로그래밍 언어입니다.");
            } else {
                detail.put("title", "프로그램의 기본 원리");
                detail.put("detail", "프로그래밍 초보자들이 단순히 텍스를 작성하는 것이 아닌 레고형태의 블록을 옮기는 Drag&Drop 방식으로 프로그래밍의 기본원리에 대해 쉽게 접근 할 수 있습니다.");
            }
            jsonArray.put(detail);
        }
        jsonObject.put("learn", jsonArray);
        System.out.println(jsonObject.toString());
        req.getSession().setAttribute("USER", "zlzldntlr");*/
        return FORM_VIEW;
        /*        *//*DB Test*//*
        System.out.println(new DebugService().DBTest().toString()+"test");
        *//*User Test*//*
        System.out.println("user / "+new UserService().UserDB().toString());
        *//*Token Test*//*
        System.out.println("token / "+new TokenService().TokenDB().toString());
        *//*Like Test*//*
        System.out.println("like / "+new LikeService().LikeDB().toString());
        *//*CustomCenter Test*//*
        System.out.println("customCenter / "+new CustomCenterService().CustomCenterDB().toString());
*//*        *//**//*Content Test*//**//*
        System.out.println("Content / "+new ContentService().ContentDB().toString());
        *//**//*ConDetail Test*//**//*
        System.out.println("ConDetail / "+new ConDetailService().ConDetailDB().toString());
        *//**//*Comment Test*//**//*
        System.out.println("Comment / "+new CommentService().CommentDB().toString());*//*
         *//*Announce Test*//*
        System.out.println("Announce / "+new AnnounceService().AnnounceDB().toString());
        *//*AdminManage Test*//*
        System.out.println("AdminManage / "+new AdminManageService().AdminDB().toString());

        *//*Session Check*//*
        req.getSession().setAttribute("USER", "USER1");*/

        /*MailSending Algorithm
         * 1. Create Personal Token
         * 2. Token Database Insert
         * 3. Mail Sending
         * 4. return Success or Failed*/
        /*try {
            String token = Tokens.randomToken(24);
         *//*new NameService.Function(email,token)*//*
            new MailService().MailSender("zlzldntlr@naver.com", token);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            return FORM_VIEW;
        }*/
    }

    private String processSubmit(HttpServletRequest req, HttpServletResponse res) {
        return FORM_VIEW;
    }
}
