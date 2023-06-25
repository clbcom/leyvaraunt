package com.leyvaraunt.controllers;

import java.io.IOException;
import java.sql.SQLException;
import java.sql.SQLIntegrityConstraintViolationException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.leyvaraunt.config.Constants;
import com.leyvaraunt.entities.Manager;
import com.leyvaraunt.interfaces.EntitieInterface;
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
        String fullName = String.format("%s-%s", manager.getName(), manager.getLastname().replace(' ', '-'));
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

  public void viewLogin(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
    String logout = request.getParameter("logout");
    Cookie[] cookies = request.getCookies();

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
    } else if (this.isLogued(cookies)) {
      response.sendRedirect(request.getContextPath());
      return;
    }
    request.getRequestDispatcher("login/formLogin.jsp").forward(request, response);
  }

  @Override
  public void view(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    Cookie[] cookies = request.getCookies();
    if (!this.isLogued(cookies)) {
      response.sendRedirect(request.getContextPath() + "/login");
      return;
    }

    try {
      ArrayList<EntitieInterface> managers = this.getModel().getAll();
      request.setAttribute("managers", managers);
      request.getRequestDispatcher("views/managers/managers.jsp").forward(request, response);
    } catch (Exception e) {
      System.out.println("Ocurrio un error en ManagerController: " + e.getMessage());
    }
  }

  @Override
  public void viewById(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    // TODO Auto-generated method stub
    throw new UnsupportedOperationException("Unimplemented method 'getById'");
  }

  @Override
  public void updateView(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    try {
      int idManager = Integer.parseInt(request.getParameter("edit"));
      request.setAttribute("manager", this.getModel().getById(idManager));
      request.getRequestDispatcher("views/managers/managerForm.jsp").forward(request, response);
    } catch (SQLException e) {
      // TODO Auto-generated catch block
      e.printStackTrace();
    }
  }

  @Override
  public void update(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    Manager manager = new Manager();
    try {
      int idManager = Integer.parseInt(request.getParameter("edit"));
      manager.setId(idManager);
      manager.setName(request.getParameter("name"));
      manager.setLastname(request.getParameter("lastname"));
      manager.setUsername(request.getParameter("username"));
      manager.setPassword(request.getParameter("password"));
      boolean isUpdate = this.getModel().updateById(idManager, manager);
      if (isUpdate) {
        System.out.println("se actualizo");
        response.sendRedirect(request.getContextPath() + "/managers");
        return;
      }
    } catch (SQLIntegrityConstraintViolationException e) {
      System.out.println(e);
      request.setAttribute("manager", manager);
      request.setAttribute(Constants.KEYNAME_ERROR_MESSAJE, e.getMessage());
      request.getRequestDispatcher("views/managers/managerForm.jsp").forward(request, response);
    } catch (SQLException e) {
      System.out.println(e);
      request.setAttribute("manager", manager);
      request.setAttribute(Constants.KEYNAME_ERROR_MESSAJE, e.getMessage());
      request.getRequestDispatcher("views/managers/managerForm.jsp").forward(request, response);
    }
  }

  @Override
  public void create(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    Manager manager = new Manager();
    try {
      manager.setName(request.getParameter("name"));
      manager.setLastname(request.getParameter("lastname"));
      manager.setUsername(request.getParameter("username"));
      manager.setPassword(request.getParameter("password"));
      if (this.getModel().insert(manager)) {
        response.sendRedirect(request.getContextPath() + "/managers");
        return;
      }
    } catch (SQLIntegrityConstraintViolationException e) {
      System.out.println(e);
      request.setAttribute(Constants.KEYNAME_ERROR_MESSAJE, e.getMessage());
      request.getRequestDispatcher("views/managers/managerForm.jsp").forward(request, response);
    } catch (SQLException e) {
      System.out.println(e);
      request.setAttribute(Constants.KEYNAME_ERROR_MESSAJE, e.getMessage());
      request.getRequestDispatcher("views/managers/managerForm.jsp").forward(request, response);
    }
  }

  @Override
  public void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    try {
      int id = Integer.parseInt(request.getParameter("delete"));
      if (this.getModel().deleteById(id)) {
        System.out.println("Encargado eliminado: " + id);
      }
    } catch (SQLException e) {
      System.out.println("Un error en ManagerController.delete() : " + e.getMessage());
    }
    response.sendRedirect(request.getContextPath() + "/managers");
  }

  @Override
  public void createView(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    request.getRequestDispatcher("views/managers/managerForm.jsp").forward(request, response);
  }

}
