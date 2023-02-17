package com.rochelle.burger_tracker_pt2.models;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

import org.springframework.format.annotation.DateTimeFormat;

/* 
~ @Entity is an ORM [object relational mapper]-> will write the SQL for me ~
-> will allow us to keep track of our burger as an element of our DN -> a table in our DB
-> Entity marks this as something the JPA will keep track of
*/
@Entity
/* 
~ -> make a table -> @Table and set the name of the table -> name ="burgers_crud" ~
the @ annotation is special -> this will magically make our table
tell jpa what table we want to check -> table names are always plural
all the attributes on our burger
*/
@Table(name="burgers")
public class Burger {
    // need to set up the id to keep track of the title, author, pages, note
    // creates the id column in our DB -> keep track of the id we establish for the burger that we got
    @Id
    // what allows us to auto increment our ids
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    // these annotations modify the property of our burger
    private Long id;
    // the burgers attributes must be provided for the imports to work -> title, author, pages, note 
    // now if look at schema will see all of these attributes below in their own column

    //& Validations &
    @NotBlank
    private String name;


    @NotBlank
    private String restaurantName;

    
    @NotNull (message = "The rating must be greater than 0 and less than 5")
    @Min(value= 1)
    private Integer rating ;


    @NotBlank
    private String notes;

    // This will nor allow the createdAt column to be updated after creation
    @Column(updatable=false)
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date createdAt;
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date updatedAt;

    /* 
    ~ inorder to be able to access these attributes and in order to make new burgers ~
    -> need constructor
    -> generate an empty constructor
    -> needed to be a Java Bean -> POJO that spring uses to keep tracl of everything
    generate constructorrs
    empty constructor
    */
    public Burger() {
    }

    // ~ generate a constructor w/ all of the fields ~
    // constructor with all the fields
    public Burger(Long id, String name, String restaurantName, Integer rating, String notes, Date createdAt, Date updatedAt) {
        this.id = id;
        this.name = name;
        this.restaurantName = restaurantName;
        this.rating = rating;
        this.notes = notes;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
    }

    /* 
    ~ since private need to access them -> getters and setters ~ 
    ~ POJO -> Plain old java object ~
        -> specific format for creating objects in java
        -> it has to have private attributes 
        -> it has to have a constructor that takes all the params
        -> it has to have getters and setters
        -> it has to have serialized
    -> spring will be able to use it w/o any other set up or config from us -> will be able to access our programs 
    ~ Now can go into controller ~
    -> needed to be a Java Been 
    -> added these id getter and setters so can access private Long id -> now need to create a route for this 
    */
    // the getter and setters

    public Long getId() {
        return this.id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return this.name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getRestaurantName() {
        return this.restaurantName;
    }

    public void setRestaurantName(String restaurantName) {
        this.restaurantName = restaurantName;
    }

    public Integer getRating() {
        return this.rating;
    }

    public void setRating(Integer rating) {
        this.rating = rating;
    }

    public String getNotes() {
        return this.notes;
    }

    public void setNotes(String notes) {
        this.notes = notes;
    }

    public Date getCreatedAt() {
        return this.createdAt;
    }

    public void setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }

    public Date getUpdatedAt() {
        return this.updatedAt;
    }

    public void setUpdatedAt(Date updatedAt) {
        this.updatedAt = updatedAt;
    }




}
