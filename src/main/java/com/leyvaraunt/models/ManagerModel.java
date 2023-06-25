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
  public ArrayList<EntitieInterface> getAll() throws SQLException {
    ResultSet result = this.findAll(getTableName());
    ArrayList<EntitieInterface> managers = new ArrayList<>();
    while (result.next()) {
      Manager manager = new Manager();
      manager.setId(result.getInt("id"));
      manager.setName(result.getString("name"));
      manager.setLastname(result.getString("lastname"));
      manager.setUsername(result.getString("username"));

      managers.add(manager);
    }

    return managers;
  }

  @Override
  public EntitieInterface getById(int id) throws SQLException {
    ResultSet result = this.findWithWhere(getTableName(), "id = ?", id);
    Manager manager = null;
    if (result.next()) {
      manager = new Manager();
      manager.setId(result.getInt("id"));
      manager.setName(result.getString("name"));
      manager.setLastname(result.getString("lastname"));
      manager.setUsername(result.getString("username"));
      manager.setPassword(result.getString("password"));
    }
    return manager;
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
    Manager manager = (Manager) newEntitie;
    int result = this.callProcedure("update_manager(?, ?, ?, ?, MD5(?))",
        manager.getId(),
        manager.getName(),
        manager.getLastname(),
        manager.getUsername(),
        manager.getPassword());
    return result > 0;
  }

  @Override
  public boolean deleteById(int id) throws SQLException, SQLIntegrityConstraintViolationException {
    int result = this.callProcedure("delete_manager(?)", id);
    return result > 0;
  }

  @Override
  public boolean insert(EntitieInterface newEntitie) throws SQLException, SQLIntegrityConstraintViolationException {
    Manager newManager = (Manager) newEntitie;
    int result = this.callProcedure("add_manager(?, ?, ?, MD5(?))",
        newManager.getName(),
        newManager.getLastname(),
        newManager.getUsername(),
        newManager.getPassword());
    return result > 0;
  }
}
