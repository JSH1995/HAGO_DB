package Auth.command;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import mvc.command.CommandHandler;
import services.AuthService;
import util.Constant;
import util.Directory;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;

public class RegisterHandler implements CommandHandler {

    private static String FORM_VIEW = "/WEB-INF/view/Auth/register.jsp";
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
            req.setAttribute("user","user");
        }
        return FORM_VIEW;
    }

    private String processSubmit(HttpServletRequest req, HttpServletResponse res) throws IOException {
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

        String id = multipartRequest.getParameter("inputId");
        String password = multipartRequest.getParameter("inputPassword");
        String nickName = multipartRequest.getParameter("inputNickname");
        int year = Integer.parseInt(multipartRequest.getParameter("inputYear"));
        int month = Integer.parseInt(multipartRequest.getParameter("inputMonth"));
        int day = Integer.parseInt(multipartRequest.getParameter("inputDay"));
        String email = multipartRequest.getParameter("inputEmail");
        String authStr = multipartRequest.getParameter("inputNumber");
        int phone = Integer.parseInt(multipartRequest.getParameter("inputPhone"));
        boolean allAgree = true;
        String gender = multipartRequest.getParameter("gender");

        int user_no = authService.register(id, password, nickName, gender, year, month, day, email, authStr, phone, allAgree);
        System.out.println("user_no is : " + user_no);
        if (user_no == -2) {
            req.setAttribute("state", -2);
        } else if (user_no == -1) {
            /*error*/
            return ERROR_VIEW;
        } else if (user_no == 0) {
            req.setAttribute("state", 0);
        } else {
            if (file != null) {
                /*Case 1 File Exist*/
                long time = System.currentTimeMillis();
                String newFileName = time + "_" + file.getName();
                String newFilePath = "files/images/" + user_no;
                if (!directory.isExistFolder("/files/images/" + user_no)) {
                    if (!directory.createFolder("/files/images/" + user_no + "")) {
                        /*File Create Error*/
                        directory.removeFile(directory.getDirectoryPath(), file.getName());
                        return ERROR_VIEW;
                    }
                }
                System.out.println("copy file");
                if (directory.copyFile(directory.getDirectoryPath(), newFilePath, file.getName(), newFileName)) {
                    if (authService.setProfile(user_no, newFilePath + "/" + newFileName)) {
                        req.setAttribute("state", 1);
                        System.out.println("copy file success");
                        directory.removeFile(directory.getDirectoryPath(), file.getName());
                    } else {
                        directory.removeFile(directory.getDirectoryPath(), file.getName());
                    }
                } else {
                    directory.removeFile(directory.getDirectoryPath(), file.getName());
                    return ERROR_VIEW;
                }
                System.out.println("newFileName : " + newFileName);
                System.out.println("newFilePath : " + newFilePath);
                System.out.println("oldFileName : " + file.getName());
                System.out.println("oldFilePath : " + directory.getDirectoryPath());
            }else{
                /*Case2 File is not Exist*/
                System.out.println("File is not Exist");
                req.setAttribute("state", 1);
            }


        }

        return FORM_VIEW;
    }
}
