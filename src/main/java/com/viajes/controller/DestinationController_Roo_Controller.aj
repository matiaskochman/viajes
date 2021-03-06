// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.viajes.controller;

import com.viajes.controller.DestinationController;
import com.viajes.entity.Destination;
import com.viajes.service.DestinationService;
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

privileged aspect DestinationController_Roo_Controller {
    
    @Autowired
    DestinationService DestinationController.destinationService;
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String DestinationController.create(@Valid Destination destination, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, destination);
            return "destinations/create";
        }
        uiModel.asMap().clear();
        destinationService.saveDestination(destination);
        return "redirect:/destinations/" + encodeUrlPathSegment(destination.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String DestinationController.createForm(Model uiModel) {
        populateEditForm(uiModel, new Destination());
        return "destinations/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String DestinationController.show(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("destination", destinationService.findDestination(id));
        uiModel.addAttribute("itemId", id);
        return "destinations/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String DestinationController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("destinations", Destination.findDestinationEntries(firstResult, sizeNo, sortFieldName, sortOrder));
            float nrOfPages = (float) destinationService.countAllDestinations() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("destinations", Destination.findAllDestinations(sortFieldName, sortOrder));
        }
        return "destinations/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String DestinationController.update(@Valid Destination destination, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, destination);
            return "destinations/update";
        }
        uiModel.asMap().clear();
        destinationService.updateDestination(destination);
        return "redirect:/destinations/" + encodeUrlPathSegment(destination.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String DestinationController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, destinationService.findDestination(id));
        return "destinations/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String DestinationController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        Destination destination = destinationService.findDestination(id);
        destinationService.deleteDestination(destination);
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/destinations";
    }
    
    void DestinationController.populateEditForm(Model uiModel, Destination destination) {
        uiModel.addAttribute("destination", destination);
    }
    
    String DestinationController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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
