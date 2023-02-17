package com.rochelle.burger_tracker_pt2.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rochelle.burger_tracker_pt2.models.Burger;
import com.rochelle.burger_tracker_pt2.repositories.BurgerRepository;

/* 
~ -> all Business Logic goes here -> methods 
-> designate this as a @Service -> contains all our business logic
-> the BurgerService uses the repository
-> this makes a file a service in spring
-> how to tell the service about the burgerrepsitory that it can use -> autowired
*/
@Service
public class BurgerService {
    // -> the connection to our Repository and the service
    // -> allows spring to access all the data in out burgerrepository
    @Autowired BurgerRepository burgerRepository;


    //^ CREATE
    /* 
    -> want to pass in a burger -> create a varibale in java have to say what it is going to be 
    -> burger is a param 
    -> Burger is saying that this param is going to be a burger object
    */
    public void createBurger(Burger burger) {
        // -> taking in whatever param gets passed in then pass it on to save
        burgerRepository.save(burger);
    }


    //^ READ ALL
    /* 
    -> this is where we put our business logic
    -> once connected to the BurgerRepository -> now have access to the BurgerRepository inside of our service
    -> now have access to this fineAll method 
    -> return a list of all my burgers 
    -> allows us to use the magic of the ORM
    */
    // create a method that will get all burgers
    public List<Burger> getAllBurgers() {
        return burgerRepository.findAll();
    }


    //^ READ ONE
    // -> now just need to call this in our controller
    // -> know which burger you want by the id -> pass in Lond id
    public Burger getOneBurger(Long id) {
        // -> getting a burger us e the optional type 
        Optional<Burger> optionalBurger = burgerRepository.findById(id);
        // -> Java shorthand for if, else if statement 
        return optionalBurger.orElse(null);
    }


    //^ UPDATE
    // -> method for update
    // controller talks to the service the servive talks to the repository
    public void updateBurger(Burger burger) {
        /* 
        -> save -> get the same burger from the database 
        -> fixing it and passing it back
        -> taking that burger and resaving it to the modified version
        */
        burgerRepository.save(burger);
    }


    //^ DELETE
    public void deleteBurger(Burger burger) {
        // controller talks to the service -> service talks to the repository
        burgerRepository.delete(burger);
    }
}
