package Auth.command;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import models.User;
import mvc.command.CommandHandler;
import services.AuthService;
import util.Constant;
import util.Directory;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;

public class ProfileEditHandler implements CommandHandler {
    private static String FORM_VIEW = "/WEB-INF/view/Auth/profile_edit.jsp";
    private static String ERROR_VIEW = "/WEB-INF/view/error/error_500.jsp";
    private static String BEFORE_VIEW = "/WEB-INF/view/Auth/profile_confirm.jsp";
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
        req.setAttribute("user", user);
        if (req.getSession().getAttribute("PROFILE") == null) {
            req.setAttribute("type", "edit");
            return BEFORE_VIEW;
        }
        return FORM_VIEW;
    }

    private String processSubmit(HttpServletRequest req, HttpServletResponse res) throws IOException {
        String id = (String) req.getSession().getAttribute("USER");
        User user = authService.getUser(id);
        req.setAttribute("user", user);
        if (req.getSession().getAttribute("PROFILE") == null) {
            req.setAttribute("type", "edit");
            return BEFORE_VIEW;
        }
        Directory directory = new Directory(req.getServletContext().getRealPath("/"), "files/images/temp");
        System.out.println(directory.getRealPath() + directory.getDirectoryPath());
        if (!directory.isExistFolder()) {
            if (!directory.createFolder()) {
                /*File Create Error*/
                return ERROR_VIEW;
            }
        }

        MultipartRequest multipartRequest = new MultipartRequest(req, directory.getRealPath() + directory.getDirectoryPath(), Constant.IMAGE_SIZE, "utf-8", new DefaultFileRenamePolicy());
        File file = multipartRequest.getFile(multipartRequest.getFileNames().nextElement().toString());

        String password = multipartRequest.getParameter("inputNewPassword");
        String nickName = multipartRequest.getParameter("inputNickname");
        int year = Integer.parseInt(multipartRequest.getParameter("inputYear"));
        int month = Integer.parseInt(multipartRequest.getParameter("inputMonth"));
        int day = Integer.parseInt(multipartRequest.getParameter("inputDay"));
        String email = multipartRequest.getParameter("inputEmail");
        String authStr = multipartRequest.getParameter("inputNumber");
        int phone = Integer.parseInt(multipartRequest.getParameter("inputPhone"));

        /*TODO 2가지 선택 Image가 있냐 Image가 없냐*/
        System.out.println(file == null);
        if (file == null) {
            /*TODO Case 1*/
            int state = authService.updateUser(user.getId(), password, nickName, year, month, day, email, authStr, phone);
            if (state == -1) {
                /*error*/
                return ERROR_VIEW;
            } else if (state == 0) {
                req.setAttribute("state", 0);
            } else if (state == 1) {
                req.setAttribute("state", 1);
            }
        } else {
            /*TODO Case 2*/
            int state = authService.updateUser(user.getId(), password, nickName, year, month, day, email, authStr, phone);
            System.out.println("state is : " + state);
            if (state == -1) {
                /*error*/
                return ERROR_VIEW;
            } else if (state == 0) {
                req.setAttribute("state", 0);
            } else if (state == 1) {
                long time = System.currentTimeMillis();
                String newFileName = time + "_" + file.getName();
                String newFilePath = "files/images/" + user.getNo();
                if (!directory.isExistFolder("/files/images/" + user.getNo())) {
                    if (!directory.createFolder("/files/images/" + user.getNo())) {
                        /*File Create Error*/
                        directory.removeFile(directory.getDirectoryPath(), file.getName());
                        return ERROR_VIEW;
                    }
                }
                System.out.println("copy file");
                if (directory.copyFile(directory.getDirectoryPath(), newFilePath, file.getName(), newFileName)) {
                    if (authService.setProfile(user.getNo(), newFilePath + "/" + newFileName)) {
                        System.out.println("copy file success");
                        directory.removeFile(directory.getDirectoryPath(), file.getName());
                        req.setAttribute("state", 1);
                    } else {
                        directory.removeFile(directory.getDirectoryPath(), file.getName());
                        directory.removeFile(newFilePath + "/" + newFileName);
                        req.setAttribute("state", 0);
                    }
                } else {
                    directory.removeFile(directory.getDirectoryPath(), file.getName());
                    return ERROR_VIEW;
                }
                System.out.println("newFileName : " + newFileName);
                System.out.println("newFilePath : " + newFilePath);
                System.out.println("oldFileName : " + file.getName());
                System.out.println("oldFilePath : " + directory.getDirectoryPath());
            }
        }
        return FORM_VIEW;
    }
}
