package org.iii.seaotter.jayee.web;

import java.io.IOException;
import java.util.List;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import javax.servlet.ServletContext;
import javax.validation.Valid;

import org.iii.seaotter.jayee.common.AjaxResponse;
import org.iii.seaotter.jayee.common.AjaxResponseType;
import org.iii.seaotter.jayee.common.ArticleType;
import org.iii.seaotter.jayee.common.GridResponse;
import org.iii.seaotter.jayee.entity.Article;
import org.iii.seaotter.jayee.entity.Artist;
import org.iii.seaotter.jayee.service.ArticleService;
import org.iii.seaotter.jayee.service.ArtistService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.microsoft.sqlserver.jdbc.StringUtils;

@Controller
@RequestMapping("/admin/artist")
public class AdminArtistController {

	@Autowired
	ServletContext context;

	@Autowired
	private ArtistService artistService;

	@Autowired
	private ArticleService articleService;

	@RequestMapping("/list")
	public String listPage(Model model) {
		return "/admin/artist-list";
	}

	@RequestMapping("/add")
	public String addPage(Model model) {
		return "/admin/artist-add";
	}

	@RequestMapping("/edit")
	public String editPage(@ModelAttribute("artist") Artist artist, Model model) {
		artist = artistService.getById(artist.getArtistId());
		model.addAttribute("artistParam", artist);
		return "/admin/artist-edit";
	}

	@GetMapping("/query")
	@ResponseBody
	public GridResponse<Artist> query(@RequestParam(value = "page") Integer page,
			@RequestParam(value = "rows") Integer size,
			@RequestParam(value = "searchBar", defaultValue = "") String searchBar,
			@RequestParam(value = "sidx") String sidx, @RequestParam(value = "sord") String sord) {
		GridResponse<Artist> gridResponse = new GridResponse<Artist>();
		Sort sort = new Sort(Sort.Direction.ASC, sidx);
		if ("desc".equalsIgnoreCase(sord)) {
			sort = new Sort(Sort.Direction.DESC, sidx);
		}
		Pageable pageable = PageRequest.of(page - 1, size, sort);
		Specification<Artist> specification = new Specification<Artist>() {
			private static final long serialVersionUID = 1L;

			@Override
			public Predicate toPredicate(Root<Artist> root, CriteriaQuery<?> query, CriteriaBuilder criteriaBuilder) {
				Predicate where = criteriaBuilder.conjunction();
				if (!StringUtils.isEmpty(searchBar)) {
					where = criteriaBuilder.and(criteriaBuilder.like(root.get("name"), "%" + searchBar + "%"));
				}
				return where;
			}
		};
		Page<Artist> result = artistService.getAll(specification, pageable);
		gridResponse.setRows(result.getContent());
		gridResponse.setPage(page);
		gridResponse.setTotal(result.getTotalPages());
		gridResponse.setRecords(result.getTotalElements());
		return gridResponse;
	}

	@PostMapping("/insert")
	@ResponseBody
	public AjaxResponse<Artist> insert(@Valid @RequestBody Artist artist, BindingResult result) {
		System.out.println(artist);
		AjaxResponse<Artist> ajaxRes = new AjaxResponse<>();
		if (result.hasErrors()) {
			ajaxRes.setType(AjaxResponseType.ERROR);
			return ajaxRes;
		} else {
			ajaxRes.setType(AjaxResponseType.SUCCESS);
			ajaxRes.setData(artistService.insert(artist));
			return ajaxRes;
		}
	}

	@PutMapping("/update")
	@ResponseBody
	public AjaxResponse<Artist> update(@Valid @RequestBody Artist artist, BindingResult result) {
		AjaxResponse<Artist> ajaxRes = new AjaxResponse<>();
		if (result.hasErrors()) {
			ajaxRes.setType(AjaxResponseType.ERROR);
			return ajaxRes;
		} else {
			ajaxRes.setType(AjaxResponseType.SUCCESS);
			ajaxRes.setData(artistService.update(artist));
			return ajaxRes;
		}
	}

	@DeleteMapping("/delete")
	@ResponseBody
	public AjaxResponse<Artist> delete(@RequestBody Artist artist) {
		System.out.println(artist);
		AjaxResponse<Artist> ajaxRes = new AjaxResponse<>();
		artist = artistService.getById(artist.getArtistId());
		if (null != artist) {
			artistService.delete(artist);
			ajaxRes.setType(AjaxResponseType.SUCCESS);
			ajaxRes.setData(artist);
			//begin of cascade.delete article
			List<Article> articleList = articleService.getByRefIdAndType(artist.getArtistId(), ArticleType.Artist);
			if(articleList != null && articleList.size() != 0) {
				for (Article article : articleList) {
					articleService.delete(article);
				}
			}
			//end of cascade.delete article
		} else {
			ajaxRes.setType(AjaxResponseType.ERROR);
		}
		return ajaxRes;
	}

	@PostMapping("/uploadImage")
	public String upload(@RequestParam("imageFile") MultipartFile imageFile) throws IOException {
		String returnValue = "/admin/artist-list";
		try {
			ArtistService.saveImage(imageFile);
		} catch (Exception e) {
			e.printStackTrace();
			returnValue = "error";
		}
		return returnValue;
	}
}
