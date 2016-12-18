package info.znOpk.model;

import javax.persistence.*;
import javax.validation.constraints.NotNull;

@Entity
@Table(name = "opiekun")
public class OfferCare {

    @Id
    @GeneratedValue
    @Column(name = "id")
    private Long id;

    @NotNull
    @Column(name = "id_uzytkownika")
    private Long userId;

    @NotNull
    @Column(name = "data_urodzenia")
    private String dataOfBirth;

    @Transient
    private int age;

    @Column(name = "opieka_niania")
    private String whoWannCareNanny;

    @Column(name = "opieka_starsi")
    private String whoWannCareOld;

    @Column(name = "umiej_sprzat")
    private String otherActClean;

    @Column(name = "umiej_gotowa")
    private String otherActCook;

    @Column(name = "umiej_zakup")
    private String otherActShop;

    @Column(name = "umiej_prac")
    private String otherActVac;

    @Column(name = "inne_umiejetnosci")
    private String otherSkills;
    @NotNull
    @Column(name = "cos_o_sobie")
    private String writeSthAboutYou;

    @Column(name = "doswiadczenie_dzieci")
    private String careExpKids;

    @Column(name = "doswiadczenie_starsi")
    private String careExpOld;

    @Column(name = "lat_dosw_dzieci")
    private String experienceKidsTime;

    @Column(name = "lat_dosw_starsi")
    private String experienceOldTime;

    @Column(name = "wymiar_pol_etatu")
    private String timeJobHalf;

    @Column(name = "wymiar_pelny_etat")
    private String timeJobFull;

    @Column(name = "wymiar_dorywczo")
    private String timeJobCasual;
    @NotNull
    @Column(name = "miejsce_opieki")
    private String placeOfTakeCare;
    @NotNull
    @Column(name = "praca_z_domem")
    private String workWithHome;
    @NotNull
    @Column(name = "wynagrodzenie")
    private String moneyPerHour;
    @NotNull
    @Column(name = "wyksztalcenie")
    private String education;

    @Column(name = "jezyki_obce")
    private String foreignLanguages;

    public OfferCare() {
    }

    public OfferCare(Long userId, String dataOfBirth, String otherSkills, String writeSthAboutYou, String experienceKidsTime, String experienceOldTime,
                     String placeOfTakeCare, String workWithHome, String moneyPerHour, String education, String foreignLanguages) {
        this.userId = userId;
        this.dataOfBirth = dataOfBirth;
        this.otherSkills = otherSkills;
        this.writeSthAboutYou = writeSthAboutYou;
        this.experienceKidsTime = experienceKidsTime;
        this.experienceOldTime = experienceOldTime;
        this.placeOfTakeCare = placeOfTakeCare;
        this.workWithHome = workWithHome;
        this.moneyPerHour = moneyPerHour;
        this.education = education;
        this.foreignLanguages = foreignLanguages;
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

    public String getDataOfBirth() {
        return dataOfBirth;
    }

    public void setDataOfBirth(String dataOfBirth) {
        this.dataOfBirth = dataOfBirth;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
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

    public String getOtherActClean() {
        return otherActClean;
    }

    public void setOtherActClean(String otherActClean) {
        this.otherActClean = otherActClean;
    }

    public String getOtherActCook() {
        return otherActCook;
    }

    public void setOtherActCook(String otherActCook) {
        this.otherActCook = otherActCook;
    }

    public String getOtherActShop() {
        return otherActShop;
    }

    public void setOtherActShop(String otherActShop) {
        this.otherActShop = otherActShop;
    }

    public String getOtherActVac() {
        return otherActVac;
    }

    public void setOtherActVac(String otherActVac) {
        this.otherActVac = otherActVac;
    }

    public String getOtherSkills() {
        return otherSkills;
    }

    public void setOtherSkills(String otherSkills) {
        this.otherSkills = otherSkills;
    }

    public String getWriteSthAboutYou() {
        return writeSthAboutYou;
    }

    public void setWriteSthAboutYou(String writeSthAboutYou) {
        this.writeSthAboutYou = writeSthAboutYou;
    }

    public String getCareExpKids() {
        return careExpKids;
    }

    public void setCareExpKids(String careExpKids) {
        this.careExpKids = careExpKids;
    }

    public String getCareExpOld() {
        return careExpOld;
    }

    public void setCareExpOld(String careExpOld) {
        this.careExpOld = careExpOld;
    }

    public String getExperienceKidsTime() {
        return experienceKidsTime;
    }

    public void setExperienceKidsTime(String experienceKidsTime) {
        this.experienceKidsTime = experienceKidsTime;
    }

    public String getExperienceOldTime() {
        return experienceOldTime;
    }

    public void setExperienceOldTime(String experienceOldTime) {
        this.experienceOldTime = experienceOldTime;
    }

    public String getTimeJobHalf() {
        return timeJobHalf;
    }

    public void setTimeJobHalf(String timeJobHalf) {
        this.timeJobHalf = timeJobHalf;
    }

    public String getTimeJobFull() {
        return timeJobFull;
    }

    public void setTimeJobFull(String timeJobFull) {
        this.timeJobFull = timeJobFull;
    }

    public String getTimeJobCasual() {
        return timeJobCasual;
    }

    public void setTimeJobCasual(String timeJobCasual) {
        this.timeJobCasual = timeJobCasual;
    }

    public String getPlaceOfTakeCare() {
        return placeOfTakeCare;
    }

    public void setPlaceOfTakeCare(String placeOfTakeCare) {
        this.placeOfTakeCare = placeOfTakeCare;
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

    public String getEducation() {
        return education;
    }

    public void setEducation(String education) {
        this.education = education;
    }

    public String getForeignLanguages() {
        return foreignLanguages;
    }

    public void setForeignLanguages(String foreignLanguages) {
        this.foreignLanguages = foreignLanguages;
    }
}
