package com.suredy.app.index.ctrl;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.suredy.Constants;
import com.suredy.core.ctrl.BaseCtrl;
import com.suredy.security.entity.UnitEntity;
import com.suredy.security.model.User;
import com.suredy.security.service.UnitSrv;
import com.suredy.security.service.UserSrv;

@Controller
public class IndexCtrl extends BaseCtrl {

	@Autowired
	private UserSrv userSrv;
	
	@Autowired
	private UnitSrv unitSrv;

	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public ModelAndView Index(HttpServletRequest request) {
		User user = (User) request.getSession().getAttribute(Constants.SESSION_LOGIN_USER);
		List<String> allowed = this.userSrv.getPermissions(user.getUniqueCode());
		ModelAndView view = new ModelAndView("/index");
		view.addObject("permissions", allowed);
		return view;
	}
	
	@RequestMapping(value = "index-fm", method = RequestMethod.GET)
	public ModelAndView fmIndex(HttpServletRequest request) {
		User user = (User) request.getSession().getAttribute(Constants.SESSION_LOGIN_USER);
		List<String> allowed = this.userSrv.getPermissions(user.getUniqueCode());
		ModelAndView view = new ModelAndView("/index-fm");
		view.addObject("permissions", allowed);
		return view;
	}

	@RequestMapping(value = "/user-config", method = RequestMethod.GET)
	public String userConfig(Model model) {
		String view = "app/user/pswd";

		User u = this.getUser();

		model.addAttribute("data", u);

		return view;
	}

	@RequestMapping(value = "/user-config", method = RequestMethod.POST)
	@ResponseBody
	public boolean updatePswd(String old, String pswd) {
		if (StringUtils.isBlank(old) || StringUtils.isBlank(pswd))
			return false;

		int count = this.userSrv.updateUserPswd(this.getUser().getId(), old, pswd);

		return count == 1;
	}
	
}