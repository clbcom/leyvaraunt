package com.leyvaraunt.models;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.SQLIntegrityConstraintViolationException;
import java.util.ArrayList;

import com.leyvaraunt.entities.Information;
import com.leyvaraunt.interfaces.CrudInterface;
import com.leyvaraunt.interfaces.EntitieInterface;

public class InformationModel extends ModelAbstract implements CrudInterface {
  public InformationModel() {
    super();
    this.setTableName("information LIMIT 1");
  }

  @Override
  public ArrayList<EntitieInterface> getAll() throws SQLException {
    ArrayList<EntitieInterface> information = new ArrayList<>();
    ResultSet result = this.findAll(this.getTableName());
    while (result.next()) {
      Information info = new Information();
      info.setId(result.getInt("id"));
      info.setDescription(result.getString("description"));
      info.setLocation(result.getString("location"));
      info.setSchedule(result.getString("schedules"));
      information.add(info);
    }
    return information;
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
    Information info = (Information) newEntitie;
    int result = this.callProcedure("update_information(?, ?, ?, ?)",
        info.getId(),
        info.getDescription(),
        info.getLocation(),
        info.getSchedule());
    return result > 0;
  }

  @Override
  public boolean deleteById(int id) throws SQLException, SQLIntegrityConstraintViolationException {
    // TODO Auto-generated method stub
    throw new UnsupportedOperationException("Unimplemented method 'deleteById'");
  }
}
