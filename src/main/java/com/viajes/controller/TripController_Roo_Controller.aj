// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.viajes.controller;

import com.viajes.constants.TripState;
import com.viajes.controller.TripController;
import com.viajes.entity.Trip;
import com.viajes.service.DestinationService;
import com.viajes.service.ReservationService;
import com.viajes.service.TripService;
import java.io.UnsupportedEncodingException;
import java.util.Arrays;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.joda.time.format.DateTimeFormat;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

privileged aspect TripController_Roo_Controller {
    
    @Autowired
    TripService TripController.tripService;
    
    @Autowired
    DestinationService TripController.destinationService;
    
    @Autowired
    ReservationService TripController.reservationService;
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String TripController.create(@Valid Trip trip, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, trip);
            return "trips/create";
        }
        uiModel.asMap().clear();
        tripService.saveTrip(trip);
        return "redirect:/trips/" + encodeUrlPathSegment(trip.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String TripController.createForm(Model uiModel) {
        populateEditForm(uiModel, new Trip());
        return "trips/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String TripController.show(@PathVariable("id") Long id, Model uiModel) {
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("trip", tripService.findTrip(id));
        uiModel.addAttribute("itemId", id);
        return "trips/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String TripController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("trips", Trip.findTripEntries(firstResult, sizeNo, sortFieldName, sortOrder));
            float nrOfPages = (float) tripService.countAllTrips() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("trips", Trip.findAllTrips(sortFieldName, sortOrder));
        }
        addDateTimeFormatPatterns(uiModel);
        return "trips/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String TripController.update(@Valid Trip trip, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, trip);
            return "trips/update";
        }
        uiModel.asMap().clear();
        tripService.updateTrip(trip);
        return "redirect:/trips/" + encodeUrlPathSegment(trip.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String TripController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, tripService.findTrip(id));
        return "trips/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String TripController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        Trip trip = tripService.findTrip(id);
        tripService.deleteTrip(trip);
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/trips";
    }
    
    void TripController.addDateTimeFormatPatterns(Model uiModel) {
        uiModel.addAttribute("trip_startdate_date_format", DateTimeFormat.patternForStyle("M-", LocaleContextHolder.getLocale()));
    }
    
    void TripController.populateEditForm(Model uiModel, Trip trip) {
        uiModel.addAttribute("trip", trip);
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("tripstates", Arrays.asList(TripState.values()));
        uiModel.addAttribute("destinations", destinationService.findAllDestinations());
        uiModel.addAttribute("reservations", reservationService.findAllReservations());
    }
    
    String TripController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
        String enc = httpServletRequest.getCharacterEncoding();
        if (enc == null) {
            enc = WebUtils.DEFAULT_CHARACTER_ENCODING;
        }
        try {
            pathSegment = UriUtils.encodePathSegment(pathSegment, enc);
        } catch (UnsupportedEncodingException uee) {}
        return pathSegment;
    }
    
}
