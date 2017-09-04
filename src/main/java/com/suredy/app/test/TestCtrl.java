package com.suredy.app.test;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.suredy.core.ctrl.BaseCtrl;

@Controller
@RequestMapping({"/test"})
public class TestCtrl extends BaseCtrl {
	
	@RequestMapping(value = "/ckeditor")
	public ModelAndView folderPermission() {
		ModelAndView view = new ModelAndView("/app/test/ckeditor");

		return view;
	}

}
