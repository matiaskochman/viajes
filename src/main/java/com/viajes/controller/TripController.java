package com.viajes.controller;
import com.viajes.entity.Trip;
import org.springframework.roo.addon.web.mvc.controller.annotations.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/trips")
@Controller
@RooWebScaffold(path = "trips", formBackingObject = Trip.class)
public class TripController {
}
