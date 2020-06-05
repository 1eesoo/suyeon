package sist.com.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import sist.com.model.SemiCompanyBean;
import sist.com.model.SemiList1;
import sist.com.model.SemiMemberBean;
import sist.com.model.SemiProductBean;
import sist.com.model.SemiQnaBean;

public class TaehoonDao {
	private static SqlSessionFactory sqlSessionFactory;
	static {
		sqlSessionFactory = SqlSessionFactoryManager.getSqlSessionFactory();
	}
	
//	public static List<SemiProductBean> selectProduct(){
//		SqlSession sqlSession = null;
//		
//		try {
//			sqlSession = sqlSessionFactory.openSession();
//			return sqlSession.selectList("selectProduct");
//		}catch (Exception e) {
//				e.printStackTrace();
//		}finally {
//			sqlSession.close();
//		}
//		
//		return null;
//	}
	public static List<SemiQnaBean> selectQna() {
		SqlSession sqlSession = null;
		
		try {
			sqlSession = sqlSessionFactory.openSession();
			return sqlSession.selectList("selectQna");
		}catch (Exception e) {
				e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		
		return null;
	}
	
	
	public static List<String> selectProductName1(int cno) {
		SqlSession sqlSession = null;
		
		try {
			sqlSession = sqlSessionFactory.openSession();
			return sqlSession.selectList("selectProductName1",cno);
		}catch (Exception e) {
				e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		
		return null;
	}
	public static List<String> selectComName1() {
		SqlSession sqlSession = null;
		
		try {
			sqlSession = sqlSessionFactory.openSession();
			return sqlSession.selectList("selectComName1");
		}catch (Exception e) {
				e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		
		return null;
	}
	public static boolean memeberIdCheck(String id) {
	      SqlSession sqlSession = null;
	      String rsId = null;
	      try {
	         sqlSession = sqlSessionFactory.openSession();
	         rsId = sqlSession.selectOne("memberIdCheck",id);
	         
	      } catch (Exception e) {
	         e.printStackTrace();
	         sqlSession.rollback();
	      }finally {
	         try {
	            if(sqlSession!=null)sqlSession.close();
	         } catch (Exception e2) {
	            // TODO: handle exception
	         }
	      }
	      
	      return rsId==null||rsId.equals("")?false:true;
	   }
	public static boolean idcheckProcess(String id, String password) {

			SqlSession sqlSession = null;
		try {
			sqlSession = sqlSessionFactory.openSession();
			
			String dbPass = sqlSession.selectOne("idcheckProcess",id);
			
			if(dbPass!=null && dbPass.equals(password)) {
				return true;
			}
			
		}catch(Exception e) {
			sqlSession.rollback();
		}finally {
			try {
			sqlSession.close();
			}catch(Exception e) {
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
	}catch(Exception e) {
		sqlSession.rollback();
	}finally {
		try {
		sqlSession.close();
		}catch(Exception e) {
			sqlSession.rollback();
		}
	}
	}
	
	public static int propriceCheck(String name) {
	      SqlSession sqlSession = null;
	      String rsId = null;
	      try {
	         sqlSession = sqlSessionFactory.openSession();
	         return sqlSession.selectOne("propriceCheck",name);	         
	      } catch (Exception e) {
	         e.printStackTrace();
	         sqlSession.rollback();
	      }finally {
	         try {
	            if(sqlSession!=null)sqlSession.close();
	         } catch (Exception e2) {
	            // TODO: handle exception
	         }
	      }
	      
	      return 0;
	   }
	public static String SeleComNameFun1(int no) {
	      SqlSession sqlSession = null;
	      try {
	         sqlSession = sqlSessionFactory.openSession();
	         return sqlSession.selectOne("SeleComNameFun1",no);	         
	      } catch (Exception e) {
	         e.printStackTrace();
	         sqlSession.rollback();
	      }finally {
	         try {
	            if(sqlSession!=null)sqlSession.close();
	         } catch (Exception e2) {
	            // TODO: handle exception
	         }
	      }
	      
	      return null;
	   }
	public static List<SemiList1> SeleMbltall() {
	      SqlSession sqlSession = null;
	      try {
	         sqlSession = sqlSessionFactory.openSession();
	         return sqlSession.selectList("SeleMbltall");	         
	      } catch (Exception e) {
	         e.printStackTrace();

	      }finally {
	         try {
	            if(sqlSession!=null)sqlSession.close();
	         } catch (Exception e2) {
	            // TODO: handle exception
	         }
	      }
	      
	      return null;
	   }
	public static List<SemiList1> SeleMbltIwannt() {
	      SqlSession sqlSession = null;
	      try {
	         sqlSession = sqlSessionFactory.openSession();
	         return sqlSession.selectList("SeleMbltIwannt");	         
	      } catch (Exception e) {
	         e.printStackTrace();
	         sqlSession.rollback();
	      }finally {
	         try {
	            if(sqlSession!=null)sqlSession.close();
	         } catch (Exception e2) {
	            // TODO: handle exception
	         }
	      }
	      
	      return null;
	   }
	public static List<SemiList1> SeleMbltIwannt1() {
	      SqlSession sqlSession = null;
	      try {
	         sqlSession = sqlSessionFactory.openSession();
	         return sqlSession.selectList("SeleMbltIwannt1");	         
	      } catch (Exception e) {
	         e.printStackTrace();
	         sqlSession.rollback();
	      }finally {
	         try {
	            if(sqlSession!=null)sqlSession.close();
	         } catch (Exception e2) {
	            // TODO: handle exception
	         }
	      }
	      
	      return null;
	   }
	public static List<SemiList1> seleComList() {
	      SqlSession sqlSession = null;
	      try {
	         sqlSession = sqlSessionFactory.openSession();
	         return sqlSession.selectList("seleComList");	         
	      } catch (Exception e) {
	         e.printStackTrace();
	         sqlSession.rollback();
	      }finally {
	         try {
	            if(sqlSession!=null)sqlSession.close();
	         } catch (Exception e2) {
	            // TODO: handle exception
	         }
	      }
	      
	      return null;
	   }
	public static int selePriceSum() {
	      SqlSession sqlSession = null;
	      try {
	         sqlSession = sqlSessionFactory.openSession();
	         return sqlSession.selectOne("selePriceSum");	         
	      } catch (Exception e) {
	         e.printStackTrace();
	         
	      }finally {
	         try {
	            if(sqlSession!=null)sqlSession.close();
	         } catch (Exception e2) {
	            // TODO: handle exception
	         }
	      }
	      
	      return 0;
	   }
	public static List<SemiList1> selectMe(String id) {
	      SqlSession sqlSession = null;
	      try {
	         sqlSession = sqlSessionFactory.openSession();
	         return sqlSession.selectList("selectMe111",id);	         
	      } catch (Exception e) {
	         e.printStackTrace();
	         sqlSession.rollback();
	      }finally {
	         try {
	            if(sqlSession!=null)sqlSession.close();
	         } catch (Exception e2) {
	            // TODO: handle exception
	         }
	      }
	      
	      return null;
	   }
	public static int selectMeprice(String id) {
	      SqlSession sqlSession = null;
	      try {
	         sqlSession = sqlSessionFactory.openSession();
	         return sqlSession.selectOne("selectMeprice",id);	         
	      } catch (Exception e) {
	         e.printStackTrace();
	      }finally {
	         try {
	            if(sqlSession!=null)sqlSession.close();
	         } catch (Exception e2) {
	            // TODO: handle exception
	         }
	      }
	      
	      return 0;
	   }
	public static void updateCompanyList(SemiCompanyBean scb) {
	      SqlSession sqlSession = null;
	      try {
	         sqlSession = sqlSessionFactory.openSession();
	         sqlSession.update("updateCompanyList", scb);
	         sqlSession.commit();
	      } catch (Exception e) {
	         e.printStackTrace();
	         sqlSession.rollback();
	      }finally {
	         try {
	            if(sqlSession!=null)sqlSession.close();
	         } catch (Exception e2) {
	            // TODO: handle exception
	         }
	      }
	      
	   }
	public static List<SemiProductBean> selectTop4() {
	      SqlSession sqlSession = null;
	      try {
	         sqlSession = sqlSessionFactory.openSession();
	         return sqlSession.selectList("selectTop4");         
	      } catch (Exception e) {
	         e.printStackTrace();
	      }finally {
	         try {
	            if(sqlSession!=null)sqlSession.close();
	         } catch (Exception e2) {
	            // TODO: handle exception
	         }
	      }
	      
	      return null;
	   }
	
}


