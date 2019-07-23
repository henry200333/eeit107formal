package org.iii.seaotter.jayee.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ErrorPageController {
	
    @GetMapping("/403")
    public String badRequest() {
        return "error/403";
    }
    @GetMapping("/404")
    public String notFound() {
        return "error/404";
    }
    @GetMapping("/500")
    public String serverError() {
        return "error/500";
    }
}
