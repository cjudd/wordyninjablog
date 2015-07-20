package ninja.wordy.blog.repository;

import ninja.wordy.blog.model.Post;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface PostRepository extends CrudRepository<Post, Long> {


    @Query(value = "select p from Post p order by p.createdDate desc")
    List<Post> findMostRecentPosts(Pageable pageable);
}
