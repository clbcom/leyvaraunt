package com.leyvaraunt.entities;

import com.leyvaraunt.interfaces.EntitieInterface;

public class History implements EntitieInterface {
  private int id;
  private String type;
  private String description;
  private String date;

  public History() {
  }

  public History(String type) {
    this.type = type;
  }

  public int getId() {
    return id;
  }

  public void setId(int id) {
    this.id = id;
  }

  public String getType() {
    return type;
  }

  public void setType(String type) {
    this.type = type;
  }

  public String getDescription() {
    return description;
  }

  public void setDescription(String description) {
    this.description = description;
  }

  public String getDate() {
    return date;
  }

  public void setDate(String date) {
    this.date = date;
  }

  @Override
  public String toString() {
    return "History [id=" + id + ", type=" + type + ", description=" + description + ", date=" + date + "]";
  }
}
