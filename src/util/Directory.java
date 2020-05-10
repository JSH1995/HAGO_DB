package util;

import java.io.*;
import java.util.ArrayList;

public class Directory {
    private String totalPath;
    private String realPath;
    private String directoryPath;

    /**
     * @param directoryPath directory path Ex) uploadFile/test1/test2/test
     * @param realPath      serverPath Ex) C:\Users\zlzld\OneDrive\Desktop\WoodPlanetProject\project\Modu\classes\artifacts\Modu_Web_exploded\
     */
    public Directory(String realPath, String directoryPath) {
        this.realPath = realPath;
        this.directoryPath = directoryPath;
    }

    public Directory(String totalPath) {
        this.totalPath = totalPath;
    }

    public String getRealPath() {
        return this.realPath;
    }

    public void setRealPath(String realPath) {
        this.realPath = realPath;
    }

    public String getDirectoryPath() {
        return this.directoryPath;
    }

    public void setDirectoryPath(String directoryPath) {
        this.directoryPath = directoryPath;
    }

    /**
     * realPath = C:\Users\zlzld\OneDrive\Desktop\WoodPlanetProject\project\Modu\classes\artifacts\Modu_Web_exploded\
     * true : create
     * false : create failed or directory already exist
     */
    public boolean createFolder() {
        File folder = new File(this.realPath + this.directoryPath);
        return folder.mkdirs();
    }

    public boolean createFolder(String directoryPath) {
        File folder = new File(this.realPath + directoryPath);
        return folder.mkdirs();
    }

    public boolean deleteFileFromFileName(String fileName) {
        File folder = new File(this.totalPath);
        boolean check = false;
        for (File file : folder.listFiles()) {
            if (file.isDirectory()) {
            } else {
                if (file.getName().contains(fileName)) {
                    if (file.delete()) {
                        check = true;
                    } else {
                        check = false;
                    }
                }
            }
        }
        return check;
    }

    /**
     * @param folderPath directory path Ex) uploadFile/test1/test2/test
     */
    public ArrayList<String> filesSearch(String folderPath) {
        ArrayList<String> files = new ArrayList<>();
        File folder = new File(this.realPath + folderPath);
        for (File file : folder.listFiles()) {
            if (file.isDirectory()) {
                //디렉토리
            } else {
                // 파일
                files.add(file.getName());
            }
        }
        return files;
    }

    /**
     * url http://localhost:8080/ + uploadFile/test/test2/1.png
     */
    public ArrayList<String> filesSearch(String folderPath, String url) {
        ArrayList<String> files = filesSearch(folderPath);
        ArrayList<String> urls = new ArrayList<>();
        for (String fileName : files) {
            urls.add(url + folderPath + "/" + fileName);
        }
        return urls;
    }

    public boolean isExistFolder() {
        ArrayList<String> directorys = new ArrayList<>();
        StrTokenizer strTokenizer = new StrTokenizer(this.directoryPath, "/");
        boolean isExist = false;
        for (int i = 0; i < strTokenizer.getTokenSize(); i++) {
            directorys.add(strTokenizer.getIndexToken(i + 1));
        }
        for (int i = 0; i < directorys.size(); i++) {
            String directory = "";
            for (int j = 0; j <= i; j++) {
                if (j != i) {
                    directory += directorys.get(j) + "/";
                } else {
                    directory += directorys.get(j);
                }
            }
            File folder = new File(this.realPath + directory);
            if (folder.isDirectory()) {
                isExist = true;

            } else {
                isExist = false;

            }
        }
        return isExist;
    }

    public boolean isExistFolder(String folderPath) {
        ArrayList<String> directorys = new ArrayList<>();
        StrTokenizer strTokenizer = new StrTokenizer(folderPath, "/");
        boolean isExist = false;
        for (int i = 0; i < strTokenizer.getTokenSize(); i++) {
            directorys.add(strTokenizer.getIndexToken(i + 1));
        }

        for (int i = 0; i < directorys.size(); i++) {
            String directory = "";
            for (int j = 0; j <= i; j++) {
                if (j != i) {
                    directory += directorys.get(j) + "/";
                } else {
                    directory += directorys.get(j);
                }
            }
            File folder = new File(this.realPath + directory);
            if (folder.isDirectory()) {
                isExist = true;

            } else {
                isExist = false;

            }
        }
        return isExist;
    }

