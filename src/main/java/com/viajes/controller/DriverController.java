package com.viajes.controller;
import com.viajes.entity.Driver;
import org.springframework.roo.addon.web.mvc.controller.annotations.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/drivers")
@Controller
@RooWebScaffold(path = "drivers", formBackingObject = Driver.class)
public class DriverController {
}
