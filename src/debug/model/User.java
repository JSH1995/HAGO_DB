package debug.model;

import java.sql.Date;

public class User {
    private int no;
    private Date regDate;
    private Date birthDate;
    private String id;
    private String password;
    private String email;
    private String gender;
    private String nickname;
    private int phone;
    private int agree;
    private String img;

    public User(int no, Date regDate, Date birthDate, String id, String password, String email, String gender, String nickname, int phone, int agree, String img) {
        this.no = no;
        this.regDate = regDate;
        this.birthDate = birthDate;
        this.id = id;
        this.password = password;
        this.email = email;
        this.gender = gender;
        this.nickname = nickname;
        this.phone = phone;
        this.agree = agree;
        this.img = img;
    }

    public int getNo() {
        return no;
    }

    public void setNo(int no) {
        this.no = no;
    }

    public Date getRegDate() {
        return regDate;
    }

    public void setRegDate(Date regDate) {
        this.regDate = regDate;
    }

    public Date getBirthDate() {
        return birthDate;
    }

    public void setBirthDate(Date birthDate) {
        this.birthDate = birthDate;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }


    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public int getPhone() {
        return phone;
    }

    public void setPhone(int phone) {
        this.phone = phone;
    }

    public int getAgree() {
        return agree;
    }

    public void setAgree(int agree) {
        this.agree = agree;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    @Override
    public String toString() {
        return "User{" +
                "no=" + no +
                ", regDate=" + regDate +
                ", birthDate=" + birthDate +
                ", id=" + id +
                ", password=" + password +
                ", email=" + email +
                ", gender=" + gender +
                ", nickname=" + nickname +
                ", phone=" + phone +
                ", agree=" + agree +
                ", img=" + img +
                '}';
    }
}
