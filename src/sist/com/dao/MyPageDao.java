package sist.com.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import sist.com.model.SemiCompanyBean;
import sist.com.model.SemiMemberBean;
import sist.com.model.SemiProductBean;
import sist.com.model.SemiReserveBean;

public class MyPageDao {
	private static SqlSessionFactory sqlSessionFactory;
	static {
		sqlSessionFactory = SqlSessionFactoryManager.getSqlSessionFactory();
	}
	
	public static SemiMemberBean selectMember(String id) {
		SqlSession sqlSession = null;
		try {
			sqlSession = sqlSessionFactory.openSession();
			return sqlSession.selectOne("mySelectMember", id);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			try {
				sqlSession.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		return null;
	}
	public static List<SemiReserveBean> selectReserve(String id){
		SqlSession sqlSession = null;
		try {
			sqlSession = sqlSessionFactory.openSession();
			return sqlSession.selectList("mySelectReserve", id);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			try {
				sqlSession.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		return null;
	}
	public static SemiProductBean selectProduct(int pno) {
		SqlSession sqlSession = null;
		try {
			sqlSession = sqlSessionFactory.openSession();
			return sqlSession.selectOne("mySelectProduct", pno);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			try {
				sqlSession.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		return null;
	}
	public static SemiCompanyBean selectCompany(int cno) {
		SqlSession sqlSession = null;
		try {
			sqlSession = sqlSessionFactory.openSession();
			return sqlSession.selectOne("mySelectCompany", cno);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			try {
				sqlSession.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		return null;
	}
	public static void updateMember(SemiMemberBean bean) {
		SqlSession sqlSession = null;
		try {
			sqlSession = sqlSessionFactory.openSession();
			sqlSession.update("myUpdateMember", bean);
			sqlSession.commit();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			try {
				sqlSession.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
	}
}
