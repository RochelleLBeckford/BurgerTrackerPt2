package com.rochelle.burger_tracker_pt2.controllers;
//? Pair Programming -> Dominic Basa
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.rochelle.burger_tracker_pt2.models.Burger;
import com.rochelle.burger_tracker_pt2.services.BurgerService;

@Controller
public class MainController {
    // the last step is the controller and it uses the service
    // now will get all my burgers from my DB -> go to DB and create some 
    // now DB has some burgers in it -> use my service to access my burgers 
    // connects the service to the controller
    @Autowired BurgerService burgerService;


    //CRUD -> create, read, update, delete
    //& CREATE &
    /* 
    ? want to create a burger -> need 2 routes 
    -> one for the submission 
    -> one for the redirect  
    */
    
    @RequestMapping("/burgers/new") 
    // if do this will have to modify new.jsp
    public String newBurger(@ModelAttribute("burger")Burger burger){
        return "new.jsp";
    } 

    //? Instead of taking RequestParams will pass in actual burger 
    // the form will be filled out
    // spring will make the burger for us 
    // then send it back to the controller 
    // ~ need to use the @ModelAttribute in line 50 to do this 
    // need a handler for the form 

    //? Can change from RequestMapping to PostMapping which is a shorter method -> less to rememeber
    // it is the same as the above
    // this is the route that handles my burger
    @PostMapping("/burgers")
    // need @ valid to also check errors 
    // then need @model attributes
    // then need binding result

    /* 
    ~ this is much cleaner
    -> set up the ModelAttribute 
    -> pass in the empty burger, once it gets to the new.jsp 
    -> it gives the form a burger to work with -> makes burger on the fly 
    -> once get back to controller 
    -> pass it to our burger service
    
    */
    public String create(@Valid @ModelAttribute("burger")Burger burger, BindingResult result) {
        if (result.hasErrors()) {
            return "index.jsp";
        } else {
            // we want to make a burger
            burgerService.createBurger(burger);
        }
        return "redirect:/";
    }


    //? For read -> read one and read all 
    //& READ ALL & 
    // -> usually root of app is the read all 
    /* 
    ~ on index page ~
    -> want to loop through on the index page and whatever burgers are in my list of burgers i want to store them on the index page
    -> want to have a table of all the data
    -> want to store the burgers I have created
    -> send my whole burgers array and send them to my index page
    -> take array of burgers and send down to my index.jsp -> need to import model to send data to my template -> import org.springframework.ui.Model;
    -> to see if this works go to index page andn <c:out />  the array of burgers 
    */
    // this route iis both create/read all
    // create our model that is going to track all the data 
    @RequestMapping("/")
    public String index(@ModelAttribute("burger")Burger burger, Model model) {
        List<Burger> burgers = burgerService.getAllBurgers();
        System.out.println(burgers);
        model.addAttribute("burgers", burgers);
        return "index.jsp";
    }


    //& READ ONE &
        /* 
    -> when do this show.jsp should have access to one burger at the specified index
    -> have one burger object that is being passed down to jsp
    attributes can be individual strings, they can be burgers, they can be whatever you want to pass down
    -> want to click on one of these titles and have it take me to a show page
    -> can use request mapping or get mapping 
    */
    @GetMapping("/burgers/{id}")
    // -> now just need to call the method created in service to read one 
    // get variables that live in the url -> Path Variable
    public String show(@PathVariable("id")Long id, Model model) {
        // need to get my burger to my show page -> link data in my controller to my template -> Model model
        Burger burger = burgerService.getOneBurger(id);
        model.addAttribute("burger", burger);
        return "show.jsp";
    }


    //& UPDATE & 
    /* 
    putting stuff on my DB -> 2 routes
    -> one to display the form and one to handle the form 
    */
    @GetMapping("/burgers/edit/{id}")
    public String edit(@PathVariable("id")Long id, Model model) {
        // the edit page is often similar to the new page so copy it and change a few things
        // samething as read one since need to view one burger to edit it
        // so can use that code as well
        Burger burger = burgerService.getOneBurger(id);
        model.addAttribute("burger", burger);
        return "edit.jsp";
    }

    /* 
    -> need to make a route for the edit
    */

    @PutMapping("/burgers/{id}")
    // now need a service 
    public String update(@ModelAttribute("burger")Burger burger) {
        burgerService.updateBurger(burger);
        return "redirect:/";
    }


        //& DELETE & 
    @DeleteMapping("/burgers/{id}")
    // want to delete whatever burger has this variable 
    public String obliterateBurger(@PathVariable("id")Long id) {
        // need to find the burger 1st that has that id
        Burger burger = burgerService.getOneBurger(id);
        // once have id -> delete burger by id and pass in id
        burgerService.deleteBurger(burger);
        // no where else to go after delete burger -> no show page for that burger
        return "redirect:/";
    }
}
