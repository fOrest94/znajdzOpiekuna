package info.znOpk.model;

import javax.persistence.*;
import javax.validation.constraints.NotNull;

/**
 * Created by DuduŚ on 2016-12-18.
 */
@Entity
@Table(name = "szukajacy_opieki")
public class SearchCare {

    @Id
    @GeneratedValue
    @Column(name = "id")
    private Long id;

    @NotNull
    @Column(name = "id_uzytkownika")
    private Long userId;

    @Column(name = "opieka_niania")
    private String whoWannCareNanny;

    @Column(name = "opieka_starsi")
    private String whoWannCareOld;

    @NotNull
    @Column(name = "cos_o_sobie")
    private String writeSthAboutYou;

    @Column(name = "praca_z_domem")
    private String workWithHome;

    @NotNull
    @Column(name = "wynagrodzenie")
    private String moneyPerHour;

    public SearchCare() {

    }

    public SearchCare(Long userId) {
        this.userId = userId;
    }

    public SearchCare(Long userId, String writeSthAboutYou, String moneyPerHour) {
        this.userId = userId;
        this.writeSthAboutYou = writeSthAboutYou;
        this.moneyPerHour = moneyPerHour;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public String getWhoWannCareNanny() {
        return whoWannCareNanny;
    }

    public void setWhoWannCareNanny(String whoWannCareNanny) {
        this.whoWannCareNanny = whoWannCareNanny;
    }

    public String getWhoWannCareOld() {
        return whoWannCareOld;
    }

    public void setWhoWannCareOld(String whoWannCareOld) {
        this.whoWannCareOld = whoWannCareOld;
    }

    public String getWriteSthAboutYou() {
        return writeSthAboutYou;
    }

    public void setWriteSthAboutYou(String writeSthAboutYou) {
        this.writeSthAboutYou = writeSthAboutYou;
    }

    public String getWorkWithHome() {
        return workWithHome;
    }

    public void setWorkWithHome(String workWithHome) {
        this.workWithHome = workWithHome;
    }

    public String getMoneyPerHour() {
        return moneyPerHour;
    }

    public void setMoneyPerHour(String moneyPerHour) {
        this.moneyPerHour = moneyPerHour;
    }

}
