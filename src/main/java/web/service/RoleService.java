package web.service;

import web.model.Role;

public interface RoleService {

    Role getRoleById(Integer id);
    Role getRoleByName(String name);
}
