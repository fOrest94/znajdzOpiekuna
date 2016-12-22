package info.znOpk.DTO;

/**
 * Created by DuduŚ on 2016-12-16.
 */
public class SearchForm {

    private String username="";
    private String address;
    private Integer typeOfUser;
    private String addressType;


    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Integer getTypeOfUser() {
        return typeOfUser;
    }

    public void setTypeOfUser(Integer typeOfUser) {
        this.typeOfUser = typeOfUser;
    }

    public String getAddressType() {
        return addressType;
    }

    public void setAddressType(String addressType) {
        this.addressType = addressType;
    }

    @Override
    public String toString() {
        return "SearchForm{" +
                "username='" + username + '\'' +
                ", address='" + address + '\'' +
                ", typeOfUser='" + typeOfUser + '\'' +
                ", addressType='" + addressType + '\'' +
                '}';
    }
}
