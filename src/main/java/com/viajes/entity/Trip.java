package com.viajes.entity;
import org.springframework.roo.addon.javabean.annotations.RooJavaBean;
import org.springframework.roo.addon.javabean.annotations.RooToString;
import org.springframework.roo.addon.jpa.annotations.activerecord.RooJpaActiveRecord;
import java.util.Calendar;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import org.springframework.format.annotation.DateTimeFormat;
import javax.persistence.ManyToOne;
import com.viajes.constants.TripState;
import javax.persistence.Enumerated;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.ManyToMany;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
public class Trip {

    /**
     */
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(style = "M-")
    private Calendar startDate;

    /**
     */
    private Integer numberOfSeats;

    /**
     */
    @ManyToOne
    private Destination destination;

    /**
     */
    @Enumerated
    private TripState tripState;

    /**
     */
    @ManyToMany(cascade = CascadeType.ALL)
    private List<Reservation> reservationList = new ArrayList<Reservation>();
}
