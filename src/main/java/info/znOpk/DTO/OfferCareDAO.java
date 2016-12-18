package info.znOpk.DTO;


import java.util.List;

/**
 * Created by DuduŚ on 2016-12-18.
 */
public class OfferCareDAO {

    private Long userId;

    private String dataOfBirth;

    private int age;

    private List<String> whatWannaCare;

    private List<String> otherActivities;

    private String otherSkills;

    private String writeSthAboutYou;

    private List<String> careExperience;

    private String experienceKidsTime;

    private String experienceOldTime;

    private String timeJobTime;

    private String placeOfTakeCare;

    private String workWithHome;

    private String moneyPerHour;

    private String education;

    private String foreignLanguages;

    public OfferCareDAO() {
    }

    public OfferCareDAO(Long userId) {
        this.userId = userId;
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

    public List<String> getWhatWannaCare() {
        return whatWannaCare;
    }

    public void setWhatWannaCare(List<String> whatWannaCare) {
        this.whatWannaCare = whatWannaCare;
    }

    public List<String> getOtherActivities() {
        return otherActivities;
    }

    public void setOtherActivities(List<String> otherActivities) {
        this.otherActivities = otherActivities;
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

    public List<String> getCareExperience() {
        return careExperience;
    }

    public void setCareExperience(List<String> careExperience) {
        this.careExperience = careExperience;
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

    public String getTimeJobTime() {
        return timeJobTime;
    }

    public void setTimeJobTime(String timeJobTime) {
        this.timeJobTime = timeJobTime;
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

    @Override
    public String toString() {
        return "OfferCareDAO{" +
                "userId=" + userId +
                ", dataOfBirth='" + dataOfBirth + '\'' +
                ", age=" + age +
                ", whatWannaCare=" + whatWannaCare +
                ", otherActivities=" + otherActivities +
                ", otherSkills='" + otherSkills + '\'' +
                ", writeSthAboutYou='" + writeSthAboutYou + '\'' +
                ", careExperience='" + careExperience + '\'' +
                ", experienceKidsTime='" + experienceKidsTime + '\'' +
                ", experienceOldTime='" + experienceOldTime + '\'' +
                ", timeJobTime='" + timeJobTime + '\'' +
                ", placeOfTakeCare='" + placeOfTakeCare + '\'' +
                ", workWithHome='" + workWithHome + '\'' +
                ", moneyPerHour='" + moneyPerHour + '\'' +
                ", education='" + education + '\'' +
                ", foreignLanguages='" + foreignLanguages + '\'' +
                '}';
    }
}
