package sist.com.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import sist.com.model.SemiProductBean;

public class APListDao {
	private static SqlSessionFactory sqlSessionFactory;
	static {
		sqlSessionFactory=SqlSessionFactoryManager.getSqlSessionFactory();
	}
	public static List<SemiProductBean> selectProduct(){
		SqlSession sqlSession=null;
		try {
			sqlSession=sqlSessionFactory.openSession();
			return sqlSession.selectList("APselectProduct");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(sqlSession!=null) sqlSession.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		return null;
	}
	public static void updateProduct(SemiProductBean bean) {
		SqlSession sqlSession=null;
		try {
			sqlSession=sqlSessionFactory.openSession();
			sqlSession.update("APupdateProduct", bean);
			sqlSession.commit();
			System.out.println("updateProduct");
			System.out.println(bean);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("updateProduct 실패");
		} finally {
			try {
				if(sqlSession!=null) sqlSession.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
	}
}
