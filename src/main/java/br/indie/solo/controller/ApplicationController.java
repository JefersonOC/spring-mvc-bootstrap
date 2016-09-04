package br.indie.solo.controller;

import br.indie.solo.model.User;
import br.indie.solo.model.UserProfile;
import br.indie.solo.service.UserProfileService;
import br.indie.solo.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import java.util.List;

@Controller
public class ApplicationController {

    @Autowired
    UserProfileService userProfileService;

    @Autowired
    UserService service;

    @RequestMapping(value = {"/", "/home"}, method = RequestMethod.GET)
    public String homePage(ModelMap model) {
        model.addAttribute("greeting", "Hi, Welcome to mysite");
        return "welcome";
    }

    @RequestMapping(value = "/admin", method = RequestMethod.GET)
    public String adminPage(ModelMap model) {
        model.addAttribute("user", getPrincipal());
        return "admin/admin";
    }

    @RequestMapping(value = "/business", method = RequestMethod.GET)
    public String managerPage(ModelMap model) {
        model.addAttribute("user", getPrincipal());
        return "business/business";
    }

    @RequestMapping(value = "/user", method = RequestMethod.GET)
    public String userPage(ModelMap model) {
        model.addAttribute("user", getPrincipal());
        return "user/user";
    }

    @RequestMapping(value = "/about", method = RequestMethod.GET)
    public String aboutPage(ModelMap model) {
        model.addAttribute("user", getPrincipal());
        return "shared/about";
    }

    @RequestMapping(value = "/contact", method = RequestMethod.GET)
    public String contactPage(ModelMap model) {
        model.addAttribute("user", getPrincipal());
        return "shared/contact";
    }

    @RequestMapping(value = "/access_denied", method = RequestMethod.GET)
    public String accessDeniedPage(ModelMap model) {
        model.addAttribute("user", getPrincipal());
        return "shared/access_denied";
    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String loginPage() {
        return "login";
    }

    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public String logoutPage(HttpServletRequest request, HttpServletResponse response) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (auth != null) {
            new SecurityContextLogoutHandler().logout(request, response, auth);
        }
        return "redirect:/login?logout";
    }


    @RequestMapping(value = "/admin/new_user", method = RequestMethod.GET)
    public String newRegistration(ModelMap model) {
        User user = new User();
        model.addAttribute("user", user);
        return "admin/new_user";
    }

    @RequestMapping(value = "/users", method = RequestMethod.GET)
    public String listAllUsers(ModelMap model) {
        List<User> users = service.findAllUsers();
        model.addAttribute("users", users);
        return "admin/all_users";
    }

    /*
     * This method will be called on form submission, handling POST request It
     * also validates the user input
     */
    @RequestMapping(value = "/admin/new_user", method = RequestMethod.POST)
    public String saveRegistration(@Valid User user,
                                   BindingResult result,
                                   ModelMap model) {

        if (result.hasErrors()) {
            System.out.println("There are errors");
            return "admin/new_user";
        }
        service.save(user);

        System.out.println("First Name : " + user.getFirstName());
        System.out.println("Last Name : " + user.getLastName());
        System.out.println("SSO ID : " + user.getSsoId());
        System.out.println("Password : " + user.getPassword());
        System.out.println("Email : " + user.getEmail());
        System.out.println("Checking UsrProfiles....");
        if (user.getUserProfiles() != null) {
            for (UserProfile profile : user.getUserProfiles()) {
                System.out.println("Profile : " + profile.getType());
            }
        }

        model.addAttribute("success", "Usuário " + user.getFirstName() + "foi registrado com sucesso!");
        return "admin/registration_success";
    }


    private String getPrincipal() {
        String userName;
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();

        if (principal instanceof UserDetails) {
            userName = ((UserDetails) principal).getUsername();
        } else {
            userName = principal.toString();
        }
        return userName;
    }


    @ModelAttribute("roles")
    public List<UserProfile> initializeProfiles() {
        return userProfileService.findAll();
    }

}