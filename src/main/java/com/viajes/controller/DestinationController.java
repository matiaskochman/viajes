package com.viajes.controller;
import com.viajes.entity.Destination;
import org.springframework.roo.addon.web.mvc.controller.annotations.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/destinations")
@Controller
@RooWebScaffold(path = "destinations", formBackingObject = Destination.class)
public class DestinationController {
}
