package com.shop.controller;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.shop.entity.Tfavoriate;
import com.shop.entity.Tfenxi;
import com.shop.entity.Torder;
import com.shop.entity.Tpingjia;
import com.shop.entity.Tproduct;
import com.shop.entity.Tuser;
import com.shop.service.impl.ProductService;
import com.shop.util.JsonUtil;

/**
 * Controller层
 * 
 * @author 
 * 
 */
@Controller
public class ProductController {

	@Resource
	private ProductService productService;
	
	@RequestMapping("/productMana")
	public ModelAndView productMana(
			@RequestParam(value = "id", required = false) String id,
			HttpServletRequest request, HttpServletResponse response,
			HttpSession session) throws IOException {	
		List<Tproduct> productList=productService.productMana();
		ModelAndView mav = new ModelAndView();
		request.setAttribute("productList",productList);
		mav.setViewName("admin/product/productMana");
		mav.addObject("productList", productList);
		return mav;
	}
	
	@RequestMapping("/productAll")
	public ModelAndView productAll(
			@RequestParam(value = "categoryID", required = false) String categoryID,
			@RequestParam(value = "productName", required = false) String productName,
			HttpServletRequest request, HttpServletResponse response,
			HttpSession session) throws IOException {	
		
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("productName", productName);
		map.put("categoryID", categoryID);
		List<Tproduct> productList=productService.productAll(map);
		ModelAndView mav = new ModelAndView();
		request.setAttribute("productList",productList);
		mav.setViewName("product");
		mav.addObject("productList", productList);
		return mav;
	}
	
	@RequestMapping("/productDel")
	public ModelAndView productDel(
			@RequestParam(value = "goodID", required = false) String goodID,
			HttpServletRequest request, HttpServletResponse response,
			HttpSession session) {	
	     productService.productDelete(goodID);
		
	     List<Tproduct> productList=productService.productMana();
			ModelAndView mav = new ModelAndView();
			request.setAttribute("productList",productList);
			mav.setViewName("admin/product/productMana");
			mav.addObject("productList", productList);
			return mav;
	}
	
	
	@RequestMapping("/productAdd")
	public ModelAndView productAdd(
			@RequestParam(value = "filetype", required = false) String filetype,
			@RequestParam(value = "categoryID", required = false) String categoryID,
			@RequestParam(value = "cunkun", required = false) String cunkun,
			@RequestParam(value = "goodMiaoshu", required = false) String goodMiaoshu,
			@RequestParam(value = "goodName", required = false) String goodName,
			@RequestParam(value = "price", required = false) String price,
			@RequestParam(value = "yuanshiname", required = false) MultipartFile yuanshiname,
			HttpServletRequest request, HttpServletResponse response,
			HttpSession session) throws IOException {	
		SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");
		String fileName=df.format(new Date());
		String realPath=request.getRealPath("/upload");
		System.out.println("file.getOriginalFilename() is:"+yuanshiname.getOriginalFilename());
		//String fileName = yuanshiname.getOriginalFilename();  
		 File targetFile = new File(realPath, fileName+"."+filetype);  
	     if(!targetFile.exists()){  
	         targetFile.mkdirs();  
	     }  
	  
	     //保存  
	     try {  
	        	yuanshiname.transferTo(targetFile);  
	        } catch (Exception e) {  
	            e.printStackTrace();  
	     }  
	    Tproduct product=new Tproduct();
	    product.setCatergoryID(categoryID);
	    product.setCunkun(cunkun);
	    product.setGoodMiaoshu(goodMiaoshu);
	    product.setGoodName(goodName);
	    product.setGoodPic("/upload/"+fileName+"."+filetype);
	    product.setPrice(price);
	    productService.productAdd(product);
		List<Tproduct> productList=productService.productMana();
		ModelAndView mav = new ModelAndView();
		request.setAttribute("productList",productList);
		mav.setViewName("admin/product/productMana");
		mav.addObject("productList", productList);
		return mav;
	}
	
	
	@RequestMapping("/productEdit")
	public ModelAndView productEdit(
			@RequestParam(value = "goodID", required = false) String goodID,
			@RequestParam(value = "filetype", required = false) String filetype,
			@RequestParam(value = "categoryID", required = false) String categoryID,
			@RequestParam(value = "cunkun", required = false) String cunkun,
			@RequestParam(value = "goodMiaoshu", required = false) String goodMiaoshu,
			@RequestParam(value = "goodName", required = false) String goodName,
			@RequestParam(value = "price", required = false) String price,
			@RequestParam(value = "yuanshiname", required = false) MultipartFile yuanshiname,
			HttpServletRequest request, HttpServletResponse response,
			HttpSession session) throws IOException {	
		Tproduct product=new Tproduct();
		SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");
		if(yuanshiname!=null&&!yuanshiname.getOriginalFilename().equalsIgnoreCase("")&&!yuanshiname.getOriginalFilename().equalsIgnoreCase("null")){
			String fileName=df.format(new Date());
			String realPath=request.getRealPath("/upload");
			System.out.println("file.getOriginalFilename() is:"+yuanshiname.getOriginalFilename());
			//String fileName = yuanshiname.getOriginalFilename();  
			File targetFile = new File(realPath, fileName+"."+filetype);  
		    if(!targetFile.exists()){  
		         targetFile.mkdirs();  
		     }  
		  
		     //保存  
		     try {  
		        	yuanshiname.transferTo(targetFile);  
		        } catch (Exception e) {  
		            e.printStackTrace();  
		    }  
		     product.setGoodPic("/upload/"+fileName+"."+filetype);
		}else{
			 
		}

	    product.setCatergoryID(categoryID);
	    product.setCunkun(cunkun);
	    product.setGoodMiaoshu(goodMiaoshu);
	    product.setGoodName(goodName);
	    product.setPrice(price);
	    product.setGoodID(goodID);
	    productService.productEdit(product);
		List<Tproduct> productList=productService.productMana();
		ModelAndView mav = new ModelAndView();
		request.setAttribute("productList",productList);
		mav.setViewName("admin/product/productMana");
		mav.addObject("productList", productList);
		return mav;
	}
	
	
	@RequestMapping("/productDetail")
	public ModelAndView productDetail(
			@RequestParam(value = "goodID", required = false) String goodID,
			HttpServletRequest request, HttpServletResponse response,
			HttpSession session) throws IOException {	
		Tproduct product=productService.productDetail(goodID);
		List<Tpingjia> pingjiaList=productService.productpingjia(goodID);
		ModelAndView mav = new ModelAndView();
		request.setAttribute("product",product);
		request.setAttribute("pingjiaList",pingjiaList);
		mav.setViewName("productDetail");
		mav.addObject("product", product);
		mav.addObject("pingjiaList", pingjiaList);
		return mav;
	}
	
	
	@RequestMapping("/fenxi")
	public ModelAndView fenxi(
			HttpServletRequest request, HttpServletResponse response,
			HttpSession session) throws IOException {	
		response.setContentType("text/plain"); 
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		List<Tfenxi> fenxiList=productService.fenxi();
		response.getWriter().println(JsonUtil.list2json(fenxiList));
		return null;
	}
	
	
	//------------------------收藏部分-----------
	
	

