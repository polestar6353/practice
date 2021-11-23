package net.hb.crud;

import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class LoginController {
	
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	@RequestMapping(value = "/login.sp", method = RequestMethod.GET)
	public String login(Locale locale, Model model) {
		logger.info("Welcome home! login�޼ҵ�"); //������Ʈ�Ҽ�.Ŭ�����Ҽ�.System.out.println���
		
		return "home";  //WEB-INF/views����/home.jsp���� �����ѿ� 
	}
	
}//HomeController class END
