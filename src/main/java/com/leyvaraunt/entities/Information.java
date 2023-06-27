package com.leyvaraunt.entities;

import com.leyvaraunt.interfaces.EntitieInterface;

public class Information implements EntitieInterface {
  private int id;
  private String description;
  private String location;
  private String schedule;

  public Information() {
  }

  public int getId() {
    return id;
  }

  public void setId(int id) {
    this.id = id;
  }

  public String getDescription() {
    return description;
  }

  public void setDescription(String description) {
    this.description = description;
  }

  public String getLocation() {
    return location;
  }

  public void setLocation(String location) {
    this.location = location;
  }

  public String getSchedule() {
    return schedule;
  }

  public void setSchedule(String schedule) {
    this.schedule = schedule;
  }

  @Override
  public String toString() {
    return "Information [id=" + id + ", description=" + description + ", location=" + location + ", schedule="
        + schedule + "]";
  }
}
