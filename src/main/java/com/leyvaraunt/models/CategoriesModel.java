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
import java.sql.SQLIntegrityConstraintViolationException;
import java.util.ArrayList;

/**
 *
 * @author Cristhian
 */
public class CategoriesModel extends ModelAbstract implements CrudInterface {

  public CategoriesModel() {
    super();
    this.setTableName("count_products_by_category");
  }

  @Override
  public ArrayList<EntitieInterface> getAll() throws SQLException {
    ResultSet result = this.findAll(this.getTableName());
    ArrayList<EntitieInterface> categories = new ArrayList<>();
    while (result.next()) {
      Categories category = new Categories();
      category.setId(result.getInt("id_category"));
      category.setName(result.getString("category"));
      category.setCountProducts(result.getInt("num_products"));
      categories.add(category);
    }
    return categories;
  }

  @Override
  public EntitieInterface getById(int id) throws SQLException {
    ResultSet result = this.findWithWhere(this.getTableName(), "id_category = ?", id);
    Categories category = null;
    if (result.next()) {
      category = new Categories();
      category.setId(result.getInt("id_category"));
      category.setName(result.getString("category"));
      category.setCountProducts(result.getInt("num_products"));
    }
    return category;
  }

  @Override
  public boolean insert(EntitieInterface newEntitie) throws SQLException, SQLIntegrityConstraintViolationException {
    Categories newCategory = (Categories) newEntitie;
    int result = this.callProcedure("add_category(?)", newCategory.getName());
    return result > 0;
  }

  @Override
  public boolean updateAll(ArrayList<EntitieInterface> newsEntities)
      throws SQLException, SQLIntegrityConstraintViolationException {
    // TODO Auto-generated method stub
    throw new UnsupportedOperationException("Unimplemented method 'updateAll'");
  }

  @Override
  public boolean updateById(int id, EntitieInterface newEntitie)
      throws SQLException, SQLIntegrityConstraintViolationException {
    Categories category = (Categories) newEntitie;
    int result = this.callProcedure("update_category(?, ?)", category.getId(), category.getName());
    return result > 0;
  }

  @Override
  public boolean deleteById(int id) throws SQLException, SQLIntegrityConstraintViolationException {
    int result = this.callProcedure("delete_category(?)", id);
    return result > 0;
  }

}
