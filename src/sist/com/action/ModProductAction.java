package sist.com.action;

import javax.servlet.http.HttpServletRequest;

import sist.com.dao.APListDao;
import sist.com.model.SemiProductBean;

public class ModProductAction implements Action{
	private String path;
	private boolean redirect;

	public ModProductAction(String path, boolean redirect) {
		super();
		this.path = path;
		this.redirect = redirect;
	}
	@Override
	public ActionForward execute(HttpServletRequest request) {
		String pno=request.getParameter("pno");
		String pname=request.getParameter("pname");
		String cno=request.getParameter("cno");
		String pPrice=request.getParameter("pPrice");
		String ptype=request.getParameter("ptype");
		String pfilename=request.getParameter("pfilename");
		String pstock=request.getParameter("pstock");

		SemiProductBean bean=new SemiProductBean();
		bean.setPno(Integer.parseInt(pno));
		bean.setPname(pname);
		bean.setCno(Integer.parseInt(cno));
		bean.setpPrice(Integer.parseInt(pPrice));
		bean.setPtype(ptype);
		bean.setPfilename(pfilename);
		bean.setPstock(Integer.parseInt(pstock));
		
		System.out.println(bean);
		APListDao.updateProduct(bean);
		return new ActionForward(path, redirect);
	}
	
	
}
