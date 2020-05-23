package web.dao;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import web.model.Role;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

@Repository
@Transactional(readOnly = true)
public class RoleDaoImpl implements RoleDao {

    @PersistenceContext
    private EntityManager entityManager;

    @Override
    public Role getRoleById(Integer id) {
        TypedQuery<Role> query = entityManager.createQuery(
                "select r from Role r where r.id =:id", Role.class
        );
        query.setParameter("id", id);
        return query.getResultList().stream().findAny().orElse(null);
    }

    @Override
    public Role getRoleByName(String roleName) {
        TypedQuery<Role> query = entityManager.createQuery(
                "select r from Role r where r.roleName=:name", Role.class
        );
        query.setParameter("name", roleName);
        return query.getResultList().stream().findAny().orElse(null);
    }
}

