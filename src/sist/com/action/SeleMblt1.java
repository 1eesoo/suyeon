package sist.com.action;

import javax.servlet.http.HttpServletRequest;

import sist.com.dao.TaehoonDao;

public class SeleMblt1 implements Action {
	private String path;
	private boolean redirect;
	
	

	public SeleMblt1() {
		super();
	}



	public SeleMblt1(String path, boolean redirect) {
		super();
		this.path = path;
		this.redirect = redirect;
	}



	@Override
	public ActionForward execute(HttpServletRequest request) {
		// TODO Auto-generated method stub
		String no = request.getParameter("no");
		if(no.equals("1")) {
	    request.setAttribute("list", TaehoonDao.SeleMbltIwannt());
		}else {
			request.setAttribute("list", TaehoonDao.SeleMbltIwannt1());
		}
		return new ActionForward(path, redirect);
	}

}
