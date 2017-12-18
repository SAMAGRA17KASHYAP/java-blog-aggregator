package dir.samagra.repository;

import java.util.List;

import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import dir.samagra.entity.Blog;
import dir.samagra.entity.Item;

public interface ItemRepository extends JpaRepository<Item, Integer>{
	List<Item> findByBlog(Blog blog,Pageable pageable);
}
