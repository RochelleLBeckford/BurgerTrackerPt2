package com.rochelle.burger_tracker_pt2.repositories;

import java.util.List;
// -> sometimes it knows how to import this sometimes it will not work 
import org.springframework.data.repository.CrudRepository;
// import org.springframework.stereotype.Repository;
// connect my burger from models
import com.rochelle.burger_tracker_pt2.models.Burger;

// @Repository
/* 
-> this is where we connect to the ORM -> will be an interface
-> BurgerRepository is the ORM that connects us to our DB
-> there is no save method -> it has it in virtue of the CrudRepository
*/
public interface BurgerRepository extends CrudRepository<Burger, Long> {
    // want to be able to find all books -> call find all method want to return a list of books
    //No SQL no DB -> if want to get all my books now I can
    List<Burger> findAll();
}
