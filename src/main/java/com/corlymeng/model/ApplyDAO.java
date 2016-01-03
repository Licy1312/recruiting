package com.corlymeng.model;

import java.util.Date;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.LockOptions;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;

import static org.hibernate.criterion.Example.create;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.transaction.annotation.Transactional;

/**
 * A data access object (DAO) providing persistence and search support for Apply
 * entities. Transaction control of the save(), update() and delete() operations
 * can directly support Spring container-managed transactions or they can be
 * augmented to handle user-managed Spring transactions. Each of these methods
 * provides additional information for how to configure it for the desired type
 * of transaction control.
 * 
 * @see com.corlymeng.model.Apply
 * @author MyEclipse Persistence Tools
 */
@Transactional
public class ApplyDAO {
	private static final Logger log = LoggerFactory.getLogger(ApplyDAO.class);
	// property constants
	public static final String TIME = "time";
	public static final String IS_CONFIRM = "isConfirm";
	public static final String REMARK = "remark";

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

	public void save(Apply transientInstance) {
		log.debug("saving Apply instance");
		try {
			getCurrentSession().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Apply persistentInstance) {
		log.debug("deleting Apply instance");
		try {
			getCurrentSession().delete(persistentInstance);
			getCurrentSession().flush();
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Apply findById(java.lang.Integer id) {
		log.debug("getting Apply instance with id: " + id);
		try {
			Apply instance = (Apply) getCurrentSession().get(
					"com.corlymeng.model.Apply", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List<Apply> findByExample(Apply instance) {
		log.debug("finding Apply instance by example");
		try {
			List<Apply> results = (List<Apply>) getCurrentSession()
					.createCriteria("com.corlymeng.model.Apply")
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
		log.debug("finding Apply instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Apply as model where model."
					+ propertyName + "= ?";
			Query queryObject = getCurrentSession().createQuery(queryString);
			queryObject.setParameter(0, value);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List<Apply> findByTime(Object time) {
		return findByProperty(TIME, time);
	}

	public List<Apply> findByIsConfirm(Object isConfirm) {
		return findByProperty(IS_CONFIRM, isConfirm);
	}

	public List<Apply> findByRemark(Object remark) {
		return findByProperty(REMARK, remark);
	}

	public List findAll() {
		log.debug("finding all Apply instances");
		try {
			String queryString = "from Apply";
			Query queryObject = getCurrentSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	
	public List<Apply> findByUserAndRequired(User user, Required required) {
		log.debug("finding Apply instance by example");
		try {
			Session session = getCurrentSession();
			Criteria criteria = session.createCriteria(Apply.class);
			if (user != null) {
				criteria.add(Restrictions.eq("user", user));
			}
			if (required != null) {
				criteria.add(Restrictions.eq("required", required));
			}
			List<Apply> results = criteria.list();
			
			log.debug("find by example successful, result size: "
					+ results.size());
			return results;
		} catch (RuntimeException re) {
			log.error("find by example failed", re);
			throw re;
		}
	}

	public Apply merge(Apply detachedInstance) {
		log.debug("merging Apply instance");
		try {
			Apply result = (Apply) getCurrentSession().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Apply instance) {
		log.debug("attaching dirty Apply instance");
		try {
			getCurrentSession().saveOrUpdate(instance);
			getCurrentSession().flush();
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Apply instance) {
		log.debug("attaching clean Apply instance");
		try {
			getCurrentSession().buildLockRequest(LockOptions.NONE).lock(
					instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}
	
//	public int getApplyNums(Date date) {
//		log.debug("getting Apply nums with date: " + date);
//		try {
//			String hql = "select count(id) from apply where applytime=?";
//			Query = getCurrentSession().createQuery(date);
//			Apply instance = (Apply) getCurrentSession().get(
//					"com.corlymeng.model.Apply", id);
//			return instance;
//		} catch (RuntimeException re) {
//			log.error("get failed", re);
//			throw re;
//		}
//	}
	
//	public boolean isApplied(Integer requiredId, Integer userId) {
//		String sql = "from Apply where requiredid=? and userid=?";
//		Query query = getCurrentSession().createQuery(sql);
//		query.setParameter(0, requiredId);
//		query.setParameter(1, userId);
//		Apply apply = (Apply) query.uniqueResult();
//		log.debug("isApplied:" + apply);
//		if (apply != null) {
//			return true;
//		}else {
//			return false;
//		}
//		
//	}
	
	public boolean isApplied(Integer userId) {
		String sql = "from Apply where userid=? and isConfirm =1 or isConfirm=-1";
		Query query = getCurrentSession().createQuery(sql);
		query.setParameter(0, userId);
		List<Apply> applys = query.list();

		if (applys.size() >0) {
			return true;
		}else {
			return false;
		}
		
	}

	public static ApplyDAO getFromApplicationContext(ApplicationContext ctx) {
		return (ApplyDAO) ctx.getBean("ApplyDAO");
	}
}