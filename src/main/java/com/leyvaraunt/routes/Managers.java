/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.leyvaraunt.routes;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.leyvaraunt.controllers.ControllerAbstract;
import com.leyvaraunt.controllers.ManagerController;

/**
 *
 * @author Cristhian
 */
@WebServlet(name = "managers", urlPatterns = { "/managers" })
public class Managers extends HttpServlet {
  /**
   * Handles the HTTP <code>GET</code> method.
   *
   * @param request  servlet request
   * @param response servlet response
   * @throws ServletException if a servlet-specific error occurs
   * @throws IOException      if an I/O error occurs
   */
  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    ControllerAbstract controller = new ManagerController();
    String newManager = request.getParameter("new");
    String edit = request.getParameter("edit");
    String delete = request.getParameter("delete");

    if (newManager != null) {
      controller.createView(request, response);
    } else if (edit != null) {
      controller.updateView(request, response);
    } else if (delete != null) {
      controller.delete(request, response);
    } else {
      controller.view(request, response);
    }
  }

  /**
   * Handles the HTTP <code>POST</code> method.
   *
   * @param request  servlet request
   * @param response servlet response
   * @throws ServletException if a servlet-specific error occurs
   * @throws IOException      if an I/O error occurs
   */
  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    ControllerAbstract controller = new ManagerController();
    String newManager = request.getParameter("new");
    String edit = request.getParameter("edit");
    String delete = request.getParameter("delete");

    if (newManager != null) {
      controller.create(request, response);
    } else if (edit != null) {
      controller.update(request, response);
    } else if (delete != null) {
      controller.delete(request, response);
    } else {
      controller.view(request, response);
    }
  }

  /**
   * Returns a short description of the servlet.
   *
   * @return a String containing servlet description
   */
  @Override
  public String getServletInfo() {
    return "Short description";
  }// </editor-fold>

}
