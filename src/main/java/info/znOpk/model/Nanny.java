package info.znOpk.model;

import javax.persistence.*;
import javax.validation.constraints.NotNull;

@Entity
@Table(name = "opiekun")
public class Nanny {

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

	@NotNull
	@Column(name = "opieka_niania")
	private boolean whoWannCareNanny;

	@NotNull
	@Column(name = "opieka_starsi")
	private boolean whoWannCareOld;

	@NotNull
	@Column(name = "umiej_sprzat")
	private boolean otherActClean;

	@NotNull
	@Column(name = "umiej_gotowa")
	private boolean otherActCook;
	@NotNull
	@Column(name = "umiej_zakup")
	private boolean otherActShop;
	@NotNull
	@Column(name = "umiej_prac")
	private boolean otherActVac;
	@NotNull
	@Column(name = "inne_umiejetnosci")
	private String otherSkills;
	@NotNull
	@Column(name = "cos_o_sobie")
	private String writeSthAboutYou;
	@NotNull
	@Column(name = "doswiadczenie_dzieci")
	private boolean careExpKids;
	@NotNull
	@Column(name = "doswiadczenie_starsi")
	private boolean careExpOld;
	@NotNull
	@Column(name = "lat_dosw_dzieci")
	private String experienceKidsTime;
	@NotNull
	@Column(name = "lat_dosw_starsi")
	private String experienceOldTime;
	@NotNull
	@Column(name = "wymiar_pol_etatu")
	private boolean timeJobHalf;
	@NotNull
	@Column(name = "wymiar_pelny_etat")
	private boolean timeJobFull;
	@NotNull
	@Column(name = "wymiar_dorywczo")
	private boolean timeJobCasual;
	@NotNull
	@Column(name = "miejsce_opieki")
	private Integer placeOfTakeCare;
	@NotNull
	@Column(name = "praca_z_domem")
	private boolean workWithHome;
	@NotNull
	@Column(name = "wynagrodzenie")
	private String moneyPerHour;
	@NotNull
	@Column(name = "wyksztalcenie")
	private String education;
	@NotNull
	@Column(name = "jezyki_obce")
	private String foreignLanguages;

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

	public boolean isWhoWannCareNanny() {
		return whoWannCareNanny;
	}

	public void setWhoWannCareNanny(boolean whoWannCareNanny) {
		this.whoWannCareNanny = whoWannCareNanny;
	}

	public boolean isWhoWannCareOld() {
		return whoWannCareOld;
	}

	public void setWhoWannCareOld(boolean whoWannCareOld) {
		this.whoWannCareOld = whoWannCareOld;
	}

	public boolean isOtherActClean() {
		return otherActClean;
	}

	public void setOtherActClean(boolean otherActClean) {
		this.otherActClean = otherActClean;
	}

	public boolean isOtherActCook() {
		return otherActCook;
	}

	public void setOtherActCook(boolean otherActCook) {
		this.otherActCook = otherActCook;
	}

	public boolean isOtherActShop() {
		return otherActShop;
	}

	public void setOtherActShop(boolean otherActShop) {
		this.otherActShop = otherActShop;
	}

	public boolean isOtherActVac() {
		return otherActVac;
	}

	public void setOtherActVac(boolean otherActVac) {
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

	public boolean isCareExpKids() {
		return careExpKids;
	}

	public void setCareExpKids(boolean careExpKids) {
		this.careExpKids = careExpKids;
	}

	public boolean isCareExpOld() {
		return careExpOld;
	}

	public void setCareExpOld(boolean careExpOld) {
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

	public boolean isTimeJobHalf() {
		return timeJobHalf;
	}

	public void setTimeJobHalf(boolean timeJobHalf) {
		this.timeJobHalf = timeJobHalf;
	}

	public boolean isTimeJobFull() {
		return timeJobFull;
	}

	public void setTimeJobFull(boolean timeJobFull) {
		this.timeJobFull = timeJobFull;
	}

	public boolean isTimeJobCasual() {
		return timeJobCasual;
	}

	public void setTimeJobCasual(boolean timeJobCasual) {
		this.timeJobCasual = timeJobCasual;
	}

	public Integer getPlaceOfTakeCare() {
		return placeOfTakeCare;
	}

	public void setPlaceOfTakeCare(Integer placeOfTakeCare) {
		this.placeOfTakeCare = placeOfTakeCare;
	}

	public boolean isWorkWithHome() {
		return workWithHome;
	}

	public void setWorkWithHome(boolean workWithHome) {
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
