package info.znOpk.DTO;

public class NannyDTO {

	private String username;
	private String password;
	private String passwordConfirm;
	private boolean enabled = true;
	private String firstName;
	private String lastName;
	private String userType="sister";
	private String town="Jasło";
	private boolean sex;
	private String zipCode;
	private String dataOfBirth="05-06-1996";
	// TWOJ PROFIL
	private boolean whoWannCareNanny=true;
	private boolean whoWannCareOld=false;
	private boolean otherActClean=true;
	private boolean otherActCook=false;
	private boolean otherActShop=true;
	private boolean otherActVac=false;
	private String otherSkills="koszenie trawy";
	private String writeSthAboutYou="jestem uboga";
	// PRACA
	private boolean careExpKids=true;
	private boolean careExpOld=false;
	private String experienceKidsTime="0.0";
	private String experienceOldTime="0.0";
	private boolean timeJobHalf=true;
	private boolean timeJobFull=false;
	private boolean timeJobCasual=false;
	// MIEJSCE PRACY
	private Integer placeOfTakeCare=1;
	private boolean workWithHome=true;
	private String moneyPerHour="9";
	// WYKRZTA�CENIE
	private String education="burdel";
	private String foreignLanguages="bułgarski";

	public String getTown() {return town;}

	public void setTown(String town) {this.town = town;}

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

	public void setPasswordConfirm(String passwordConfirm) {
		this.passwordConfirm = passwordConfirm;
	}

	public boolean isEnabled() {
		return enabled;
	}

	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
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

	public String getDataOfBirth() {
		return dataOfBirth;
	}

	public void setDataOfBirth(String dataOfBirth) {
		this.dataOfBirth = dataOfBirth;
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
