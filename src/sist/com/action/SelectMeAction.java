package sist.com.action;
import javax.servlet.http.HttpServletRequest;

import sist.com.action.Action;
import sist.com.action.ActionForward;
import sist.com.dao.TaehoonDao;

public class SelectMeAction implements Action{

	private String path;
	private boolean redirect;
	
	
	public SelectMeAction() {
		super();
	}


	public SelectMeAction(String path, boolean redirect) {
		super();
		this.path = path;
		this.redirect = redirect;
	}


	@Override
	public ActionForward execute(HttpServletRequest request) {
		// TODO Auto-generated method stub
		String id = request.getParameter("id");
		//System.out.println(id);
		request.setAttribute("list", TaehoonDao.selectMe(id));
		//request.setAttribute("mepri", TaehoonDao.selectMeprice(id));
		return new ActionForward(path, redirect);
	}

}
