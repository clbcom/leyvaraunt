package com.leyvaraunt.controllers;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
        request.setAttribute(Constants.KEYNAME_ERROR_MESSAJE, errorMessage);
        request.getRequestDispatcher("login/formLogin.jsp").forward(request, response);
      } else {
        System.out.println("SI existe");

        String idString = "" + manager.getId();
        String fullName = String.format("%s-%s", manager.getName(), manager.getLastname());
        Cookie idCookie = new Cookie(Constants.NAME_COOKIE_ID, idString);
        Cookie fullNameCookie = new Cookie(Constants.NAME_COOKIE_FULLNAME, fullName);
        Cookie userNameCokkie = new Cookie(Constants.NAME_COOKIE_USERNAME, manager.getUsername());
        idCookie.setMaxAge(1800);
        fullNameCookie.setMaxAge(1800);
        userNameCokkie.setMaxAge(1800);
        response.addCookie(idCookie);
        response.addCookie(fullNameCookie);
        response.addCookie(userNameCokkie);

        response.sendRedirect(request.getContextPath());
      }
    } catch (SQLException e) {
      System.err.println("Error de no se que: " + e.getMessage());
      String errorMessage = e.getMessage();
      request.setAttribute(Constants.KEYNAME_ERROR_MESSAJE, errorMessage);
      request.getRequestDispatcher("login/formLogin.jsp").forward(request, response);
    }
  }

  @Override
  public void view(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
    String logout = request.getParameter("logout");
    Cookie[] cookies = request.getCookies();

    boolean isLogued = false;

    if (cookies != null) {
      for (Cookie currCookie : cookies) {
        if (currCookie.getName().equals(Constants.NAME_COOKIE_ID)) {
          isLogued = true;
        }
      }
    }

    if (logout != null) {
      if (cookies != null) { // elimina las cookies haciendo que expiren
        for (Cookie currCookie : cookies) {
          if (currCookie.getName().equals("JSESSIONID")) {
            continue;
          }
          currCookie.setMaxAge(0);
          response.addCookie(currCookie);
        }
      }

      System.out.println("Es logout... y cookies eliminadas");
    } else if (isLogued) {
      response.sendRedirect(request.getContextPath());
      return;
    }
    request.getRequestDispatcher("login/formLogin.jsp").forward(request, response);
  }

  @Override
  public void viewById(HttpServletRequest request, HttpServletResponse response) {
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

  @Override
  public void create(HttpServletRequest request, HttpServletResponse response) {
    // TODO Auto-generated method stub
    throw new UnsupportedOperationException("Unimplemented method 'create'");
  }

}
