package dir.samagra.repository;


import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import dir.samagra.entity.Blog;
import dir.samagra.entity.User;

public interface BlogRepository extends JpaRepository<Blog, Integer>{
	List<Blog> findByUser(User user);
}
