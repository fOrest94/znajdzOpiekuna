package info.znOpk.repository;

import info.znOpk.model.OfferCare;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import javax.transaction.Transactional;

/**
 * Created by DuduŚ on 2016-12-13.
 */
public interface OfferCareRepository extends JpaRepository<OfferCare, Long> {
    OfferCare findByUserId(Long id);

    @Transactional
    @Modifying
    @Query("update OfferCare u set u.dataOfBirth = ?1, u.whoWannCareNanny = ?2, u.whoWannCareOld = ?3, u.otherActClean = ?4, u.otherActCook = ?5," +
            " u.otherActShop = ?6, u.otherActVac = ?7, u.otherSkills = ?8, u.writeSthAboutYou = ?9, u.careExpKids = ?10, u.careExpOld = ?11," +
            "u.experienceKidsTime = ?12, u.experienceOldTime = ?13, u.timeJobHalf = ?14, u.timeJobFull = ?15, u.timeJobCasual = ?16, u.placeOfTakeCare = ?17" +
            ", u.workWithHome = ?18, u. moneyPerHour = ?19, u.education = ?20, u.foreignLanguages = ?21 where u.userId = ?22")
    void setOfferCareById(String dataOfBirth, String whoWannCareNanny, String whoWannCareOld, String otherActClean, String otherActCook,
                          String otherActShop, String otherActVac, String otherSkills, String writeSthAboutYou, String careExpKids,
                          String careExpOld, String experienceKidsTime, String experienceOldTime, String timeJobHalf, String timeJobFull,
                          String timeJobCasual, String placeOfTakeCare, String workWithHome, String moneyPerHour, String education,
                          String foreignLanguages, Long userId);
}