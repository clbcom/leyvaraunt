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

  public Categories(int id, String name) {
    this.id = id;
    this.name = name;
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

  @Override
  public String toString() {
    return "Categories{" + "id=" + id + ", name=" + name + '}';
  }

}
