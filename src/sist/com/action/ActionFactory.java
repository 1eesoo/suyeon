package sist.com.action;

public class ActionFactory {
	public static Action getAction(String cmd) {
		Action action = null;
		if (cmd.equals("sProAction")) {
			action = new SelectProductAction("test.jsp", false);
		} else if (cmd.equals("selectProFun")) {
			action = new SelectProFun("test1.jsp", false);
		} else if (cmd.equals("comName")) {
			action = new SelectComNameFun("test2.jsp", false);
		} else if (cmd.equals("selemblt")) {
			action = new SeleMbltallAction("test3.jsp", false);
		}  else if (cmd.equals("selemblt2")) {
			action = new SeleMblt1("test4.jsp", false);
		} else if (cmd.equals("comList")) {
			action = new SeleComListAction("companyList.jsp", false);
		}  else if (cmd.equals("seleme")) {
				action = new SelectMeAction("test3.jsp",false);
		}  else if (cmd.equals("modCompany")) {
			action = new ModCompany("comList.do?cmd=comList", true);
	    } 
		//혜림
		else if (cmd.equals("proList")) {
			action = new SelProListAction("productList.jsp", false);
		} else if(cmd.equals("modProduct")) {
			action=new ModProductAction("proList.do?cmd=proList", false);
		}
		return action;
	}
}
