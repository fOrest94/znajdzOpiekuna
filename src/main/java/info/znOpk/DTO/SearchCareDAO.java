package info.znOpk.DTO
        ;

import java.util.List;

/**
 * Created by DuduŚ on 2016-12-17.
 */
public class SearchCareDAO {

    private List<String> whatWannaCare;

    private String moneyPerHour;

    private String dateOfBirth;

    private String writeSthAboutYou;

    private Long userId;

    public SearchCareDAO() {

    }

    public SearchCareDAO(String id) {
        this.userId = Long.parseLong(id);
    }

    public List<String> getWhatWannaCare() {
        return whatWannaCare;
    }

    public void setWhatWannaCare(List<String> whatWannaCare) {
        this.whatWannaCare = whatWannaCare;
    }

    public String getMoneyPerHour() {
        return moneyPerHour;
    }

    public void setMoneyPerHour(String moneyPerHour) {
        this.moneyPerHour = moneyPerHour;
    }

    public String getWriteSthAboutYou() {
        return writeSthAboutYou;
    }

    public void setWriteSthAboutYou(String writeSthAboutYou) {
        this.writeSthAboutYou = writeSthAboutYou;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public String getDateOfBirth() {
        return dateOfBirth;
    }

    public void setDateOfBirth(String dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }

    @Override
    public String toString() {
        return "SearchCareDAO{" +
                "whatWannaCare=" + whatWannaCare +
                ", moneyPerHour='" + moneyPerHour + '\'' +
                ", writeSthAboutYou='" + writeSthAboutYou + '\'' +
                ", userId=" + userId +
                '}';
    }
}
