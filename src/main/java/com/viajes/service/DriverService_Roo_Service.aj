// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.viajes.service;

import com.viajes.entity.Driver;
import com.viajes.service.DriverService;
import java.util.List;

privileged aspect DriverService_Roo_Service {
    
    public abstract long DriverService.countAllDrivers();    
    public abstract void DriverService.deleteDriver(Driver driver);    
    public abstract Driver DriverService.findDriver(Long id);    
    public abstract List<Driver> DriverService.findAllDrivers();    
    public abstract List<Driver> DriverService.findDriverEntries(int firstResult, int maxResults);    
    public abstract void DriverService.saveDriver(Driver driver);    
    public abstract Driver DriverService.updateDriver(Driver driver);    
}
