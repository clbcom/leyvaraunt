/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.leyvaraunt.routes;

import java.io.IOException;
import java.util.Enumeration;

import javax.persistence.Enumerated;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.leyvaraunt.config.Constants;
import com.leyvaraunt.entities.Manager;

/**
 *
 * @author Cristhian
 */
@WebServlet(name = "main", urlPatterns = { "/main" })
public class Main extends HttpServlet {

  public void responseServelet(HttpServletRequest request, HttpServletResponse response)
      throws IOException, ServletException {
    Cookie[] cookies = request.getCookies();

    if (cookies != null) {
      Cookie idCookie = null;
      for (Cookie cookie : cookies) {
        if (cookie.getName().equals(Constants.NAME_COOKIE_ID)) {
          idCookie = cookie;
        }
      }

      if (idCookie == null) {
        response.sendRedirect(request.getContextPath() + "/login");
      } else {
        request.getRequestDispatcher("index.jsp").forward(request, response);
      }
    } else {
      response.sendRedirect(request.getContextPath() + "/login");
    }
  }

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
    this.responseServelet(request, response);
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
    System.out.println("fordwardeo como POST");
    this.responseServelet(request, response);
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
