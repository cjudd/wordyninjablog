package ninja.wordy.blog.repository;

import ninja.wordy.blog.model.Post;
import org.springframework.data.repository.CrudRepository;

public interface PostRepository extends CrudRepository<Post, Long> {

}
