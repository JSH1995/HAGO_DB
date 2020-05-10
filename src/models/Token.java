package models;

public class Token {
    private int no;
    private String email;
    private String number;

    public Token(int no, String email, String number) {
        this.no = no;
        this.email = email;
        this.number = number;
    }

    public int getNo() {
        return no;
    }

    public void setNo(int no) {
        this.no = no;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getNumber() {
        return number;
    }

    public void setNumber(String number) {
        this.number = number;
    }

    @Override
    public String toString() {
        return "Token{" +
                "no=" + no +
                ", email=" + email +
                ", number=" + number +
                '}';
    }
}
