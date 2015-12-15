package com.viajes.controller;

import org.springframework.core.convert.converter.Converter;
import org.springframework.format.FormatterRegistry;
import org.springframework.format.support.FormattingConversionServiceFactoryBean;
import org.springframework.roo.addon.web.mvc.controller.annotations.converter.RooConversionService;

import com.viajes.entity.Destination;
import com.viajes.entity.Trip;

/**
 * A central place to register application converters and formatters. 
 */
@RooConversionService
public class ApplicationConversionServiceFactoryBean extends FormattingConversionServiceFactoryBean {

	@Override
	protected void installFormatters(FormatterRegistry registry) {
		super.installFormatters(registry);
		// Register application converters and formatters
	}
    public Converter<Trip, String> getTripToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<com.viajes.entity.Trip, java.lang.String>() {
            public String convert(Trip trip) {
                return new StringBuilder().append(trip.getDestination()).toString();
            }
        };
    }
	
    public Converter<Destination, String> getDestinationToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<com.viajes.entity.Destination, java.lang.String>() {
            public String convert(Destination destination) {
                return new StringBuilder().append(destination.getName()).toString();
            }
        };
    }    
}
