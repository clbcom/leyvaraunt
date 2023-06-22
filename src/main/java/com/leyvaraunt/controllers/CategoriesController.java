/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.leyvaraunt.controllers;

import com.leyvaraunt.models.CategoriesModel;
import com.leyvaraunt.entities.Categories;
import com.leyvaraunt.interfaces.EntitieInterface;
import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Cristhian
 */
public class CategoriesController extends ControllerAbstract {

  public CategoriesController() {
    this.setModel(new CategoriesModel());
  }

  @Override
  public void getAll(HttpServletRequest request, HttpServletResponse response) {
     ArrayList<EntitieInterface> cats = this.getModel().getAll();
     for (EntitieInterface cat: cats) {
       Categories c = (Categories) cat;
       System.out.println(c);
     }
  }

  @Override
  public void getById(HttpServletRequest request, HttpServletResponse response) {
    throw new UnsupportedOperationException("Not supported yet.");
  }

  @Override
  public void update(HttpServletRequest request, HttpServletResponse response) {
    throw new UnsupportedOperationException("Not supported yet.");
  }

  @Override
  public void delete(HttpServletRequest request, HttpServletResponse response) {
    throw new UnsupportedOperationException("Not supported yet.");
  }
  
}
