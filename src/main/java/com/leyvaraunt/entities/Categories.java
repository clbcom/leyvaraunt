/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.leyvaraunt.entities;

import com.leyvaraunt.interfaces.EntitieInterface;

/**
 *
 * @author Cristhian
 */
public class Categories implements EntitieInterface {

  private int id;
  private String name;
  private int countProducts;

  public Categories() {
  }

  public Categories(int id, String name, int countProducts) {
    this.id = id;
    this.name = name;
    this.countProducts = countProducts;
  }

  public int getId() {
    return id;
  }

  public void setId(int id) {
    this.id = id;
  }

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public int getCountProducts() {
    return countProducts;
  }

  public void setCountProducts(int countProducts) {
    this.countProducts = countProducts;
  }

  @Override
  public String toString() {
    return "Categories [id=" + id + ", name=" + name + ", countProducts=" + countProducts + "]";
  }
}
