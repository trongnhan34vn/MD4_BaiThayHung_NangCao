package service;

import java.util.List;

public interface IGenericService<E> {
    List<E> findAll();
    void save(E e);
    void findById(int id);
    void remove(int id);
}
