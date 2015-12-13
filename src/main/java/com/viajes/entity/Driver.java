package com.viajes.entity;
import org.springframework.roo.addon.javabean.annotations.RooJavaBean;
import org.springframework.roo.addon.javabean.annotations.RooToString;
import org.springframework.roo.addon.jpa.annotations.activerecord.RooJpaActiveRecord;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
public class Driver {

    /**
     */
    private String name;

    /**
     */
    private String surname;

    /**
     */
    private String phone1;

    /**
     */
    private String phone2;
}
