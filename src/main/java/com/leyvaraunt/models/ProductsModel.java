package com.leyvaraunt.models;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.SQLIntegrityConstraintViolationException;
import java.util.ArrayList;

import com.leyvaraunt.entities.Product;
import com.leyvaraunt.interfaces.CrudInterface;
import com.leyvaraunt.interfaces.EntitieInterface;

public class ProductsModel extends ModelAbstract implements CrudInterface {

  public ProductsModel() {
    super();
    this.setTableName("all_products");
  }

  @Override
  public ArrayList<EntitieInterface> getAll() throws SQLException {
    ArrayList<EntitieInterface> products = new ArrayList<>();
    ResultSet result = this.findAll(this.getTableName());
    while (result.next()) {
      Product product = new Product();
      product.setId(result.getInt("id"));
      product.setIdCategory(result.getInt("id_category"));
      product.setCategory(result.getString("category"));
      product.setName(result.getString("name"));
      product.setDescription(result.getString("description"));
      product.setPrice(result.getDouble("price"));
      products.add(product);
    }
    return products;
  }

  @Override
  public EntitieInterface getById(int id) throws SQLException {
    ResultSet result = this.findWithWhere(this.getTableName(), "id = ?", id);
    Product product = null;
    if (result.next()) {
      product = new Product();
      product.setId(result.getInt("id"));
      product.setIdCategory(result.getInt("id_category"));
      product.setCategory(result.getString("category"));
      product.setName(result.getString("name"));
      product.setDescription(result.getString("description"));
      product.setPrice(result.getDouble("price"));
    }
    return product;
  }

  @Override
  public boolean insert(EntitieInterface newEntitie) throws SQLException, SQLIntegrityConstraintViolationException {
    Product newProduct = (Product) newEntitie;
    int result = this.callProcedure("add_product(?, ?, ?, ?)",
        newProduct.getIdCategory(),
        newProduct.getName(),
        newProduct.getDescription(),
        newProduct.getPrice());

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
    Product newProduct = (Product) newEntitie;
    int rowsAffected = this.callProcedure("update_product(?, ?, ?, ?, ?)",
        id,
        newProduct.getIdCategory(), 
        newProduct.getName(),
        newProduct.getDescription(),
        newProduct.getPrice());
    return rowsAffected > 0;
  }

  @Override
  public boolean deleteById(int id) throws SQLException, SQLIntegrityConstraintViolationException {
    int rowsAffected = this.callProcedure("delete_product(?)", id);
    return rowsAffected > 0;
  }

}
