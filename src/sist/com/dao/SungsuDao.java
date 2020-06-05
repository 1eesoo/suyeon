package sist.com.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import sist.com.model.SemiCompanyBean;
import sist.com.model.SemiProductBean;
import sist.com.model.SemiReserveBean;

public class SungsuDao {
	private static SqlSessionFactory sqlSessionFactory;
	static {
		sqlSessionFactory = SqlSessionFactoryManager.getSqlSessionFactory();
	}
	
	public static SemiProductBean anselectProductFromCno(Integer cno) {
		SqlSession sqlSession = null;
		
		try {
			sqlSession = sqlSessionFactory.openSession();
			return sqlSession.selectOne("anselectProductFromCno", cno);
		} catch (Exception e) {
			
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		return null;
	}
	
	public static SemiProductBean selectProductFromPname(String pname) {
		SqlSession sqlSession = null;
		
		try {
			sqlSession = sqlSessionFactory.openSession();
			return sqlSession.selectOne("selectProductFromPname",pname);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
	
		return null;
	}
	public static void anInsertsemireserve(SemiReserveBean srb) {
		SqlSession sqlSession =null;
		try {
			sqlSession = sqlSessionFactory.openSession();
			sqlSession.insert("anInsertsemireserve",srb);
			sqlSession.commit();
		} catch (Exception e) {
			sqlSession.rollback();
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		
	}
	public static SemiProductBean anselectProductFromPno(int pno) {
		
		SqlSession sqlSession = null;
		try {
			
			 sqlSession = sqlSessionFactory.openSession();
			return sqlSession.selectOne("anselectProductFromPno", pno);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			sqlSession.close();
			
		}
		
		return null;
		
	}
	public static List<SemiProductBean> selectPreferProductFromAge(String agegroup){
		
		SqlSession sqlSession = null;
		try {
			
			 sqlSession = sqlSessionFactory.openSession();
			return sqlSession.selectList("selectPreferProductFromAge", agegroup);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			sqlSession.close();
			
		}
		
		return null;
	}
	
	public static int anSelectGradeFromPno(int i) {
		SqlSession sqlSession = null;
		try {
			
			sqlSession = sqlSessionFactory.openSession();
			return (int) (sqlSession.selectOne("anSelectGradeFromPno", i)!=null?sqlSession.selectOne("anSelectGradeFromPno", i):0);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			sqlSession.close();
			
		}
		
		return 0;
	}
	
	public static int anSelectReviewCountFromPno(int pno) {
		SqlSession sqlSession = null;
		try {
			sqlSession = sqlSessionFactory.openSession();
			return (int) (sqlSession.selectOne("anSelectReviewCountFromPno", pno)!=null?sqlSession.selectOne("anSelectReviewCountFromPno", pno):0);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		
		return 0;
		
	}
}
