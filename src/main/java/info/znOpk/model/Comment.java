package info.znOpk.model;

import javax.persistence.*;
import javax.validation.constraints.NotNull;

/**
 * Created by DuduŚ on 2016-12-24.
 */

@Entity
@Table(name = "komentarze")
public class Comment {

    @Id
    @GeneratedValue
    @Column(name = "id")
    private Long id;

    @NotNull
    @Column(name = "id_wiadomosci")
    private Long newsId;

    @NotNull
    @Column(name = "id_uzytkownika")
    private Long userId;

    @NotNull
    @Column(name = "tresc_komentarza")
    private String comment_description;

    @NotNull
    @Column(name = "data_komentarza")
    private String data;

    @NotNull
    @Column(name = "imie_uzytkownika")
    private String firstName;

    @NotNull
    @Column(name = "nazwisko_uzytkownika")
    private String lastName;

    @Column(name = "ocena_komentarza")
    private Double mark;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getNewsId() {
        return newsId;
    }

    public void setNewsId(Long newsId) {
        this.newsId = newsId;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public String getComment_description() {
        return comment_description;
    }

    public void setComment_description(String comment_description) {
        this.comment_description = comment_description;
    }

    public String getData() {
        return data;
    }

    public void setData(String data) {
        this.data = data;
    }

    public Double getMark() {
        return mark;
    }

    public void setMark(Double mark) {
        this.mark = mark;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    @Override
    public String toString() {
        return "Comment{" +
                "id=" + id +
                ", newsId='" + newsId + '\'' +
                ", userId='" + userId + '\'' +
                ", comment_description='" + comment_description + '\'' +
                ", data='" + data + '\'' +
                ", mark=" + mark +
                '}';
    }
}
