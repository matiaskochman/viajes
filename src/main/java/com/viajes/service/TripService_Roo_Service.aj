// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.viajes.service;

import com.viajes.entity.Trip;
import com.viajes.service.TripService;
import java.util.List;

privileged aspect TripService_Roo_Service {
    
    public abstract long TripService.countAllTrips();    
    public abstract void TripService.deleteTrip(Trip trip);    
    public abstract Trip TripService.findTrip(Long id);    
    public abstract List<Trip> TripService.findAllTrips();    
    public abstract List<Trip> TripService.findTripEntries(int firstResult, int maxResults);    
    public abstract void TripService.saveTrip(Trip trip);    
    public abstract Trip TripService.updateTrip(Trip trip);    
}