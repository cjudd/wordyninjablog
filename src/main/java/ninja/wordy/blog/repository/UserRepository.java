package ninja.wordy.blog.repository;

import ninja.wordy.blog.model.User;
import org.springframework.data.repository.CrudRepository;

public interface UserRepository extends CrudRepository<User, Long> {

}
