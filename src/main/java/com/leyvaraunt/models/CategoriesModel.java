/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.leyvaraunt.models;

import com.leyvaraunt.entities.Categories;
import com.leyvaraunt.interfaces.CrudInterface;
import com.leyvaraunt.interfaces.EntitieInterface;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Cristhian
 */
public class CategoriesModel extends ModelAbstract implements CrudInterface {

  public CategoriesModel() {
    super();
    this.setTableName("categories");
  }

  @Override
  public ArrayList<EntitieInterface> getAll() {
    ArrayList<EntitieInterface> categories = new ArrayList<>();
    ResultSet result = this.findAll(this.getTableName());

    try {
      while (result.next()) {
        Categories category = new Categories(result.getInt("id"), result.getString("name"));
        categories.add(category);
      }
    } catch (SQLException ex) {
      Logger.getLogger(CategoriesModel.class.getName()).log(Level.SEVERE, null, ex);
    }
    
    return categories;
  }

  @Override
  public EntitieInterface getById(int id) {
    throw new UnsupportedOperationException("Not supported yet.");
  }

  @Override
  public boolean updateAll(ArrayList<EntitieInterface> newsEntities) {
    throw new UnsupportedOperationException("Not supported yet.");
  }

  @Override
  public boolean updateById(int id, EntitieInterface newEntitie) {
    throw new UnsupportedOperationException("Not supported yet.");
  }

  @Override
  public boolean deleteById(int id) {
    throw new UnsupportedOperationException("Not supported yet.");
  }

}
