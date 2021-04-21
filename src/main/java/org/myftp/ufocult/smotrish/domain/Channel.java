package org.myftp.ufocult.smotrish.domain;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.Range;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

@Entity
public class Channel {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @NotBlank(message = "Please name the channel")
    @Length(max = 255, message = "Name too long")
    private String name;
    @NotNull(message = "Number the channel")
    private Integer number;
    private String filename;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "user_id")
    private User subc;

    public Channel() {
    }

    public Channel(String name, Integer number, User user) {
        this.name = name;
        this.number = number;
        this.subc = user;

    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getNumber() {
        return number;
    }

    public void setNumber(Integer number) {
        this.number = number;
    }

    public String getFilename() {
        return filename;
    }

    public void setFilename(String filename) {
        this.filename = filename;
    }

    public User getSubc() {
        return subc;
    }

    public void setSubc(User subc) {
        this.subc = subc;
    }

}
