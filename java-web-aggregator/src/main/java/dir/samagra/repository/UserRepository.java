package dir.samagra.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import dir.samagra.entity.User;

public interface UserRepository extends JpaRepository<User, Integer>{

}
