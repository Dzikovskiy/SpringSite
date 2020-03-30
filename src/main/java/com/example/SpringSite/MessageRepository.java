package com.example.SpringSite;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface MessageRepository extends CrudRepository<Message, Integer> {
    List<Message> findByTag(String tag);
    List<Message> findByText(String text);
    Optional<Message> findById(Integer id);

}
