package models;

import java.util.Date;

public class Comment {
    private int user_no;
    private User user;
    private int content_no;
    private Content content;
    private String comment;
    private Date date;

    @Override
    public String toString() {
        return "Comment{" +
                "user_no=" + user_no +
                ", user=" + user +
                ", content_no=" + content_no +
                ", content=" + content +
                ", comment='" + comment + '\'' +
                ", date=" + date +
                '}';
    }

    public int getUser_no() {
        return user_no;
    }

    public void setUser_no(int user_no) {
        this.user_no = user_no;
    }

    public int getContent_no() {
        return content_no;
    }

    public void setContent_no(int content_no) {
        this.content_no = content_no;
    }

    public Comment(int user_no, int content_no, String comment, Date date) {
        this.user_no = user_no;
        this.content_no = content_no;
        this.comment = comment;
        this.date = date;
    }

    public Comment(User user, Content content, String comment, Date date) {
        this.user = user;
        this.content = content;
        this.comment = comment;
        this.date = date;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Content getContent() {
        return content;
    }

    public void setContent(Content content) {
        this.content = content;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }
}
