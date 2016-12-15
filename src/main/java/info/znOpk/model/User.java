package info.znOpk.model;

import javax.persistence.*;
import javax.validation.constraints.NotNull;

@Entity
@Table(name = "uzytkownik")
public class User {

    @Id
    @GeneratedValue
    @Column(name = "id")
    private Long id;

    @NotNull
    @Column(name = "email")
    private String username;

    @NotNull
    @Column(name = "haslo")
    private String password;

    @Transient
    private String passwordConfirm;

    @NotNull
    @Column(name = "poziom_dostepu")
    private String role;

    @NotNull
    @Column(name = "typ_uzytkownika")
    private String userType;

    @Column(name = "imie")
    private String firstName;

    @Column(name = "nazwisko")
    private String lastName;

    @Column(name = "aktywny")
    private Integer active = 0;

    @Column(name = "miasto")
    private String town;

    @Column(name = "plec")
    private boolean sex;

    @Column(name = "kod_pocztowy")
    private String zipCode;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Integer isActive() {return active;}

    public void setActive(Integer active) {this.active = active;}

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPasswordConfirm() {
        return passwordConfirm;
    }

    public void setPasswordConfirm(String passwordConfirm) {this.passwordConfirm = passwordConfirm;}

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
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

    public String getUserType() {
        return userType;
    }

    public void setUserType(String userType) {
        this.userType = userType;
    }

    public boolean isSex() {
        return sex;
    }

    public void setSex(boolean sex) {
        this.sex = sex;
    }

    public String getZipCode() {
        return zipCode;
    }

    public void setZipCode(String zipCode) {
        this.zipCode = zipCode;
    }

    public String getTown() {return town;}

    public void setTown(String town) {this.town = town;}
}
