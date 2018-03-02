package pl.com;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import pl.com.Language.LanguagePack;


@RestController
public class MainController {
	
	
	LanguagePack a = new LanguagePack();
	
	@RequestMapping("/")
	public ModelAndView welcome() {
	
		ModelAndView model = new ModelAndView("index");
		
		model.addObject("a",this.a);
		
		return model;
	}
	
	@PostMapping(value = "/")
	public ModelAndView LangChange(@RequestParam String langIndex) {
	
		a.setLanguage(langIndex);
		
		return new ModelAndView("redirect:/");
	}
	
}
