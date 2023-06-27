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
import com.leyvaraunt.entities.Product;
import com.leyvaraunt.interfaces.EntitieInterface;
import com.leyvaraunt.models.CategoriesModel;
import com.leyvaraunt.models.ProductsModel;

public class ProductsController extends ControllerAbstract {

  public ProductsController() {
    this.setModel(new ProductsModel());
  }

  private ArrayList<EntitieInterface> loadCategories() throws SQLException {
    CategoriesModel model = new CategoriesModel();
    return model.getAll();
  }

  @Override
  public void view(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    Cookie[] cookies = request.getCookies();
    if (!this.isLogued(cookies)) {
      response.sendRedirect(request.getContextPath() + "/login");
      return;
    }
    try {
      ArrayList<EntitieInterface> products = this.getModel().getAll();
      request.setAttribute("products", products);
      request.getRequestDispatcher("views/products/products.jsp").forward(request, response);
    } catch (SQLIntegrityConstraintViolationException e) {
      System.out.println("Error en ProductsController.view(): " + e.getMessage());
      request.setAttribute(Constants.KEYNAME_ERROR_MESSAJE, e.getMessage());
    } catch (SQLException e) {
      System.out.println("Error en ProductsController.view(): " + e.getMessage());
      request.setAttribute(Constants.KEYNAME_ERROR_MESSAJE, e.getMessage());
    }
  }

  @Override
  public void viewById(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    Cookie[] cookies = request.getCookies();
    if (!this.isLogued(cookies)) {
      response.sendRedirect(request.getContextPath() + "/login");
      return;
    }
  }

  @Override
  public void create(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    Cookie[] cookies = request.getCookies();
    if (!this.isLogued(cookies)) {
      response.sendRedirect(request.getContextPath() + "/login");
      return;
    }

    Product product = new Product();
    try {
      int idCategory = (request.getParameter("id_category") != null)
          ? Integer.parseInt(request.getParameter("id_category"))
          : 0;
      double price = (request.getParameter("price") != null)
          ? Double.parseDouble(request.getParameter("price"))
          : 0;
      product.setIdCategory(idCategory);
      product.setName(request.getParameter("name"));
      product.setDescription(request.getParameter("description"));
      product.setPrice(price);

      request.setAttribute("categories", this.loadCategories());
      if (this.getModel().insert(product)) {
        System.out.println("Producto agregado: " + product);
        response.sendRedirect(request.getContextPath() + "/products");
        return;
      }
    } catch (SQLIntegrityConstraintViolationException e) {
      System.out.println("Error ocurrido en ProductsController.create(): " + e.getMessage());
      request.setAttribute(Constants.KEYNAME_ERROR_MESSAJE, e.getMessage());
    } catch (SQLException e) {
      System.out.println("Error ocurrido en ProductsController.create(): " + e.getMessage());
      request.setAttribute(Constants.KEYNAME_ERROR_MESSAJE, e.getMessage());
    }
    request.setAttribute("product", product);
    request.getRequestDispatcher("views/products/newProduct.jsp").forward(request, response);
  }

  @Override
  public void createView(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    Cookie[] cookies = request.getCookies();
    if (!this.isLogued(cookies)) {
      response.sendRedirect(request.getContextPath() + "/login");
      return;
    }
    try {
      request.setAttribute("categories", this.loadCategories());
    } catch (SQLException e) {
      System.out.println("Error en ProductsController.createView(): " + e.getMessage());
    }
    request.getRequestDispatcher("views/products/newProduct.jsp").forward(request, response);
  }

  @Override
  public void update(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    Cookie[] cookies = request.getCookies();
    if (!this.isLogued(cookies)) {
      response.sendRedirect(request.getContextPath() + "/login");
      return;
    }
    Product product = new Product();
    try {
      int idProduct = Integer.parseInt(request.getParameter("edit"));
      int idCategory = (request.getParameter("id_category") != null)
          ? Integer.parseInt(request.getParameter("id_category"))
          : 0;
      double price = (request.getParameter("price") != null)
          ? Double.parseDouble(request.getParameter("price"))
          : 0;
      product.setIdCategory(idCategory);
      product.setName(request.getParameter("name"));
      product.setDescription(request.getParameter("description"));
      product.setPrice(price);
      System.out.println("haber::::: " + product);
      request.setAttribute("categories", this.loadCategories());
      if (this.getModel().updateById(idProduct, product)) {
        System.out.println("Producto actualizado: " + product);
        response.sendRedirect(request.getContextPath() + "/products");
        return;
      }
    } catch (SQLIntegrityConstraintViolationException e) {
      System.out.println("Error ocurrido en ProductsController.create(): " + e.getMessage());
      request.setAttribute(Constants.KEYNAME_ERROR_MESSAJE, e.getMessage());
    } catch (SQLException e) {
      System.out.println("Error ocurrido en ProductsController.create(): " + e.getMessage());
      request.setAttribute(Constants.KEYNAME_ERROR_MESSAJE, e.getMessage());
    }
    request.setAttribute("product", product);
    request.getRequestDispatcher("views/products/updateProduct.jsp").forward(request, response);

  }

  @Override
  public void updateView(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    Cookie[] cookies = request.getCookies();
    if (!this.isLogued(cookies)) {
      response.sendRedirect(request.getContextPath() + "/login");
      return;
    }
    try {
      int idProduct = Integer.parseInt(request.getParameter("edit"));
      Product product = (Product) this.getModel().getById(idProduct);
      request.setAttribute("product", product);
      request.setAttribute("categories", this.loadCategories());
    } catch (SQLException e) {
      System.out.println("Error en ProductsController.createView(): " + e.getMessage());
    }
    request.getRequestDispatcher("views/products/updateProduct.jsp").forward(request, response);
  }

  @Override
  public void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    Cookie[] cookies = request.getCookies();
    if (!this.isLogued(cookies)) {
      response.sendRedirect(request.getContextPath() + "/login");
      return;
    }
    int idProduct = Integer.parseInt(request.getParameter("delete"));
    try {
      Product product = (Product) this.getModel().getById(idProduct);
      this.getModel().deleteById(idProduct);
      String message = String.format("Producto %s eliminado con exito.", product.getName());
      request.setAttribute(Constants.KEYNAME_ERROR_MESSAJE, message);
      this.view(request, response);
      return;
    } catch (SQLIntegrityConstraintViolationException e) {
      System.out.println("Error ocurrido en ProductsController.delete(): " + e.getMessage());
      request.setAttribute(Constants.KEYNAME_ERROR_MESSAJE, e.getMessage());
    } catch (SQLException e) {
      System.out.println("Error ocurrido en ProductsController.delete(): " + e.getMessage());
      request.setAttribute(Constants.KEYNAME_ERROR_MESSAJE, e.getMessage());
      this.view(request, response);
    }
  }
}
