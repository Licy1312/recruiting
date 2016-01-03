package com.corlymeng.model;

import java.util.Date;
import java.util.List;
import java.util.Set;
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
 * Required entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see com.corlymeng.model.Required
 * @author MyEclipse Persistence Tools
 */
@Transactional
public class RequiredDAO {
	private static final Logger log = LoggerFactory
			.getLogger(RequiredDAO.class);
	// property constants
	public static final String TITLE = "title";
	public static final String SALARY = "salary";
	public static final String ADDRESS = "address";
	public static final String INTRO = "intro";

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

	public void save(Required transientInstance) {
		log.debug("saving Required instance");
		try {
			getCurrentSession().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Required persistentInstance) {
		log.debug("deleting Required instance");
		try {
			getCurrentSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Required findById(java.lang.Integer id) {
		log.debug("getting Required instance with id: " + id);
		try {
			Required instance = (Required) getCurrentSession().get(
					"com.corlymeng.model.Required", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List<Required> findByExample(Required instance) {
		log.debug("finding Required instance by example");
		try {
			List<Required> results = (List<Required>) getCurrentSession()
					.createCriteria("com.corlymeng.model.Required")
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
		log.debug("finding Required instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Required as model where model."
					+ propertyName + "= ?";
			Query queryObject = getCurrentSession().createQuery(queryString);
			queryObject.setParameter(0, value);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List<Required> findByTitle(Object title) {
		return findByProperty(TITLE, title);
	}

	public List<Required> findBySalary(Object salary) {
		return findByProperty(SALARY, salary);
	}

	public List<Required> findByAddress(Object address) {
		return findByProperty(ADDRESS, address);
	}

	public List<Required> findByIntro(Object intro) {
		return findByProperty(INTRO, intro);
	}

	public List findAll() {
		log.debug("finding all Required instances");
		try {
			String queryString = "from Required";
			Query queryObject = getCurrentSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Required merge(Required detachedInstance) {
		log.debug("merging Required instance");
		try {
			Required result = (Required) getCurrentSession().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Required instance) {
		log.debug("attaching dirty Required instance");
		try {
			getCurrentSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Required instance) {
		log.debug("attaching clean Required instance");
		try {
			getCurrentSession().buildLockRequest(LockOptions.NONE).lock(
					instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static RequiredDAO getFromApplicationContext(ApplicationContext ctx) {
		return (RequiredDAO) ctx.getBean("RequiredDAO");
	}
}