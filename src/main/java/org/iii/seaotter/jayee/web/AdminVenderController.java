package org.iii.seaotter.jayee.web;




import java.util.HashMap;
import java.util.Map;

import org.iii.seaotter.jayee.entity.Forum;
import org.iii.seaotter.jayee.entity.Vender;
import org.iii.seaotter.jayee.service.VenderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/admin/vender")
public class AdminVenderController {
	
	@Autowired
	private VenderService venderService;
	

	@RequestMapping("/list")

	public String listPage(Model model) {	
		model.addAttribute("venders", venderService.getAll());
		return "/admin/vender-list";
	}

	@RequestMapping("/add")
	public String addPage() {
		return "/admin/vender-add";
	}

	@RequestMapping("/edit")
	public String editPage() {
		return "/admin/vender-edit";

	}

	
	@PostMapping("/insert")
	public String insert(@ModelAttribute("vender") Vender vender, Model model) {
		Map<String, String> errMsg = new HashMap<>();
		String name=vender.getName();
		if(name==null||name.trim().length()==0) {
			errMsg.put("nameerr", "請輸入名字");
		}
		String address=vender.getAddress();
		if(address==null||address.trim().length()==0) {
			errMsg.put("addresserr", "請輸入地址");
		}
		Integer max_people=vender.getMaxPeople();
		if(max_people==null||max_people==0) {
			errMsg.put("max_peopleerr", "請輸入容納人數");
		}
		String phone=vender.getPhone();
		if(phone==null||phone.trim().length()==0) {
			errMsg.put("phoneerr", "請輸入電話");
		}
		if(!errMsg.isEmpty()) {
			model.addAttribute("venderParam", vender);
			model.addAttribute("errMsg",errMsg);
			return "/admin/vender-add";
		}
		System.out.println("abbbbbb");
		
		venderService.create(vender);
		return "redirect:/admin/vender/list";


	}

	public String update() {
		return null;

	}
	@PostMapping("/delete")
	public String delete(@ModelAttribute("vender") Vender vender, Model model) {
		System.out.println("aaaa");
		System.out.println();
		System.out.println(vender);
		venderService.delete(vender.getId());
		return "redirect:/admin/vender/list";

	}
}
