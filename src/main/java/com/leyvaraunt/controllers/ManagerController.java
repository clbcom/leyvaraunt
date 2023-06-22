package com.leyvaraunt.controllers;

import java.io.IOException;
import java.net.HttpRetryException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.leyvaraunt.config.Constants;
import com.leyvaraunt.entities.Manager;
import com.leyvaraunt.models.ManagerModel;

public class ManagerController extends ControllerAbstract {

  public ManagerController() {
    super();
    this.setModel(new ManagerModel());
  }

  public void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    try {
      String username = request.getParameter("username");
      String password = request.getParameter("password");
      ManagerModel model = (ManagerModel) this.getModel();
      Manager manager = (Manager) model.login(username, password);
      if (manager == null) {
        String errorMessage = "Usuario y/o contraseña incorrecto";
        System.out.println(errorMessage);
        request.setAttribute(Constants.KEY_ERROR_MESSAJE, errorMessage);
        request.getRequestDispatcher("login/formLogin.jsp").forward(request, response);
      } else {
        System.out.println("SI existe");
        HttpSession session = request.getSession();
        session.setAttribute("id_manager", manager.getId());
        request.removeAttribute(Constants.KEY_ERROR_MESSAJE);
        response.sendRedirect(request.getContextPath());
      }
    } catch (SQLException e) {
      System.err.println("Error de no se que: " + e.getMessage());
      String errorMessage = e.getMessage();
      request.setAttribute(Constants.KEY_ERROR_MESSAJE, errorMessage);
      request.getRequestDispatcher("login/formLogin.jsp").forward(request, response);
    }
  }

  @Override
  public void getAll(HttpServletRequest request, HttpServletResponse response) {
    // TODO Auto-generated method stub
    throw new UnsupportedOperationException("Unimplemented method 'getAll'");
  }

  @Override
  public void getById(HttpServletRequest request, HttpServletResponse response) {
    // TODO Auto-generated method stub
    throw new UnsupportedOperationException("Unimplemented method 'getById'");
  }

  @Override
  public void update(HttpServletRequest request, HttpServletResponse response) {
    // TODO Auto-generated method stub
    throw new UnsupportedOperationException("Unimplemented method 'update'");
  }

  @Override
  public void delete(HttpServletRequest request, HttpServletResponse response) {
    // TODO Auto-generated method stub
    throw new UnsupportedOperationException("Unimplemented method 'delete'");
  }

}
