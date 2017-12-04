/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.facom.csrepo.model;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author jose
 */
@Entity
@Table(name = "Conference")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Conference.findAll", query = "SELECT c FROM Conference c")
    , @NamedQuery(name = "Conference.findByid", query = "SELECT c FROM Conference c WHERE c.id = :id")
    , @NamedQuery(name = "Conference.findByacronym", query = "SELECT c FROM Conference c WHERE c.acronym = :acronym")
    , @NamedQuery(name = "Conference.findByname", query = "SELECT c FROM Conference c WHERE c.name = :name")})
public class Conference implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @SequenceGenerator(name = "id_conference_seq", sequenceName = "conference_id_conference_seq", allocationSize = 1)
    @GeneratedValue(generator = "id_conference_seq")
    @Basic(optional = false)
    @Column(name = "id_conference")
    private Integer id;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 10)
    @Column(name = "acronym_conference")
    private String acronym;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 255)
    @Column(name = "name_conference")
    public String name;
//    @OneToMany(cascade = CascadeType.ALL)
//    @JoinColumn(name = "id_Conference")
//    private List<Edition> editions;

    public Conference() {
    }

    public Conference(Integer id) {
        this.id = id;
    }

    public Conference(String acronym, String name) {
        this.acronym = acronym;
        this.name = name;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getAcronym() {
        return acronym;
    }

    public void setAcronym(String acronym) {
        this.acronym = acronym;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    // TODO: Create method to add edition from list
    // TODO: Create method to remove edition from list
//    public List<Edition> getEditions() {
//        return editions;
//    }
//
//    public void setEditions(List<Edition> editions) {
//        this.editions = editions;
//    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Conference)) {
            return false;
        }
        Conference other = (Conference) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.facom.csrepo.model.Conference[ id=" + id + " ]";
    }
    
}
