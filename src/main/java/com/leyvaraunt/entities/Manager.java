package com.leyvaraunt.entities;

import com.leyvaraunt.interfaces.EntitieInterface;

public class Manager implements EntitieInterface {
  private int id;
  private String name;
  private String lastname;
  private String username;
  private String password;

  public Manager() {
  }

  public Manager(int id, String name, String lastname, String username, String password) {
    this.id = id;
    this.name = name;
    this.lastname = lastname;
    this.username = username;
    this.password = password;
  }

  public int getId() {
    return id;
  }

  public void setId(int id) {
    this.id = id;
  }

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public String getLastname() {
    return lastname;
  }

  public void setLastname(String lastname) {
    this.lastname = lastname;
  }

  public String getUsername() {
    return username;
  }

  public void setUsername(String username) {
    this.username = username;
  }

  public String getPassword() {
    return password;
  }

  public void setPassword(String password) {
    this.password = password;
  }

  @Override
  public String toString() {
    return "Manager [id=" + id + ", name=" + name + ", lastname=" + lastname + ", username=" + username + "]";
  }
}
