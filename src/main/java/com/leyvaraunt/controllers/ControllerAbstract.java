package com.leyvaraunt.controllers;

import com.leyvaraunt.interfaces.CrudInterface;
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

  public abstract void getAll(HttpServletRequest request, HttpServletResponse response);

  public abstract void getById(HttpServletRequest request, HttpServletResponse response);

  public abstract void update(HttpServletRequest request, HttpServletResponse response);

  public abstract void delete(HttpServletRequest request, HttpServletResponse response);

}
