package com.shop.dao;

import com.shop.entities.Tower;
import com.shop.entities.TowerManufacturer;
import com.shop.entities.TowerType;
import java.util.List;
import javax.persistence.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class TowerDao implements InterfaceDao<Tower> {

    @Autowired
    private SessionFactory sessionFactory;

    private Session getSession() {
        return sessionFactory.getCurrentSession();
    }

    @Override
    public List<Tower> findAll() {
        Query q = getSession().createNamedQuery("Tower.findAll");
        return q.getResultList();
    }

    @Override
    public boolean createOrUpdate(Tower tower) {
        try {
            getSession().saveOrUpdate(tower);
            return true;
        } catch (Exception e) {
            return false;
        }
    }

    public List<TowerManufacturer> findAllManufacturers() {
        Query q = getSession().createNamedQuery("TowerManufacturer.findAll");
        return q.getResultList();
    }

    public List<Tower> findByManufacturer(Integer manufacturer) {
        TowerManufacturer m = getSession().byId(TowerManufacturer.class).load(manufacturer);
        Query q = getSession().createQuery("SELECT t FROM Tower t WHERE t.manufacturer= :m");
        q.setParameter("m", m);
        return q.getResultList();
    }

    public List<TowerType> findAllTypes() {
        Query q = getSession().createNamedQuery("TowerType.findAll");
        return q.getResultList();
    }

    public List<Tower> findByType(Integer type) {
        TowerType tt = getSession().byId(TowerType.class).load(type);
        Query q = getSession().createQuery("SELECT t FROM Tower t WHERE t.towerType= :tt");
        q.setParameter("tt", tt);
        return q.getResultList();
    }

    public TowerManufacturer findByManufacturerId(Integer manufacturer) {
        return getSession().byId(TowerManufacturer.class).load(manufacturer);
    }

    public TowerType findByTypeId(Integer type) {
        return getSession().byId(TowerType.class).load(type);
    }

    public Tower findById(Integer productId) {
        Query q = getSession().createNamedQuery("Tower.findById");
        q.setParameter("id", productId);
        List<Tower> list = q.getResultList();
        if(list != null){
            return list.get(0);
        }else{
            return null;
        }
    }

}
