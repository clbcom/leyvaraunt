package com.leyvaraunt.controllers;

import com.leyvaraunt.config.Constants;
import com.leyvaraunt.interfaces.CrudInterface;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Cristhian
 */
public abstract class ControllerAbstract {

  private CrudInterface model;

  public CrudInterface getModel() {
    return model;
  }

  public void setModel(CrudInterface model) {
    this.model = model;
  }

  protected boolean isLogued(Cookie[] cookies) {
    boolean isLogued = false;

    if (cookies != null) {
      for (Cookie currCookie : cookies) {
        if (currCookie.getName().equals(Constants.NAME_COOKIE_ID)) {
          isLogued = true;
          break;
        }
      }
    }

    return isLogued;
  }

  public abstract void view(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException;

  public abstract void viewById(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException;

  public abstract void create(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException;

  public abstract void createView(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException;

  public abstract void update(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException;

  public abstract void updateView(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException;

  public abstract void delete(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException;

}
