package debug.model;

public class Like {
    private User user;
    private Content content;

    public Like(User user, Content content) {
        this.user = user;
        this.content = content;
    }

    @Override
    public String toString() {
        return "Like{" +
                "user=" + user +
                ", content=" + content +
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
}
