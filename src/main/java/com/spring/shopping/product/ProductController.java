package com.spring.shopping.product;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.shopping.qna.QNAVO;
import com.spring.shopping.review.ReviewVO;


@Controller
@RequestMapping("/product.pr")
public class ProductController {

	@Autowired
	private ProductService productService;
	
	@RequestMapping(params="method=getProduct")
	public String getProduct(HttpSession session, HttpServletRequest request, ProductVO productVO, Model model) throws Exception{	
		ProductVO pVO = new ProductVO();
		pVO = productService.getProduct(productVO.getNum());
		int check = 0;
		ArrayList<String> descImgList = new ArrayList<String>();
		ArrayList<String> descTextList = new ArrayList<String>();
		if(!(pVO.getDesc_image().equals("none"))){
			StringTokenizer st1 = new StringTokenizer(pVO.getDesc_image(), ",");
			while (st1.hasMoreTokens())
				descImgList.add(st1.nextToken());
			model.addAttribute("descImgList", descImgList);
			check += 10;
		}else{
			model.addAttribute("descImgList", "none");
		}
		if(!(pVO.getDesc_text().equals("none"))){
			StringTokenizer st2 = new StringTokenizer(pVO.getDesc_text(), "/");
			while (st2.hasMoreTokens())
				descTextList.add(st2.nextToken());
			model.addAttribute("descTextList", descTextList);
			check += 1;
		}else{
			model.addAttribute("descTextList", "none");
		}
		ArrayList<String> detailList = new ArrayList<String>();
		StringTokenizer st3 = new StringTokenizer(pVO.getDetail(), ",");
		while(st3.hasMoreElements()){
			detailList.add(st3.nextToken());
		}
		model.addAttribute("detailList", detailList);
		model.addAttribute("check", check);
		model.addAttribute("vo", pVO);
		
		List<ReviewVO> reviewList = new ArrayList<ReviewVO>();
		reviewList = productService.getReview(productVO.getNum());
		List<QNAVO> qnaList = new ArrayList<QNAVO>();
		qnaList = productService.getQNA(productVO.getNum());
		
		model.addAttribute("reviewList", reviewList);
		model.addAttribute("qnaList", qnaList);
		
		return "product/getProduct";
	}
	@RequestMapping(params="method=getAllProductList")
	public String getAllProductList(HttpServletRequest request, Model model) throws Exception{
		int page = 1;
		if(request.getParameter("page") != null){
			page = Integer.parseInt(request.getParameter("page"));
		}
		List<ProductVO> allProductList = productService.getAllProductList(page);
		model.addAttribute("allProductList", allProductList);
		int count = productService.getSearchCount("");
		model.addAttribute("count", count);
		model.addAttribute("curPage", page);
		return "admin/getAllProductList";
	}
//	@RequestMapping(params="method=addProductPage")
//	public String addProductPage(){
//		return "admin/addProduct";
//	}
//	@RequestMapping(params="method=addProduct")
//	public String addProduct(HttpServletRequest request) throws Exception{
//		ProductVO vo = new ProductVO();
//		String realPath = "C:\\Big Data\\Spring source\\_Final_Project\\src\\main\\webapp\\resources\\image\\product\\productImages";
//		int maxSize = 5 * 1024 * 1024;
//
//		MultipartRequest multi = null;
//		List<String> savefiles = new ArrayList<String>();
//		String mainImage = "";
//		try{
//			multi = new MultipartRequest(request, realPath, maxSize, "euc-kr", new DefaultFileRenamePolicy());
//			Enumeration files = multi.getFileNames();
//			while(files.hasMoreElements()){
//				String name = (String)files.nextElement();
//				if(!(name.equals("image"))){
//					savefiles.add(multi.getFilesystemName(name)+",");
//				}else{
//					mainImage = multi.getFilesystemName(name);
//				}
//			}
//			StringBuffer fl = new StringBuffer();
//			for(int i = 0; i < savefiles.size(); i++){
//				fl.append(savefiles.get(i));
//			}
//			vo.setNum(Integer.parseInt(multi.getParameter("num")));
//			vo.setName(multi.getParameter("name"));
//			vo.setBrief(multi.getParameter("brief"));
//			vo.setCategory(Integer.parseInt(multi.getParameter("category")));
//			vo.setPrice(Integer.parseInt(multi.getParameter("price")));
//			vo.setPoint(Integer.parseInt(multi.getParameter("price"))/100);
//			vo.setCapacity(multi.getParameter("capacity"));
//			vo.setDesc_image(fl.toString());
//			vo.setDesc_text(multi.getParameter("desc_text"));
//			vo.setDetail(multi.getParameter("detail1")+","+multi.getParameter("detail2")+","+multi.getParameter("detail3")
//					+","+multi.getParameter("detail4")+","+multi.getParameter("detail5")+","+multi.getParameter("detail6")
//					+","+multi.getParameter("detail7")+","+multi.getParameter("detail8")+","+multi.getParameter("detail9"));
//			vo.setTotal_pref(0);
//			vo.setReviewCnt(0);
//			vo.setImage(mainImage);
//			vo.setMfd(multi.getParameter("mfd"));
//			vo.setNumoflike(0);
//			productService.addProduct(vo);
//
//		}catch(Exception e){
//			e.printStackTrace();
//		}
//
//		return "admin/addOK";
//	}
	@RequestMapping(params="method=delProduct")
	public String delProduct(HttpServletRequest request, ProductVO productVO, Model model) throws Exception {
		String preURL = request.getHeader("referer");
		productService.delProduct(productVO.getNum());
		model.addAttribute("preURL", preURL);
		return "admin/delOK";
	}
	@RequestMapping(params="method=like")
	public String productLike(HttpServletRequest request) throws Exception{
		int num = Integer.parseInt(request.getParameter("num"));
		productService.productLike(num);
		return "redirect:/product.pr?method=getProduct&num="+num;
	}
	@RequestMapping(params="method=searchProduct")
	public String searchProduct(HttpServletRequest request, Model model) throws Exception{
		String word = request.getParameter("word");
		int order = Integer.parseInt(request.getParameter("order"));
		int page = 1;								//�׳� �������� ù������ ���
		if(request.getParameter("page") != null){		// ������ ��ȣ ��������
			page = Integer.parseInt(request.getParameter("page"));
		}
		System.out.println("ProductController : " + word);
		List<ProductVO> searchProductList = productService.searchProduct(word, order, page);
		int count = productService.getSearchCount(word);
		model.addAttribute("searchProductList", searchProductList);		
		model.addAttribute("word", word);
		model.addAttribute("count", count);
		model.addAttribute("curPage", page);
		model.addAttribute("order", order);
		return "product/getSearchList";
	}
	@RequestMapping(params="method=pay")
	public String pay(HttpServletRequest request, Model model) throws Exception{
		String productName = request.getParameter("pName");
		int price = Integer.parseInt(request.getParameter("price"));
		String p_Name = request.getParameter("p_name");
		String p_Email = request.getParameter("p_email");
		String p_Phone = request.getParameter("p_phone");
		String r_Name = request.getParameter("r_name");
		String r_Address = request.getParameter("r_address");
		String r_Phone = request.getParameter("r_phone");
		String required = request.getParameter("required");
		System.out.println(productName+" "+price+" "+p_Name+" "+p_Email+" "
				+p_Phone+" "+r_Name+" "+r_Address+" "+r_Phone+" "+required);
		model.addAttribute("productName", productName);
		model.addAttribute("price", price);
		model.addAttribute("p_name", p_Name);
		model.addAttribute("p_email", p_Email);
		model.addAttribute("p_phone", p_Phone);
		model.addAttribute("r_name", r_Name);
		model.addAttribute("r_address", r_Address);
		model.addAttribute("r_phone", r_Phone);
		model.addAttribute("required", required);
		return "pay/pay";
	}
	@RequestMapping(params="method=autoWord")
	public void autoWord(HttpSession session, HttpServletRequest request, HttpServletResponse response, Model model) throws Exception{
		System.out.println("��Ʈ�ѷ� ����");
		String word = request.getParameter("word");
		System.out.println("word in Controller : "+word);
		ArrayList<String> wordList = productService.searchProductName(word);
		JSONArray arr = new JSONArray();
		for(int i = 0; i < wordList.size(); i++){
			System.out.println("wordList ��� : "+wordList.get(i));
			arr.add(wordList.get(i));
		}
		response.setContentType("text/html;charset=euc-kr");
		PrintWriter out = response.getWriter();
		out.print(arr.toString());
	}
	@RequestMapping(params="method=getBestList")
	public String getBestList(HttpSession session, HttpServletRequest request, HttpServletResponse response, Model model) throws Exception{
		ArrayList<ProductVO> bestList = productService.getBestList();		
		model.addAttribute("bestList", bestList);
		return "home";
	}
	
}
