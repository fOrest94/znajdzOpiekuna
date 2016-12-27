package info.znOpk.model;

import javax.persistence.*;
import javax.validation.constraints.NotNull;

/**
 * Created by DuduŚ on 2016-12-25.
 */

@Entity
@Table(name = "wiadomosci")
public class Message {

    @Id
    @GeneratedValue
    @Column(name = "id")
    private Long id;

    @NotNull
    @Column(name = "id_nadawcy")
    private Long idSender;

    @NotNull
    @Column(name = "id_odbiorcy")
    private Long idRecipient;

    @NotNull
    @Column(name = "tytul_wiadomosci")
    private String message_title;

    @NotNull
    @Column(name = "tresc_wiadomosci")
    private String message_description;

    @NotNull
    @Column(name = "data_utworzenia")
    private String data;

    @NotNull
    @Column(name = "odebrana")
    private int received = 0;

    @Transient
    private String firstName;

    @Transient
    private String lastName;

    @Transient
    private String email;

    public Message() {
    }

    public Message(Long idSender) {
        this.idSender = idSender;
    }

    public Message(Long idSender, Long idRecipient) {
        this.idSender = idSender;
        this.idRecipient = idRecipient;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getIdSender() {
        return idSender;
    }

    public void setIdSender(Long idSender) {
        this.idSender = idSender;
    }

    public Long getIdRecipient() {
        return idRecipient;
    }

    public void setIdRecipient(Long idRecipient) {
        this.idRecipient = idRecipient;
    }

    public String getMessage_title() {
        return message_title;
    }

    public void setMessage_title(String message_title) {
        this.message_title = message_title;
    }

    public String getMessage_description() {
        return message_description;
    }

    public void setMessage_description(String message_description) {
        this.message_description = message_description;
    }

    public String getData() {
        return data;
    }

    public void setData(String data) {
        this.data = data;
    }

    public int getReceived() {
        return received;
    }

    public void setReceived(int received) {
        this.received = received;
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

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }


}
