package com.leyvaraunt.entities;

import com.leyvaraunt.interfaces.EntitieInterface;

public class Product implements EntitieInterface {
  private int id;
  private int idCategory;
  private String category;
  private String name;
  private String description;
  private double price;

  public Product() {
  }

  public int getId() {
    return id;
  }

  public void setId(int id) {
    this.id = id;
  }

  public int getIdCategory() {
    return idCategory;
  }

  public void setIdCategory(int idCategory) {
    this.idCategory = idCategory;
  }

  public String getCategory() {
    return category;
  }

  public void setCategory(String category) {
    this.category = category;
  }

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public String getDescription() {
    return description;
  }

  public void setDescription(String description) {
    this.description = description;
  }

  public double getPrice() {
    return price;
  }

  public void setPrice(double price) {
    this.price = price;
  }

  @Override
  public String toString() {
    return "Product [id=" + id + ", idCategory=" + idCategory + ", category=" + category + ", name=" + name
        + ", description=" + description + ", price=" + price + "]";
  }
}
