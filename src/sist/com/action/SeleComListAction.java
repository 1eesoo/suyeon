package sist.com.action;

import javax.servlet.http.HttpServletRequest;

import sist.com.dao.TaehoonDao;

public class SeleComListAction implements Action{

	private String path;
	private boolean redirect;
	
	public SeleComListAction() {
		super();
	}

	public SeleComListAction(String path, boolean redirect) {
		super();
		this.path = path;
		this.redirect = redirect;
	}

	@Override
	public ActionForward execute(HttpServletRequest request) {
		// TODO Auto-generated method stub
		String id = request.getParameter("id");
		request.setAttribute("id", id);
		request.setAttribute("comlist", TaehoonDao.seleComList());
		return new ActionForward(path, redirect);
	}

}
