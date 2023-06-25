/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.leyvaraunt.controllers;

import com.leyvaraunt.models.CategoriesModel;
import com.leyvaraunt.entities.Categories;
import com.leyvaraunt.interfaces.EntitieInterface;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
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
  public void view(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException  {
    try {
      ArrayList<EntitieInterface> cats;
      cats = this.getModel().getAll();
      for (EntitieInterface cat : cats) {
        Categories c = (Categories) cat;
        System.out.println(c);
      }
    } catch (SQLException e) {
      e.printStackTrace();
    }
  }

  @Override
  public void viewById(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    // TODO Auto-generated method stub
    throw new UnsupportedOperationException("Unimplemented method 'viewById'");
  }

  @Override
  public void create(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    // TODO Auto-generated method stub
    throw new UnsupportedOperationException("Unimplemented method 'create'");
  }

  @Override
  public void update(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    // TODO Auto-generated method stub
    throw new UnsupportedOperationException("Unimplemented method 'update'");
  }

  @Override
  public void updateView(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    // TODO Auto-generated method stub
    throw new UnsupportedOperationException("Unimplemented method 'updateView'");
  }

  @Override
  public void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    // TODO Auto-generated method stub
    throw new UnsupportedOperationException("Unimplemented method 'delete'");
  }

  @Override
  public void createView(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    // TODO Auto-generated method stub
    throw new UnsupportedOperationException("Unimplemented method 'createView'");
  }


}
