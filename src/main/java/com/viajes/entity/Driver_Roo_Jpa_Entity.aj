// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.viajes.entity;

import com.viajes.entity.Driver;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Version;

privileged aspect Driver_Roo_Jpa_Entity {
    
    declare @type: Driver: @Entity;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long Driver.id;
    
    @Version
    @Column(name = "version")
    private Integer Driver.version;
    
    public Long Driver.getId() {
        return this.id;
    }
    
    public void Driver.setId(Long id) {
        this.id = id;
    }
    
    public Integer Driver.getVersion() {
        return this.version;
    }
    
    public void Driver.setVersion(Integer version) {
        this.version = version;
    }
    
}
