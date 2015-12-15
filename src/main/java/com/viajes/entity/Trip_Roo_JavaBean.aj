// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.viajes.entity;

import com.viajes.constants.TripState;
import com.viajes.entity.Destination;
import com.viajes.entity.Reservation;
import com.viajes.entity.Trip;
import java.util.Calendar;
import java.util.List;

privileged aspect Trip_Roo_JavaBean {
    
    public Calendar Trip.getStartDate() {
        return this.startDate;
    }
    
    public void Trip.setStartDate(Calendar startDate) {
        this.startDate = startDate;
    }
    
    public Integer Trip.getNumberOfSeats() {
        return this.numberOfSeats;
    }
    
    public void Trip.setNumberOfSeats(Integer numberOfSeats) {
        this.numberOfSeats = numberOfSeats;
    }
    
    public Destination Trip.getDestination() {
        return this.destination;
    }
    
    public void Trip.setDestination(Destination destination) {
        this.destination = destination;
    }
    
    public TripState Trip.getTripState() {
        return this.tripState;
    }
    
    public void Trip.setTripState(TripState tripState) {
        this.tripState = tripState;
    }
    
    public List<Reservation> Trip.getReservationList() {
        return this.reservationList;
    }
    
    public void Trip.setReservationList(List<Reservation> reservationList) {
        this.reservationList = reservationList;
    }
    
}
