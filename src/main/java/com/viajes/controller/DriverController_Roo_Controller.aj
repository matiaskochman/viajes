// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.viajes.controller;

import com.viajes.controller.DriverController;
import com.viajes.entity.Driver;
import com.viajes.service.DriverService;
import java.io.UnsupportedEncodingException;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

privileged aspect DriverController_Roo_Controller {
    
    @Autowired
    DriverService DriverController.driverService;
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String DriverController.create(@Valid Driver driver, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, driver);
            return "drivers/create";
        }
        uiModel.asMap().clear();
        driverService.saveDriver(driver);
        return "redirect:/drivers/" + encodeUrlPathSegment(driver.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String DriverController.createForm(Model uiModel) {
        populateEditForm(uiModel, new Driver());
        return "drivers/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String DriverController.show(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("driver", driverService.findDriver(id));
        uiModel.addAttribute("itemId", id);
        return "drivers/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String DriverController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("drivers", Driver.findDriverEntries(firstResult, sizeNo, sortFieldName, sortOrder));
            float nrOfPages = (float) driverService.countAllDrivers() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("drivers", Driver.findAllDrivers(sortFieldName, sortOrder));
        }
        return "drivers/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String DriverController.update(@Valid Driver driver, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, driver);
            return "drivers/update";
        }
        uiModel.asMap().clear();
        driverService.updateDriver(driver);
        return "redirect:/drivers/" + encodeUrlPathSegment(driver.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String DriverController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, driverService.findDriver(id));
        return "drivers/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String DriverController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        Driver driver = driverService.findDriver(id);
        driverService.deleteDriver(driver);
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/drivers";
    }
    
    void DriverController.populateEditForm(Model uiModel, Driver driver) {
        uiModel.addAttribute("driver", driver);
    }
    
    String DriverController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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
