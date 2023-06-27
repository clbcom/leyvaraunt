package com.leyvaraunt.controllers;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.leyvaraunt.interfaces.EntitieInterface;
import com.leyvaraunt.models.InformationModel;

public class InformationController extends ControllerAbstract {
  public InformationController() {
    this.setModel(new InformationModel());
  }

  @Override
  public void view(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    Cookie[] cookies = request.getCookies();
    if (!this.isLogued(cookies)) {
      response.sendRedirect(request.getContextPath() + "/login");
      return;
    }
    try {
      ArrayList<EntitieInterface> info = this.getModel().getAll();
      request.setAttribute("information", info);
    } catch (SQLException e) {
      System.out.println("Error al obtener informacion: " + e.getMessage());
    }
    request.getRequestDispatcher("index.jsp").forward(request, response);
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
  public void createView(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    // TODO Auto-generated method stub
    throw new UnsupportedOperationException("Unimplemented method 'createView'");
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
}
