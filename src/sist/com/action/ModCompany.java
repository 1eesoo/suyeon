package sist.com.action;



import javax.servlet.http.HttpServletRequest;

import sist.com.dao.TaehoonDao;
import sist.com.model.SemiCompanyBean;

public class ModCompany implements Action{

	private String path;
	private boolean redirect;
	
	public ModCompany() {
		super();
	}

	public ModCompany(String path, boolean redirect) {
		super();
		this.path = path;
		this.redirect = redirect;
	}

	@Override
	public ActionForward execute(HttpServletRequest request) {
		// TODO Auto-generated method stub
		
		String no = request.getParameter("cno");
		String name = request.getParameter("cname");
		String tel = request.getParameter("ctel");
		String add = request.getParameter("cadd");
		
		SemiCompanyBean scb = new SemiCompanyBean();
		scb.setCno(Integer.parseInt(no));
		scb.setCname(name);
		scb.setCtel(tel);
		scb.setCadd(add);
		
		TaehoonDao.updateCompanyList(scb);
		//System.out.println(no+name+tel+add);
		
		return new ActionForward(path, redirect);
	}

}
