package sist.com.action;

import javax.servlet.http.HttpServletRequest;

import sist.com.dao.TaehoonDao;

public class SelectProFun implements Action{
	private String path;
	private boolean redirect;
	
	
	public SelectProFun() {
		super();
	}


	public SelectProFun(String path, boolean redirect) {
		super();
		this.path = path;
		this.redirect = redirect;
	}


	@Override
	public ActionForward execute(HttpServletRequest request) {
		// TODO Auto-generated method stub
		String name = request.getParameter("name");
		//System.out.println(name);
		request.setAttribute("price", TaehoonDao.propriceCheck(name));
		
		return new ActionForward(path, redirect);
	}

}