    /**
     * 특정 파일 다른 디렉토리에 복사
     * 이름까지 지정
     *
     * @param folderSourcePath
     * @param fileName
     * @param folderCopyPath
     * @param copyFileName
     */
    public boolean copyFile(String folderSourcePath, String folderCopyPath, String fileName, String copyFileName) throws IOException {
        InputStream inStream = null;
        OutputStream outStream = null;
        if (isExistFolder()) {
            File file = new File(this.realPath + folderSourcePath + "/" + fileName);
            try {
                inStream = new FileInputStream(file);
                if (isExistFolder(folderCopyPath)) {
                    outStream = new FileOutputStream(this.realPath + folderCopyPath + "/" + copyFileName);
                    byte[] buffer = new byte[1024];
                    int length;
                    while ((length = inStream.read(buffer)) > 0) {
                        outStream.write(buffer, 0, length);
                    }
                    return true;
                } else {
                    createFolder(folderCopyPath);
                    outStream = new FileOutputStream(this.realPath + folderCopyPath + "/" + copyFileName);
                    byte[] buffer = new byte[1024];
                    int length;
                    while ((length = inStream.read(buffer)) > 0) {
                        outStream.write(buffer, 0, length);
                    }
                    return true;
                }
            } catch (IOException e) {
                e.printStackTrace();
                return false;
            } finally {
                inStream.close();
                outStream.close();
            }
        } else {
            return false;
        }
    }

    /**
     * 특정 디렉토리에 파일들을 다른 디렉토리에 복사
     * 이름까지 지정 X
     */
    public boolean copyFiles(String folderSourcePath, String folderCopyPath) throws IOException {
        InputStream inStream = null;
        OutputStream outStream = null;
        ArrayList<String> fileNames = filesSearch(folderSourcePath);
        if (isExistFolder()) {
            for (int i = 0; i < fileNames.size(); i++) {
                File file = new File(this.realPath + folderSourcePath + "/" + fileNames.get(i));
                try {
                    inStream = new FileInputStream(file);
                    if (isExistFolder(folderCopyPath)) {
                        outStream = new FileOutputStream(this.realPath + folderCopyPath + "/" + fileNames.get(i));
                        byte[] buffer = new byte[1024];
                        int length;
                        while ((length = inStream.read(buffer)) > 0) {
                            outStream.write(buffer, 0, length);
                        }
                    } else {
                        createFolder(folderCopyPath);
                        outStream = new FileOutputStream(this.realPath + folderCopyPath + "/" + fileNames.get(i));
                        byte[] buffer = new byte[1024];
                        int length;
                        while ((length = inStream.read(buffer)) > 0) {
                            outStream.write(buffer, 0, length);
                        }
                    }
                } catch (IOException e) {
                    e.printStackTrace();
                    return false;
                } finally {
                    inStream.close();
                    outStream.close();
                }
            }
            return true;
        } else {
            return false;
        }
    }

    public boolean removeDirectory() {
        File deleteFolder = new File(this.realPath + this.directoryPath);
        try {
            if (deleteFolder.exists()) {
                File[] deleteFolderList = deleteFolder.listFiles();

                for (int i = 0; i < deleteFolderList.length; i++) {
                    if (deleteFolderList[i].isFile()) {
                        deleteFolderList[i].delete();
                    } else {
                        removeDirectory(deleteFolderList[i].getPath());
                    }
                    deleteFolderList[i].delete();
                }
                deleteFolder.delete();
            }
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }

    public boolean removeDirectory(String directoryPath) {
        File deleteFolder = new File(this.realPath + directoryPath);
        try {
            if (deleteFolder.exists()) {
                File[] deleteFolderList = deleteFolder.listFiles();

                for (int i = 0; i < deleteFolderList.length; i++) {
                    if (deleteFolderList[i].isFile()) {
                        deleteFolderList[i].delete();
                    } else {
                        removeDirectory(deleteFolderList[i].getPath());
                    }
                    deleteFolderList[i].delete();
                }
                deleteFolder.delete();
            }
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }

    public boolean removeFile(String path) {
        String fullPath = this.realPath + path;
        File file = new File(fullPath);
        if (file.delete()) {
            return true;
        } else {
            return false;
        }
    }

    public boolean removeFile(String directoryPath, String fileName) {
        File removeFile = new File(this.realPath + directoryPath + "/" + fileName);
        if (removeFile.exists()) {
            if (removeFile.delete()) {
                return true;
            } else {
                return false;
            }
        } else {
            return false;
        }
    }

    public boolean removeAllFile(String directoryPath) {
        File deleteFolder = new File(this.realPath + directoryPath);
        try {
            if (deleteFolder.exists()) {
                File[] deleteFolderList = deleteFolder.listFiles();
                for (File file : deleteFolderList) {
                    file.delete();
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }

    public boolean isExistFile(String fileName) {
        File folder = new File(this.realPath);
        try {
            if (folder.exists()) {
                File[] folderFileList = folder.listFiles();
                for (File file : folderFileList) {
                    if (file.getName().equals(fileName)) {
                        return true;
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
        return false;
    }

    public boolean isExistFile(String fileName, String directoryPath) {
        File folder = new File(this.realPath + directoryPath);
        try {
            if (folder.exists()) {
                File[] folderFileList = folder.listFiles();
                for (File file : folderFileList) {
                    if (file.getName().equals(fileName)) {
                        return true;
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
        return false;
    }
}
