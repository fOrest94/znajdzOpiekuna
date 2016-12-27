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

    @Transient
    private String dobDay;

    @Transient
    private String dobMonth;

    @Transient
    private String dobYear;

    @Transient
    private Integer age;

    @NotNull
    @Column(name = "poziom_dostepu")
    private String role;

    @NotNull
    @Column(name = "typ_uzytkownika")
    private int userType;

    @Column(name = "imie")
    private String firstName;

    @Column(name = "nazwisko")
    private String lastName;

    @Column(name = "aktywny")
    private Integer active = 0;

    @Column(name = "miasto")
    private String town;

    @Column(name = "plec")
    private String sex;

    @Column(name = "kod_pocztowy")
    private String zipCode;

    @Column(name = "wynagrodzenie")
    private String moneyPerHour;

    @Column(name = "data_urodzenia")
    private String dateOfBirth;

    @Column(name = "tozsamosc")
    private int entity = 0;

    public User(){}

    public User(String username, String password, String passwordConfirm, String role, Integer userType,
                String firstName, String lastName, Integer active, String town, String sex, String zipCode) {
        this.username = username;
        this.password = password;
        this.passwordConfirm = passwordConfirm;
        this.role = role;
        this.userType = userType;
        this.firstName = firstName;
        this.lastName = lastName;
        this.active = active;
        this.town = town;
        this.sex = sex;
        this.zipCode = zipCode;
    }

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

    public Integer getUserType() {
        return userType;
    }

    public void setUserType(Integer userType) {
        this.userType = userType;
    }

    public Integer getActive() {
        return active;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getMoneyPerHour() {
        return moneyPerHour;
    }

    public void setMoneyPerHour(String moneyPerHour) {
        this.moneyPerHour = moneyPerHour;
    }

    public String getZipCode() {
        return zipCode;
    }

    public void setZipCode(String zipCode) {
        this.zipCode = zipCode;
    }

    public String getTown() {return town;}

    public void setTown(String town) {this.town = town;}

    public String getDateOfBirth() {
        return dateOfBirth;
    }

    public void setDateOfBirth(String dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }

    public void setUserType(int userType) {
        this.userType = userType;
    }

    public String getDobDay() {
        return dobDay;
    }

    public void setDobDay(String dobDay) {
        this.dobDay = dobDay;
    }

    public String getDobMonth() {
        return dobMonth;
    }

    public void setDobMonth(String dobMonth) {
        this.dobMonth = dobMonth;
    }

    public String getDobYear() {
        return dobYear;
    }

    public void setDobYear(String dobYear) {
        this.dobYear = dobYear;
    }

    public int getEntity() {
        return entity;
    }

    public void setEntity(int entity) {
        this.entity = entity;
    }
}
