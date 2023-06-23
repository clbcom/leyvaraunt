package com.leyvaraunt.models;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.SQLIntegrityConstraintViolationException;
import java.util.ArrayList;

import com.leyvaraunt.entities.Manager;
import com.leyvaraunt.interfaces.CrudInterface;
import com.leyvaraunt.interfaces.EntitieInterface;

public class ManagerModel extends ModelAbstract implements CrudInterface {

  public ManagerModel() {
    super();
    this.setTableName("manager");
  }

  public EntitieInterface login(String username, String password)
      throws SQLException, SQLIntegrityConstraintViolationException {
    String conditionWhere = "username = ? AND password = MD5(?)";
    ResultSet result = this.findWithWhere(getTableName(), conditionWhere, username, password);
    Manager manager = null;
    if (result.next()) {
      manager = new Manager();
      manager.setId(result.getInt("id"));
      manager.setName(result.getString("name"));
      manager.setLastname(result.getString("lastname"));
      manager.setUsername(result.getString("username"));
    }

    return manager;
  }

  @Override
  public ArrayList<EntitieInterface> getAll() {
    throw new UnsupportedOperationException("Unimplemented method 'getAll'");
  }

  @Override
  public EntitieInterface getById(int id) {
    // TODO Auto-generated method stub
    throw new UnsupportedOperationException("Unimplemented method 'getById'");
  }

  @Override
  public boolean updateAll(ArrayList<EntitieInterface> newsEntities) {
    // TODO Auto-generated method stub
    throw new UnsupportedOperationException("Unimplemented method 'updateAll'");
  }

  @Override
  public boolean updateById(int id, EntitieInterface newEntitie) {
    // TODO Auto-generated method stub
    throw new UnsupportedOperationException("Unimplemented method 'updateById'");
  }

  @Override
  public boolean deleteById(int id) {
    // TODO Auto-generated method stub
    throw new UnsupportedOperationException("Unimplemented method 'deleteById'");
  }

}
