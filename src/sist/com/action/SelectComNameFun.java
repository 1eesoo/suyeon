package sist.com.action;

import javax.servlet.http.HttpServletRequest;

import sist.com.dao.TaehoonDao;

public class SelectComNameFun implements Action{
	private String path;
	private boolean redirect;
	public SelectComNameFun(String path, boolean redirect) {
		super();
		this.path = path;
		this.redirect = redirect;
	}
	public SelectComNameFun() {
		super();
	}
	@Override
	public ActionForward execute(HttpServletRequest request) {
		// TODO Auto-generated method stub
		String no = request.getParameter("no");
		System.out.println(no);
		request.setAttribute("cname", TaehoonDao.SeleComNameFun1(Integer.parseInt(no)));
		
		return new ActionForward(path, redirect);
	}
	
	
	
	
	
	
}
