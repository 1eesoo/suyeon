package sist.com.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import sist.com.model.SemiReserveBean;
import sist.com.model.SemiReviewBean;

public class SuyeonSemiDao {
	private static SqlSessionFactory sqlSessionFactory;
	static {
		sqlSessionFactory=SqlSessionFactoryManager.getSqlSessionFactory();
	}
	
	public static List<SemiReviewBean> selectReview(){
		SqlSession sqlSession=null;
		try {
			sqlSession=sqlSessionFactory.openSession();
			return sqlSession.selectList("selectReview");
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			if(sqlSession!=null)sqlSession.close();
		}
		return null;
	}
	
	public static void insertReview(SemiReviewBean bean) {
		SqlSession session=null;
		try {
			session=sqlSessionFactory.openSession();
			session.insert("insertReview",bean);
			session.commit();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			session.rollback();
		}finally {
			try {
				if(session!=null)session.close();				
			} catch (Exception e2) {
				// TODO: handle exception
				session.rollback();
			}
		}
	}
	public static Integer countReview() {
		SqlSession session=null;
		try {
			session=sqlSessionFactory.openSession();
			session.selectOne("countReview");
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			if(session!=null)session.close();
		}
		return 0;
	}
	public static List<SemiReserveBean> selectReserved(String id){
		SqlSession session=null;
		try {
			session=sqlSessionFactory.openSession();
			return session.selectList("selectReserved",id);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			if(session!=null)session.close();
		}		
		return null;
	}
	public static String selectProductName(int pno) {
		SqlSession session=null;
		try {
			session=sqlSessionFactory.openSession();
			return session.selectOne("selectProductName",pno);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return "";
	}
}
