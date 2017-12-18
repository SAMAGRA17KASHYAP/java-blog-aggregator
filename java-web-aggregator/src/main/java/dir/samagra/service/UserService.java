package dir.samagra.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Service;

import dir.samagra.entity.Blog;
import dir.samagra.entity.Item;
import dir.samagra.entity.User;
import dir.samagra.repository.BlogRepository;
import dir.samagra.repository.ItemRepository;
import dir.samagra.repository.UserRepository;

@Service
@Transactional
public class UserService {

	@Autowired
	private UserRepository userRepository;
	
	@Autowired
	private BlogRepository blogRepository;
	
	@Autowired
	private ItemRepository itemRepository;
	
	public List<User> getAll(){
		return userRepository.findAll();
	}

	public User findOne(int id) {
		return userRepository.findOne(id);
	}

	public User findOneWithBlogs(int id) {
		User user=userRepository.findOne(id);
		List<Blog> blogs=blogRepository.findByUser(user);
		for(Blog blog:blogs) {
			List<Item> items=itemRepository.findByBlog(blog,new PageRequest(0, 10, Direction.DESC, "publishedDate"));
			blog.setItems(items);
		}
		user.setBlogs(blogs);
		return user;
	}

	public void save(User user) {
		userRepository.save(user);
	}
}