	@RequestMapping("/delFavoriate")
	public ModelAndView delFavoriate(
			@RequestParam(value = "goodID", required = false) String goodID,
			HttpServletRequest request, HttpServletResponse response,
			HttpSession session) {	
		Tuser user=(Tuser)request.getSession().getAttribute("user");
	
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("goodID", goodID);
		map.put("userID", user.getUserID());
		productService.delFavoriate(map);
	    List<Tfavoriate> favoriateList=productService.myFavoriate(user.getUserID());
		ModelAndView mav = new ModelAndView();
		request.setAttribute("favoriateList",favoriateList);
		mav.setViewName("myfavoriate");
		mav.addObject("favoriateList", favoriateList);
		return mav;
	}
	
	
	@RequestMapping("/addFavoriate")
	public ModelAndView addFavoriate(
			@RequestParam(value = "goodID", required = false) String goodID,
			HttpServletRequest request, HttpServletResponse response,
			HttpSession session) {	
		Tuser user=(Tuser)request.getSession().getAttribute("user");
		Tfavoriate favoriate=new Tfavoriate();
		favoriate.setGoodID(goodID);
		favoriate.setUserID(user.getUserID());
		favoriate.setUrl("/productDetail?goodID="+goodID);
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("goodID", goodID);
		map.put("userID", user.getUserID());
		
		productService.delFavoriate(map);
		productService.addFavoriate(favoriate);
		List<Tfavoriate> favoriateList=productService.myFavoriate(user.getUserID());
		ModelAndView mav = new ModelAndView();
		request.setAttribute("favoriateList",favoriateList);
		mav.setViewName("myfavoriate");
		mav.addObject("favoriateList", favoriateList);
		return mav;
	}
	
	
	
	@RequestMapping("/myFavoriate")
	public ModelAndView myFavoriate(
			HttpServletRequest request, HttpServletResponse response,
			HttpSession session) {	
		Tuser user=(Tuser)request.getSession().getAttribute("user");
	
		List<Tfavoriate> favoriateList=productService.myFavoriate(user.getUserID());
		ModelAndView mav = new ModelAndView();
		request.setAttribute("favoriateList",favoriateList);
		mav.setViewName("myfavoriate");
		mav.addObject("favoriateList", favoriateList);
		return mav;
	}
	
	
	@RequestMapping("/addpingjia")
	public ModelAndView addpingjia(
			@RequestParam(value = "goodID", required = false) String goodID,
			@RequestParam(value = "orderID", required = false) String orderID,
			@RequestParam(value = "filetype", required = false) String filetype,
			@RequestParam(value = "content", required = false) String content,
			@RequestParam(value = "score", required = false) String score,
			@RequestParam(value = "yuanshiname", required = false) MultipartFile yuanshiname,
			HttpServletRequest request, HttpServletResponse response,
			HttpSession session) {	
		Tuser user=(Tuser)request.getSession().getAttribute("user");
		SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");
		SimpleDateFormat df2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String fileName=df.format(new Date());
		String realPath=request.getRealPath("/upload");
		System.out.println("file.getOriginalFilename() is:"+yuanshiname.getOriginalFilename());
		File targetFile = new File(realPath, fileName+filetype);  
	     if(!targetFile.exists()){  
	         targetFile.mkdirs();  
	     }  
	     //保存  
	     try {  
	        	yuanshiname.transferTo(targetFile);  
	        } catch (Exception e) {  
	            e.printStackTrace();  
	     }  
	     
	     Tpingjia pingjia=new Tpingjia();
	     pingjia.setContent(content);
	     pingjia.setCreateDate(df2.format(new Date()) );
	     pingjia.setFenshu(score);
	     pingjia.setImage("/upload/"+fileName+filetype);
	     pingjia.setUserID(user.getUserID());
	     pingjia.setGoodID(goodID);
	     pingjia.setOrderID(orderID);
	     productService.addpingjia(pingjia);
	    Map<String,Object> map=new HashMap<String,Object>();
		map.put("productName",null);
		map.put("categoryID",null);
		
		List<Tproduct> productList=productService.productAll(map);
		ModelAndView mav = new ModelAndView();
		request.setAttribute("productList",productList);
		mav.setViewName("product");
		mav.addObject("productList", productList);
		return mav;
	}
}
