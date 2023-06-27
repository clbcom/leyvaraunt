package com.leyvaraunt.models;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.SQLIntegrityConstraintViolationException;
import java.util.ArrayList;

import com.leyvaraunt.entities.History;
import com.leyvaraunt.interfaces.CrudInterface;
import com.leyvaraunt.interfaces.EntitieInterface;

public class HistoryModel extends ModelAbstract implements CrudInterface{

  public HistoryModel(){
    super();
    this.setTableName("modify ORDER BY date_modify DESC, id DESC");
  }

  @Override
  public ArrayList<EntitieInterface> getAll() throws SQLException {
    ArrayList<EntitieInterface> record = new ArrayList<>();
    ResultSet result = this.findAll(this.getTableName());
    while (result.next()) {
      History history = new History();
      history.setId(result.getInt("id"));
      history.setType(result.getString("type"));
      history.setDescription(result.getString("description"));
      history.setDate(result.getString("date_modify"));
      record.add(history);
    }
    return record;
  }

  @Override
  public EntitieInterface getById(int id) throws SQLException {
    // TODO Auto-generated method stub
    throw new UnsupportedOperationException("Unimplemented method 'getById'");
  }

  @Override
  public boolean insert(EntitieInterface newEntitie) throws SQLException, SQLIntegrityConstraintViolationException {
    // TODO Auto-generated method stub
    throw new UnsupportedOperationException("Unimplemented method 'insert'");
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
    // TODO Auto-generated method stub
    throw new UnsupportedOperationException("Unimplemented method 'updateById'");
  }

  @Override
  public boolean deleteById(int id) throws SQLException, SQLIntegrityConstraintViolationException {
    // TODO Auto-generated method stub
    throw new UnsupportedOperationException("Unimplemented method 'deleteById'");
  }
  
}
