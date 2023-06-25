/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.leyvaraunt.interfaces;

import java.sql.SQLException;
import java.sql.SQLIntegrityConstraintViolationException;
import java.util.ArrayList;

/**
 *
 * @author Cristhian
 */
public interface CrudInterface {
  public ArrayList<EntitieInterface> getAll() throws SQLException;

  public EntitieInterface getById(int id) throws SQLException;

  public boolean insert(EntitieInterface newEntitie)
      throws SQLException, SQLIntegrityConstraintViolationException;

  public boolean updateAll(ArrayList<EntitieInterface> newsEntities)
      throws SQLException, SQLIntegrityConstraintViolationException;

  public boolean updateById(int id, EntitieInterface newEntitie)
      throws SQLException, SQLIntegrityConstraintViolationException;

  public boolean deleteById(int id) throws SQLException, SQLIntegrityConstraintViolationException;
}
