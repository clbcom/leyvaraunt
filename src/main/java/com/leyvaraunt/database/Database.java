/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.leyvaraunt.database;

import com.leyvaraunt.config.Constants;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author Cristhian
 */
public class Database {

  private Connection connection;

  final private String host;
  final private int port;
  final private String database;
  final private String user;
  final private String password;
  final private String url;

  public Database() {
    this.host     = Constants.HOST;
    this.port     = Constants.PORT;
    this.database = Constants.DATABASE;
    this.user     = Constants.USER;
    this.password = Constants.PASSWORD;
    this.url      = String.format("jdbc:mysql://%s:%d/%s", this.host, this.port, this.database);
  }

  public Connection connect() {
    try {
      Class.forName("com.mysql.cj.jdbc.Driver");
      this.connection = DriverManager.getConnection(this.url, this.user, this.password);
      this.connection.setAutoCommit(false);
    } catch (ClassNotFoundException | SQLException ex) {
      System.err.println("Connect database fail: " + ex.getMessage());
    }
    return this.connection;
  }

  public void close() {
    try {
      this.connection.close();
    } catch (SQLException ex) {
      System.err.println("Close database fail: " + ex.getMessage());

    }
  }
}
