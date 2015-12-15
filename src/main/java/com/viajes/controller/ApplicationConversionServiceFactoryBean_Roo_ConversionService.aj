// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.viajes.controller;

import com.viajes.controller.ApplicationConversionServiceFactoryBean;
import com.viajes.entity.Destination;
import com.viajes.entity.Driver;
import com.viajes.entity.Reservation;
import com.viajes.entity.Trip;
import com.viajes.service.DestinationService;
import com.viajes.service.DriverService;
import com.viajes.service.ReservationService;
import com.viajes.service.TripService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Configurable;
import org.springframework.core.convert.converter.Converter;
import org.springframework.format.FormatterRegistry;

privileged aspect ApplicationConversionServiceFactoryBean_Roo_ConversionService {
    
    declare @type: ApplicationConversionServiceFactoryBean: @Configurable;
    
    @Autowired
    DestinationService ApplicationConversionServiceFactoryBean.destinationService;
    
    @Autowired
    DriverService ApplicationConversionServiceFactoryBean.driverService;
    
    @Autowired
    ReservationService ApplicationConversionServiceFactoryBean.reservationService;
    
    @Autowired
    TripService ApplicationConversionServiceFactoryBean.tripService;
    
    public Converter<Long, Destination> ApplicationConversionServiceFactoryBean.getIdToDestinationConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, com.viajes.entity.Destination>() {
            public com.viajes.entity.Destination convert(java.lang.Long id) {
                return destinationService.findDestination(id);
            }
        };
    }
    
    public Converter<String, Destination> ApplicationConversionServiceFactoryBean.getStringToDestinationConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, com.viajes.entity.Destination>() {
            public com.viajes.entity.Destination convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), Destination.class);
            }
        };
    }
    
    public Converter<Driver, String> ApplicationConversionServiceFactoryBean.getDriverToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<com.viajes.entity.Driver, java.lang.String>() {
            public String convert(Driver driver) {
                return new StringBuilder().append(driver.getName()).append(' ').append(driver.getSurname()).append(' ').append(driver.getPhone1()).append(' ').append(driver.getPhone2()).toString();
            }
        };
    }
    
    public Converter<Long, Driver> ApplicationConversionServiceFactoryBean.getIdToDriverConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, com.viajes.entity.Driver>() {
            public com.viajes.entity.Driver convert(java.lang.Long id) {
                return driverService.findDriver(id);
            }
        };
    }
    
    public Converter<String, Driver> ApplicationConversionServiceFactoryBean.getStringToDriverConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, com.viajes.entity.Driver>() {
            public com.viajes.entity.Driver convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), Driver.class);
            }
        };
    }
    
    public Converter<Reservation, String> ApplicationConversionServiceFactoryBean.getReservationToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<com.viajes.entity.Reservation, java.lang.String>() {
            public String convert(Reservation reservation) {
                return new StringBuilder().append(reservation.getName()).append(' ').append(reservation.getReservationDate()).append(' ').append(reservation.getNumberOfSeats()).toString();
            }
        };
    }
    
    public Converter<Long, Reservation> ApplicationConversionServiceFactoryBean.getIdToReservationConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, com.viajes.entity.Reservation>() {
            public com.viajes.entity.Reservation convert(java.lang.Long id) {
                return reservationService.findReservation(id);
            }
        };
    }
    
    public Converter<String, Reservation> ApplicationConversionServiceFactoryBean.getStringToReservationConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, com.viajes.entity.Reservation>() {
            public com.viajes.entity.Reservation convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), Reservation.class);
            }
        };
    }
    
    public Converter<Long, Trip> ApplicationConversionServiceFactoryBean.getIdToTripConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, com.viajes.entity.Trip>() {
            public com.viajes.entity.Trip convert(java.lang.Long id) {
                return tripService.findTrip(id);
            }
        };
    }
    
    public Converter<String, Trip> ApplicationConversionServiceFactoryBean.getStringToTripConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, com.viajes.entity.Trip>() {
            public com.viajes.entity.Trip convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), Trip.class);
            }
        };
    }
    
    public void ApplicationConversionServiceFactoryBean.installLabelConverters(FormatterRegistry registry) {
        registry.addConverter(getDestinationToStringConverter());
        registry.addConverter(getIdToDestinationConverter());
        registry.addConverter(getStringToDestinationConverter());
        registry.addConverter(getDriverToStringConverter());
        registry.addConverter(getIdToDriverConverter());
        registry.addConverter(getStringToDriverConverter());
        registry.addConverter(getReservationToStringConverter());
        registry.addConverter(getIdToReservationConverter());
        registry.addConverter(getStringToReservationConverter());
        registry.addConverter(getTripToStringConverter());
        registry.addConverter(getIdToTripConverter());
        registry.addConverter(getStringToTripConverter());
    }
    
    public void ApplicationConversionServiceFactoryBean.afterPropertiesSet() {
        super.afterPropertiesSet();
        installLabelConverters(getObject());
    }
    
}
