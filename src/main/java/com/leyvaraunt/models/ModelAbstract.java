/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.leyvaraunt.models;

import com.leyvaraunt.database.Database;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.SQLIntegrityConstraintViolationException;

/**
 *
 * @author Cristhian
 */
public abstract class ModelAbstract {

  private String tableName;
  final private Database database;

  public ModelAbstract() {
    this.database = new Database();
  }

  public String getTableName() {
    return tableName;
  }

  public void setTableName(String tableName) {
    this.tableName = tableName;
  }

  protected ResultSet findAll(String tableName) {
    ResultSet resultSet = null;
    try {
      Connection connection = this.database.connect();
      String sql = String.format("SELECT * FROM %s", tableName);
      PreparedStatement statement = connection.prepareStatement(sql);
      resultSet = statement.executeQuery();
    } catch (SQLException ex) {
      System.err.println("Error en findAll(String tableName): " + ex.getMessage());
    }
    return resultSet;
  }

  protected ResultSet findWithWhere(String tableName, String whereCondition, Object... whereArgs) throws SQLException {
    ResultSet result = null;
    Connection connection = this.database.connect();
    String query = String.format("SELECT * FROM %s WHERE %s", tableName, whereCondition);
    PreparedStatement prepare = connection.prepareStatement(query);
    int cont = 1;
    for (Object arg : whereArgs) {
      prepare.setObject(cont++, arg);
    }
    result = prepare.executeQuery();
    return result;
  }

  /**
   * El primer argumento es el nombre del procedimiento en este se le puede
   * poner el comodin "?"
   *
   * Retornara un objeto prepare que servira para añadir los datos de los
   * comodines (?) ejemplo: callProcedure("add_categories(?, ?)")
   *
   * @param procedureName String
   * @param args
   * @return PreparedStatement
   * @throws java.sql.SQLIntegrityConstraintViolationException
   */
  protected int callProcedure(String procedureName, Object... args)
      throws SQLIntegrityConstraintViolationException, SQLException {
    Connection connection = this.database.connect();
    String query = String.format("CALL %s", procedureName);
    PreparedStatement prepare = connection.prepareStatement(query);
    int cont = 1;
    for (Object arg : args) {
      prepare.setObject(cont++, arg);
    }
    int result = prepare.executeUpdate();
    // el commit es necesario para que otras sesiones vean los cambios
    connection.commit();

    return result;
  }
}
