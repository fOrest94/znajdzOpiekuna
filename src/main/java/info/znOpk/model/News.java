package info.znOpk.model;

import javax.persistence.*;
import javax.validation.constraints.NotNull;

/**
 * Created by DuduŚ on 2016-12-23.
 */

@Entity
@Table(name = "aktualnosci")
public class News {

    @Id
    @GeneratedValue
    @Column(name = "id")
    private Long id;

    @NotNull
    @Column(name = "tytul_aktualnosci")
    private String title;

    @NotNull
    @Column(name = "opis_aktualnosci")
    private String description;

    @NotNull
    @Column(name = "data_utworzenia")
    private String data;

    @Transient
    private File file;

    public News() {
        file = new File();
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getData() {
        return data;
    }

    public void setData(String data) {
        this.data = data;
    }

    public File getFile() {
        return file;
    }

    public void setFile(File file) {
        this.file = file;
    }

    @Override
    public String toString() {
        return "News{" +
                "id=" + id +
                ", title='" + title + '\'' +
                ", description='" + description + '\'' +
                ", data='" + data + '\'' +
                ", file=" + file +
                '}';
    }
}
