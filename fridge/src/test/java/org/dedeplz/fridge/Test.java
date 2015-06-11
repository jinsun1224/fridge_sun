package org.dedeplz.fridge;


import org.dedeplz.fridge.model.MemberDAO;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Test {

	public static void main(String[] args) {
	ApplicationContext ctx = new ClassPathXmlApplicationContext("root-context.xml");
		  MemberDAO dao=(MemberDAO)ctx.getBean("memberDAOImpl");
		  System.out.println(dao.findById("dindony"));
	}

}