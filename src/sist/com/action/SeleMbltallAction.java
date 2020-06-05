package sist.com.action;

import javax.servlet.http.HttpServletRequest;

import sist.com.dao.TaehoonDao;

public class SeleMbltallAction implements Action{

	private String path;
	private boolean redirect;
	
	
	
	public SeleMbltallAction() {
		super();
	}



	public SeleMbltallAction(String path, boolean redirect) {
		super();
		this.path = path;
		this.redirect = redirect;
	}



	@Override
	public ActionForward execute(HttpServletRequest request) {
		// TODO Auto-generated method stub
	    request.setAttribute("list", TaehoonDao.SeleMbltall());
		return new ActionForward(path, redirect);
	}

}
