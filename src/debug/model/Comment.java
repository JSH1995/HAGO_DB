package debug.model;

import java.util.Date;

public class Comment {
    private User user;
    private Content content;
    private String comment;
    private Date date;

    public Comment(User user, Content content, String comment, Date date) {
        this.user = user;
        this.content = content;
        this.comment = comment;
        this.date = date;
    }

    @Override
    public String toString() {
        return "Comment{" +
                "user=" + user +
                ", content=" + content +
                ", comment='" + comment + '\'' +
                ", date=" + date +
                '}';
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
