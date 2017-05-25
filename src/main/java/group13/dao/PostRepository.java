package group13.dao;



import org.springframework.data.repository.CrudRepository;

import group13.model.Post;

public interface PostRepository extends CrudRepository<Post, Integer> {

}

