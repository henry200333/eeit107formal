package org.iii.seaotter.jayee.web;




import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;

import org.iii.seaotter.jayee.entity.Forum;
import org.iii.seaotter.jayee.entity.Performance;
import org.iii.seaotter.jayee.entity.Vender;
import org.iii.seaotter.jayee.service.VenderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


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
	
	@RequestMapping("/maptest")
	public String mapPage() {
		return "/admin/vender-maptest";
	}
	
	
	@RequestMapping("/query")
	@ResponseBody
	public List<Vender> query(){	
	
		return venderService.getAll();
	}
	
	@PostMapping("/insert")
	@ResponseBody
	public Map<String, String> insert(@RequestBody Vender vender, Model model) {
		Map<String, String> res = new HashMap<>();
//		Vender vender=venders.get(0);
		String name=vender.getName();
		if(name==null||name.trim().length()==0) {
			res.put("name", "請輸入餐廳名稱");
		}
		String address=vender.getAddress();
		if(address==null||address.trim().length()==0) {
			res.put("address", "請輸入地址");
		}
		Integer max_people=vender.getMaxPeople();
		if(max_people==null||max_people==0) {
			res.put("maxPeople", "請輸入容納人數");
		}
		String phone=vender.getPhone();
		if(phone==null||phone.trim().length()==0) {
			res.put("phone", "請輸入電話");
		}
		if(!res.isEmpty()) {
			return res;
		}
		
		venderService.create(vender);
		res.put("success", "success");
		return res; 


	}
	@PutMapping("/update")
	@ResponseBody
	public Map<String, String> updateinsert(@RequestBody List<Vender> venders, Model model) {
		Map<String, String> res = new HashMap<>();
		Vender vender=venders.get(0);
		String name=vender.getName();
		if(name==null||name.trim().length()==0) {
			res.put("name", "請輸入名字");
		}
		String address=vender.getAddress();
		if(address==null||address.trim().length()==0) {
			res.put("address", "請輸入地址");
		}
		Integer max_people=vender.getMaxPeople();
		if(max_people==null||max_people==0) {
			res.put("maxPeople", "請輸入容納人數");
		}
		String phone=vender.getPhone();
		if(phone==null||phone.trim().length()==0) {
			res.put("phone", "請輸入電話");
		}
		if(!res.isEmpty()) {
			return res;
		}
		venderService.edit(vender);
		res.put("success", "success");
		return res; 
		

	}
	@DeleteMapping("/delete")
	@ResponseBody
	public Vender delete(@RequestBody Vender vender ) {
	System.out.println("aa");
	System.out.println(vender);
//System.out.println(vender);
		venderService.delete(vender.getId());
		return vender;

	}
}
