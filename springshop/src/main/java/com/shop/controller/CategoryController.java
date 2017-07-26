package com.shop.controller;
import java.io.IOException;
import java.util.List;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import com.shop.entity.Tcategory;
import com.shop.entity.TreeBean;
import com.shop.service.impl.CategoryService;
import com.shop.util.JsonUtil;

/**
 * Controller层
 * 
 * @author 
 * 
 */
@Controller
public class CategoryController {
	@Resource
	private CategoryService categoryService;
	@RequestMapping("/categoryMana")
	public ModelAndView categoryMana(
			@RequestParam(value = "id", required = false) String id,
			HttpServletRequest request, HttpServletResponse response,
			HttpSession session) throws IOException {	
		
		
		List<Tcategory> categoryList=categoryService.categoryMana();
		
		ModelAndView mav = new ModelAndView();
	
		request.setAttribute("categoryList",categoryList);
		
		mav.setViewName("admin/category/categoryMana");
		mav.addObject("categoryList", categoryList);
		
		return mav;
	}
	
	
	@RequestMapping("/categoryAll")
	public ModelAndView categoryAll(
			HttpServletRequest request, HttpServletResponse response,
			HttpSession session) throws IOException {	
		System.out.println("--------------begin--------------");
		List<Tcategory> categoryList=categoryService.categoryMana();
		ModelAndView mav = new ModelAndView();
		request.setAttribute("categoryList",categoryList);
		mav.setViewName("categoryList");
		mav.addObject("categoryList", categoryList);
		return mav;
	}
	
	@RequestMapping("/categoryDel")
	public ModelAndView categoryDel(
			@RequestParam(value = "id", required = false) String id,
			HttpServletRequest request, HttpServletResponse response,
			HttpSession session) {	
		categoryService.categoryDelete(id);
		List<Tcategory> categoryList=categoryService.categoryMana();
		ModelAndView mav = new ModelAndView();
		request.setAttribute("categoryList",categoryList);
		mav.setViewName("admin/category/categoryMana");
		mav.addObject("categoryList", categoryList);
		return mav;
	}
	
	
	@RequestMapping("/categoryAdd")
	public ModelAndView categoryAdd(
			@RequestParam(value = "categoryName", required = false) String categoryName,
			@RequestParam(value = "parentCategoryID", required = false) String parentCategoryID,
			HttpServletRequest request, HttpServletResponse response,
			HttpSession session) {	
		
		Tcategory catergory = new Tcategory();
		catergory.setCategoryName(categoryName);
		catergory.setParentCategoryID(parentCategoryID);
		categoryService.categoryAdd(catergory);
		List<Tcategory> categoryList=categoryService.categoryMana();
		ModelAndView mav = new ModelAndView();
		request.setAttribute("categoryList",categoryList);
		mav.setViewName("admin/category/categoryMana");
		mav.addObject("categoryList", categoryList);
		return mav;
	}
	
	
	@RequestMapping("/categoryJson")
	public void categoryJson(
			HttpServletRequest request, HttpServletResponse response,
			HttpSession session) throws Exception {	
		response.setContentType("text/plain"); 
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");//设置了编码方式
		List<Tcategory> categoryList=categoryService.categoryMana();
		response.getWriter().println(JsonUtil.list2json(categoryList));//将list型的东东转换成为JSON形式的数据response是相应用户请求的对象，
		//而request是用户请求对象（如一个http请求）
	}//将对象result序列化成JSON形式字符串写入到客户端页面
	
	
	@RequestMapping("/categoryTree")
	public void categoryTree(
			HttpServletRequest request, HttpServletResponse response,
			HttpSession session) throws Exception {	
		response.setContentType("text/plain");//文本 
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		StringBuilder json = new StringBuilder("");//StringBuilder是一个类，可以用来处理字符串
		json.append("[");
		
		List<Tcategory> categoryList=categoryService.categoryMana();
		for (int j=0;j<categoryList.size();j++){
			Tcategory mycategory=(Tcategory)categoryList.get(j);
			
			TreeBean category = new TreeBean();
			category.setId(mycategory.getCategoryID());

			category.setpId(mycategory.getParentCategoryID());

			category.setName(mycategory.getCategoryName());

			json.append("{id:" + mycategory.getCategoryID() + ",pId:" + mycategory.getParentCategoryID()
					+ ",name:\"" +mycategory.getCategoryName() + "\"},");
		}
		json.append("]");
		
		response.getWriter().println(json.toString().replace("},]", "}]"));	//将对象转换成json写出到客户端
	}
	
	
	
}
