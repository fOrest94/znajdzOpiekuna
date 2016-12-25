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
    private Long id_sender;

    @NotNull
    @Column(name = "id_odbiorcy")
    private Long id_recipient;

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
    private int received=0;

    public Message() {
    }

    public Message(Long id_sender, Long id_recipient) {
        this.id_sender = id_sender;
        this.id_recipient = id_recipient;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getId_sender() {
        return id_sender;
    }

    public void setId_sender(Long id_sender) {
        this.id_sender = id_sender;
    }

    public Long getId_recipient() {
        return id_recipient;
    }

    public void setId_recipient(Long id_recipient) {
        this.id_recipient = id_recipient;
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

    @Override
    public String toString() {
        return "Message{" +
                "id=" + id +
                ", id_sender=" + id_sender +
                ", id_recipient=" + id_recipient +
                ", message_title='" + message_title + '\'' +
                ", message_description='" + message_description + '\'' +
                ", data='" + data + '\'' +
                ", received=" + received +
                '}';
    }
}
