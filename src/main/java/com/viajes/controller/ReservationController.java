package com.viajes.controller;
import com.viajes.entity.Reservation;
import org.springframework.roo.addon.web.mvc.controller.annotations.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/reservations")
@Controller
@RooWebScaffold(path = "reservations", formBackingObject = Reservation.class)
public class ReservationController {
}
