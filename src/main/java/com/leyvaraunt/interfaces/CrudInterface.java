/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.leyvaraunt.interfaces;

import java.util.ArrayList;

/**
 *
 * @author Cristhian
 */
public interface CrudInterface {
  public ArrayList<EntitieInterface> getAll();
  public EntitieInterface getById(int id);
  public boolean updateAll(ArrayList<EntitieInterface> newsEntities);
  public boolean updateById(int id, EntitieInterface newEntitie);
  public boolean deleteById(int id);
}
