package sist.com.action;

import javax.servlet.http.HttpServletRequest;

import sist.com.dao.APListDao;

public class SelProListAction implements Action{
	private String path;
	private boolean redirect;
	
	public SelProListAction() {
		super();
	}

	public SelProListAction(String path, boolean redirect) {
		super();
		this.path = path;
		this.redirect = redirect;
	}

	@Override
	public ActionForward execute(HttpServletRequest request) {
		//String id=request.getParameter("id");
		String id = request.getParameter("id");
		request.setAttribute("id", id);
		request.setAttribute("proList", APListDao.selectProduct());
		System.out.println(APListDao.selectProduct());
		return new ActionForward(path,redirect);
	}


	
}
