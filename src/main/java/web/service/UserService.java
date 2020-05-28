package web.service;

import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import web.model.User;

import java.util.List;

public interface UserService {

    //create
    void addUser(User user);

    //read
    List<User> getAllUsers();

    User getUserById(Integer id);

    User getUserByName(String name);

    //update
    void updateUser(User user);

    //delete
    void deleteUser(User user);
}
