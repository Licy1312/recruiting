package com.corlymeng.model;

import java.util.Date;
import java.util.List;
import org.hibernate.LockOptions;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import static org.hibernate.criterion.Example.create;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.transaction.annotation.Transactional;

/**
 * A data access object (DAO) providing persistence and search support for
 * Collection entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see com.corlymeng.model.Collection
 * @author MyEclipse Persistence Tools
 */
@Transactional
public class CollectionDAO {
	private static final Logger log = LoggerFactory
			.getLogger(CollectionDAO.class);
	// property constants

	private SessionFactory sessionFactory;

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	private Session getCurrentSession() {
		return sessionFactory.getCurrentSession();
	}

	protected void initDao() {
		// do nothing
	}

	public void save(Collection transientInstance) {
		log.debug("saving Collection instance");
		try {
			getCurrentSession().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Collection persistentInstance) {
		log.debug("deleting Collection instance");
		try {
			getCurrentSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}
	
	public void delete1(Integer requireId, Integer userId) {
		String string = "DELETE from Collection where requiredid=? and userid=?";
		Query query = getCurrentSession().createQuery(string);
		query.setParameter(0, requireId);
		query.setParameter(1, userId);
		query.executeUpdate();
	}
	
	public boolean isCollected(Integer requiredId, Integer userId){
		String sql = "from Collection where requiredid=? and userid=?";
		Query query = getCurrentSession().createQuery(sql);
		query.setParameter(0, requiredId);
		query.setParameter(1, userId);
		Collection collection = (Collection) query.uniqueResult();
		log.debug("isCollected:" + collection);
		if (collection != null) {
			return true;
		}else {
			return false;
		}
	}

	public Collection findById(java.lang.Integer id) {
		log.debug("getting Collection instance with id: " + id);
		try {
			Collection instance = (Collection) getCurrentSession().get(
					"com.corlymeng.model.Collection", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List<Collection> findByExample(Collection instance) {
		log.debug("finding Collection instance by example");
		try {
			List<Collection> results = (List<Collection>) getCurrentSession()
					.createCriteria("com.corlymeng.model.Collection")
					.add(create(instance)).list();
			log.debug("find by example successful, result size: "
					+ results.size());
			return results;
		} catch (RuntimeException re) {
			log.error("find by example failed", re);
			throw re;
		}
	}

	public List findByProperty(String propertyName, Object value) {
		log.debug("finding Collection instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Collection as model where model."
					+ propertyName + "= ?";
			Query queryObject = getCurrentSession().createQuery(queryString);
			queryObject.setParameter(0, value);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findAll() {
		log.debug("finding all Collection instances");
		try {
			String queryString = "from Collection";
			Query queryObject = getCurrentSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Collection merge(Collection detachedInstance) {
		log.debug("merging Collection instance");
		try {
			Collection result = (Collection) getCurrentSession().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Collection instance) {
		log.debug("attaching dirty Collection instance");
		try {
			getCurrentSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Collection instance) {
		log.debug("attaching clean Collection instance");
		try {
			getCurrentSession().buildLockRequest(LockOptions.NONE).lock(
					instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static CollectionDAO getFromApplicationContext(ApplicationContext ctx) {
		return (CollectionDAO) ctx.getBean("CollectionDAO");
	}
}