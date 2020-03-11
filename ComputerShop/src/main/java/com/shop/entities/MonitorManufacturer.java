/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.shop.entities;

import java.io.Serializable;
import java.util.Collection;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author frodi
 */
@Entity
@Table(name = "monitor_manufacturer")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "MonitorManufacturer.findAll", query = "SELECT m FROM MonitorManufacturer m ORDER BY m.name")
    , @NamedQuery(name = "MonitorManufacturer.findById", query = "SELECT m FROM MonitorManufacturer m WHERE m.id = :id")
    , @NamedQuery(name = "MonitorManufacturer.findByName", query = "SELECT m FROM MonitorManufacturer m WHERE m.name = :name")})
public class MonitorManufacturer implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Size(max = 30)
    @Column(name = "name")
    private String name;
    @OneToMany(mappedBy = "manufacturer")
    private Collection<Monitor> towerCollection;

    public MonitorManufacturer() {
    }

    public MonitorManufacturer(Integer id) {
        this.id = id;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof MonitorManufacturer)) {
            return false;
        }
        MonitorManufacturer other = (MonitorManufacturer) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return this.name;
    }
    
}
