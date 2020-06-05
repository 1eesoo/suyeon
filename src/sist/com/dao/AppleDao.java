package sist.com.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import sist.com.model.SemiCompanyBean;
import sist.com.model.SemiEventBean;
import sist.com.model.SemiMemberBean;
import sist.com.model.SemiNoticeBean;
import sist.com.model.SemiProductBean;
import sist.com.model.SemiQnaBean;

public class AppleDao {
	private static SqlSessionFactory sqlSessionFactory;
	static {
		sqlSessionFactory = SqlSessionFactoryManager.getSqlSessionFactory();
	}

	
	public static List<SemiProductBean> selectPreferProductFromAge(String str) {
	
		SqlSession sqlSession = null;
		try {
			sqlSession = sqlSessionFactory.openSession();
			return sqlSession.selectList("selectPreferProductFromAge", str);
		} catch (Exception e) {
			
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		return null;
	}
public static String selectAgeGroup(String id) {
	SqlSession sqlSession = null;
	try {
		sqlSession = sqlSessionFactory.openSession();
		return sqlSession.selectOne("selectAgeGroup",id);
	} catch (Exception e) {
		
		e.printStackTrace();
	}finally {
		sqlSession.close();
	}
	return null;
}
public static void updateQstate(Integer qno) {
	SqlSession sqlSession = null;
	
	try {
		sqlSession = sqlSessionFactory.openSession();
		
		sqlSession.update("updateQstate",qno);
		sqlSession.commit();
	} catch (Exception e) {
		sqlSession.rollback();
		e.printStackTrace();
	}finally {
		sqlSession.close();
	}
	
}
public static void updateEprogress(Integer eno) {
	SqlSession sqlSession = null;
	
	try {
		sqlSession = sqlSessionFactory.openSession();
		
		sqlSession.update("updateEprogress",eno);
		sqlSession.commit();
	} catch (Exception e) {
		sqlSession.rollback();
		e.printStackTrace();
	}finally {
		sqlSession.close();
	}
	
}
public static Integer getProductTotalRow() {
	SqlSession sqlSession = null;
	try {
		sqlSession = sqlSessionFactory.openSession();

		return sqlSession.selectOne("getProductTotalRow");
		
	} catch (Exception e) {
		e.printStackTrace();
	
	} finally {
		sqlSession.close();
	}
	return null;
	
	
}
public static void deleteReview(Integer num) {
	SqlSession sqlSession = null;
	try{
		sqlSession = sqlSessionFactory.openSession();
		sqlSession.delete("deleteReview",num);
		sqlSession.commit();
	}catch(Exception e) {
		
		e.printStackTrace();
		sqlSession.rollback();
	}finally {
		sqlSession.close();
	}
}

public static void updateReview(HashMap<String, Object>map) {
	SqlSession sqlSession= null;
	try{
		sqlSession = sqlSessionFactory.openSession();
		
		sqlSession.update("updateReview",map);
		
		sqlSession.commit();
	}catch(Exception e) {
		sqlSession.rollback();
		e.printStackTrace();
	}finally {
		sqlSession.close();
	}
}

public static Integer getReviewTotalRow() {
	SqlSession sqlSession = null;
	try {
		sqlSession = sqlSessionFactory.openSession();
		
		return sqlSession.selectOne("getReviewTotalRow");
	}catch (Exception e) {
		e.printStackTrace();
	}finally {
		sqlSession.close();
	}
	return null;
}

public static Object ReviewInfo(int no) {
	SqlSession sqlSession = null;
	try {
	sqlSession = sqlSessionFactory.openSession();
	return sqlSession.selectOne("ReviewInfo",no);
	}catch (Exception e) {
		e.printStackTrace();
	}finally {
		sqlSession.close();
	}
	return null;
}
	
	
	




	public static boolean companyIdCheck(String cname) {
		
			SqlSession sqlsession=null;
			String rsId=null;
			try {
				sqlsession=sqlSessionFactory.openSession();
				rsId=sqlsession.selectOne("companyIdCheck", cname);
				
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}finally {
				try {
					if(sqlsession!=null)sqlsession.close();				
				} catch (Exception e2) {
					// TODO: handle exception
				}
			}
			return rsId==null||rsId.equals("")?false:true;
	
	}
	public static List<SemiCompanyBean> selectCompany(){
		
		SqlSession sqlSession = null;
		try {
			sqlSession = sqlSessionFactory.openSession();
			return sqlSession.selectList("selectCompany");
		} catch (Exception e) {
			sqlSession.rollback();
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		
		return null;
	}
	public static List<SemiEventBean> selectEvent(HashMap<String, Object> map) {
		SqlSession sqlSession = null;

		try {
			sqlSession = sqlSessionFactory.openSession();
			return sqlSession.selectList("selectEvent", map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}

		return null;
	}

	public static List<SemiNoticeBean> selectNotice(HashMap<String, Object> map) {
		SqlSession sqlSession = null;

		try {
			sqlSession = sqlSessionFactory.openSession();
			return sqlSession.selectList("selectNotice", map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}

		return null;
	}

	public static List<SemiQnaBean> selectQna(HashMap<String, Object> map) {
		SqlSession sqlSession = null;

		try {
			sqlSession = sqlSessionFactory.openSession();
			return sqlSession.selectList("selectQna", map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}

		return null;
	}

	public static void insertQna(SemiQnaBean sq) {
		SqlSession sqlSession = null;
		try {
			sqlSession = sqlSessionFactory.openSession();
			sqlSession.insert("insertQna", sq);
			sqlSession.commit();
		} catch (Exception e) {

			e.printStackTrace();
			sqlSession.rollback();
		} finally {
			sqlSession.close();
		}
	}

	public static void insertNotice(SemiNoticeBean sn) {
		SqlSession sqlSession = null;
		try {
			sqlSession = sqlSessionFactory.openSession();
			sqlSession.insert("insertNotice", sn);
			sqlSession.commit();
		} catch (Exception e) {

			e.printStackTrace();
			sqlSession.rollback();
		} finally {
			sqlSession.close();
		}

	}

	public static void insertEvent(SemiEventBean se) {

		SqlSession sqlSession = null;
		try {
			sqlSession = sqlSessionFactory.openSession();
			sqlSession.insert("insertEvent", se);
			sqlSession.commit();
		} catch (Exception e) {

			e.printStackTrace();
			sqlSession.rollback();
		} finally {
			sqlSession.close();
		}

	}
	public static void insertCompany(SemiCompanyBean sc) {
		
		SqlSession sqlSession = null;
		try {
			sqlSession = sqlSessionFactory.openSession();
			sqlSession.insert("insertCompany", sc);
			sqlSession.commit();
		} catch (Exception e) {
			
			e.printStackTrace();
			sqlSession.rollback();
		} finally {
			sqlSession.close();
		}
		
	}
	public static void insertProduct(SemiProductBean sc) {
		
		SqlSession sqlSession = null;
		try {
			sqlSession = sqlSessionFactory.openSession();
			sqlSession.insert("insertProduct", sc);
			sqlSession.commit();
		} catch (Exception e) {	
			e.printStackTrace();
			sqlSession.rollback();
		} finally {
			sqlSession.close();
		}
		
	}

	public static void deleteQna(Integer num) {
		SqlSession sqlSession = null;
		try {
			sqlSession = sqlSessionFactory.openSession();
			sqlSession.delete("deleteQna", num);
			sqlSession.commit();
		} catch (Exception e) {

			e.printStackTrace();
			sqlSession.rollback();
		} finally {
			sqlSession.close();
		}

	}

	public static void deleteNotice(Integer num) {
		SqlSession sqlSession = null;
		try {
			sqlSession = sqlSessionFactory.openSession();
			sqlSession.delete("deleteNotice", num);
			sqlSession.commit();
		} catch (Exception e) {

			e.printStackTrace();
			sqlSession.rollback();
		} finally {
			sqlSession.close();
		}
	}

	public static void deleteEvent(Integer num) {
		SqlSession sqlSession = null;
		try {
			sqlSession = sqlSessionFactory.openSession();
			sqlSession.delete("deleteEvent", num);
			sqlSession.commit();
		} catch (Exception e) {

			e.printStackTrace();
			sqlSession.rollback();
		} finally {
			sqlSession.close();
		}
	}

	public static void updateQna(SemiQnaBean sqb) {
		SqlSession sqlSession = null;
		try {
			sqlSession = sqlSessionFactory.openSession();

			sqlSession.update("updateQna", sqb);

			sqlSession.commit();
		} catch (Exception e) {
			sqlSession.rollback();
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
	}

	public static void updateNotice(SemiNoticeBean snb) {
		SqlSession sqlSession = null;
		try {
			sqlSession = sqlSessionFactory.openSession();

			sqlSession.update("updateNotice", snb);

			sqlSession.commit();
		} catch (Exception e) {
			sqlSession.rollback();
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
	}

	public static void updateEvent(SemiEventBean seb) {
		SqlSession sqlSession = null;
		try {
			sqlSession = sqlSessionFactory.openSession();

			sqlSession.update("updateEvent", seb);

			sqlSession.commit();
		} catch (Exception e) {
			sqlSession.rollback();
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
	}

	public static void updateStep(HashMap<String, Object> map) {
		SqlSession sqlSession = null;
		try {
			sqlSession = sqlSessionFactory.openSession();

			sqlSession.update("updateStep", map);

			sqlSession.commit();
		} catch (Exception e) {
			sqlSession.rollback();
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
	}

	public static void updateReply(HashMap<String, Object> map) {
		SqlSession sqlSession = null;
		try {
			sqlSession = sqlSessionFactory.openSession();

			sqlSession.update("updateReply", map);

			sqlSession.commit();
		} catch (Exception e) {
			sqlSession.rollback();
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
	}

	public static Integer getQnaSequence() {
		SqlSession sqlSession = null;
		try {
			sqlSession = sqlSessionFactory.openSession();
			return sqlSession.selectOne("getQnaSequence");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return null;
	}

	public static Integer getNoticeSequence() {
		SqlSession sqlSession = null;
		try {
			sqlSession = sqlSessionFactory.openSession();
			return sqlSession.selectOne("getNoticeSequence");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return null;
	}

	public static Integer getEventSequence() {
		SqlSession sqlSession = null;
		try {
			sqlSession = sqlSessionFactory.openSession();
			return sqlSession.selectOne("getEventSequence");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return null;
	}
	public static Integer getReviewSequence() {
		SqlSession sqlSession = null;
		try {
			sqlSession = sqlSessionFactory.openSession();
			return sqlSession.selectOne("getReviewSequence");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return null;
	}
	public static Integer getCompanySequence() {
		SqlSession sqlSession = null;
		try {
			sqlSession = sqlSessionFactory.openSession();
			return sqlSession.selectOne("getCompanySequence");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return null;
	}
	public static Integer getReserveSequence() {
		SqlSession sqlSession = null;
		try {
			sqlSession = sqlSessionFactory.openSession();
			return sqlSession.selectOne("getReserveSequence");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return null;
	}
	public static Integer getPreferSequence() {
		SqlSession sqlSession = null;
		try {
			sqlSession = sqlSessionFactory.openSession();
			return sqlSession.selectOne("getPreferSequence");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return null;
	}
	public static Integer getProductSequence() {
		SqlSession sqlSession = null;
		try {
			sqlSession = sqlSessionFactory.openSession();
			return sqlSession.selectOne("getProductSequence");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return null;
	}
	
	public static String getCnameFromPno(Integer pno) {
		SqlSession sqlSession = null;
		try {
			sqlSession = sqlSessionFactory.openSession();
			return sqlSession.selectOne("getCnameFromPno", pno);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return null;
	}

	public static Integer getCnoFromPno(Integer pno) {
		SqlSession sqlSession = null;
		try {
			sqlSession = sqlSessionFactory.openSession();
			return sqlSession.selectOne("getCnoFromPno", pno);
		} catch (Exception e) {

			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return null;
	}


	public static Integer getEventTotalRow() {
		SqlSession sqlSession = null;
		try {
			sqlSession = sqlSessionFactory.openSession();

			return sqlSession.selectOne("EventTotalRow");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return null;
	}

	public static Integer getNoticeTotalRow() {
		SqlSession sqlSession = null;
		try {
			sqlSession = sqlSessionFactory.openSession();

			return sqlSession.selectOne("NoticeTotalRow");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return null;
	}

	public static Integer getQnaTotalRow() {
		SqlSession sqlSession = null;
		try {
			sqlSession = sqlSessionFactory.openSession();

			return sqlSession.selectOne("QnaTotalRow");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return null;
	}

	public static List<SemiProductBean> selectProduct(HashMap<String,Object> map) {
		SqlSession sqlSession = null;

		try {
			sqlSession = sqlSessionFactory.openSession();
			return sqlSession.selectList("selectProduct",map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}

		return null;
	}

	public static List<SemiProductBean> selectAllProduct(){
		SqlSession sqlSession = null;
		try {
			sqlSession = sqlSessionFactory.openSession();
			return sqlSession.selectList("selectAllProduct");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}
	public static Object qnaInfo(int no) {
		SqlSession sqlSession = null;
		try {
			sqlSession = sqlSessionFactory.openSession();
			return sqlSession.selectOne("qnaInfo", no);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return null;
	}

	public static Object noticeInfo(int no) {
		SqlSession sqlSession = null;
		try {
			sqlSession = sqlSessionFactory.openSession();
			return sqlSession.selectOne("noticeInfo", no);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return null;
	}

	public static Object eventInfo(int no) {
		SqlSession sqlSession = null;
		try {
			sqlSession = sqlSessionFactory.openSession();
			return sqlSession.selectOne("eventInfo", no);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return null;
	}

	public static boolean idcheckProcess(String id, String password) {

		SqlSession sqlSession = null;
		try {
			sqlSession = sqlSessionFactory.openSession();

			String dbPass = sqlSession.selectOne("idcheckProcess", id);

			if (dbPass != null && dbPass.equals(password)) {
				return true;
			}

		} catch (Exception e) {
			sqlSession.rollback();
		} finally {
			try {
				sqlSession.close();
			} catch (Exception e) {
				sqlSession.rollback();
			}
		}
		return false;
	}

	public static void insertMember(SemiMemberBean mb) {

		SqlSession sqlSession = null;
		try {
			sqlSession = sqlSessionFactory.openSession();

			sqlSession.insert("insertMember", mb);

			sqlSession.commit();
		} catch (Exception e) {
			sqlSession.rollback();
		} finally {
			try {
				sqlSession.close();
			} catch (Exception e) {
				sqlSession.rollback();
			}
		}
	}

	public static String selectPnameFromPno(Integer no) {
		SqlSession sqlSession = null;
		try {
			sqlSession = sqlSessionFactory.openSession();

			return sqlSession.selectOne("selectPnameFromPno", no);
		} catch (Exception e) {
			sqlSession.rollback();
		} finally {
			try {
				sqlSession.close();
			} catch (Exception e) {
				sqlSession.rollback();
			}
		}
		return null;
	}
}
