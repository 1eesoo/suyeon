package sist.com.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import sist.com.dao.TaehoonDao;

public class SelectProductAction implements Action{
	private String path;
	private boolean redirect;
	public SelectProductAction(String path, boolean redirect) {
		super();
		this.path = path;
		this.redirect = redirect;
	}
	public SelectProductAction() {
		super();
	}
	@Override
	public ActionForward execute(HttpServletRequest request) {
		
		String no = request.getParameter("no");
		//System.out.println(no);
		
		/*List<String>list = TaehoonDao.selectProductName1(Integer.parseInt(no));
		for (int i = 0; i < list.size(); i++) {
			System.out.println(list.get(i));
		}*/
		request.setAttribute("list", TaehoonDao.selectProductName1(Integer.parseInt(no)));
		
		
		return new ActionForward(path, redirect);
	}
	
	
}
