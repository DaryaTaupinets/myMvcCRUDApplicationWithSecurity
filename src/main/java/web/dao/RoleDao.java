package web.dao;

import web.model.Role;

public interface RoleDao {

    //read
    Role getRoleById(Integer id);

    Role getRoleByName(String roleName);
}
