package com.spring.special.controller;

import java.io.FileOutputStream;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.spring.brand.vo.BrandVo;
import com.spring.common.CommonUtil;
import com.spring.special.service.SpecialService;
import com.spring.special.vo.SpecialVo;

@Controller
public class specialController {

	@Autowired
	SpecialService specialService;

	//LIST
	@RequestMapping(value="/special/list.do", method = RequestMethod.GET)
	public String specialList(HttpSession session, Model model)throws Exception{

		List<BrandVo> themeList = new ArrayList<BrandVo>();
		List<SpecialVo> specialList = new ArrayList<SpecialVo>();
		List<BrandVo> brandList = new ArrayList<BrandVo>();
	      
		try {
			themeList = specialService.s_themeList(); 
			brandList = specialService.s_brandList();
			specialList = specialService.selectList(); 
	         
			model.addAttribute("brandList", brandList);
			model.addAttribute("themeList", themeList);
			model.addAttribute("specialList", specialList);
			
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "/special/list";
	}

	//VIEW
	@RequestMapping(value="/special/{s_Num}/view.do", method = RequestMethod.GET)
	public String specialview(HttpSession session
			,@RequestParam("s_Num")int s_Num, Model model)throws Exception{

		try {
			SpecialVo specialVo = new SpecialVo();
			specialVo.setS_Num(s_Num);
			specialVo = specialService.specialView(s_Num);
			
			session.setAttribute("s_title", specialVo.getS_title());
//			session.setAttribute("s_brandInit", specialVo.getS_brandInit());
			session.setMaxInactiveInterval(60*10);
			session.getCreationTime();
		}
		catch(Exception e) {
			System.out.println("============================================");
			System.out.println("에러는 : "+e.getMessage().toString());
		}

		return "/special/view";
	}

	// 기획전내 상품 추가
	@RequestMapping(value="/special/makeSpecialGoods.do", method = RequestMethod.GET)
	public String makeSpecialGoods(SpecialVo specialVo, Model model) throws Exception{
		
		return "special/makeSpecialGoods";
	}

	@RequestMapping(value="/special/makeSpecialGoodsAction.do",method = RequestMethod.GET)
	@ResponseBody
	public String makeSpecialGoodsAction() throws Exception{

		return "안만듬 아직";
	}

	// 새 기획전 CREATE PAGE
	@RequestMapping(value="/special/makeSpecialPage.do",method = RequestMethod.GET)
	public String makeSpecialPage(Model model) throws Exception{

		List<BrandVo> brandVoList = new ArrayList<BrandVo>();
		List<BrandVo> themeList = new ArrayList<BrandVo>();

		brandVoList = specialService.s_brandList();
		themeList = specialService.s_themeList();

		model.addAttribute("brandVoList", brandVoList);
		model.addAttribute("themeList", themeList);

		return "/special/makeSpecialPage";
	}

	@Inject
	private ServletContext context;
	
	@RequestMapping(value="/special/makeSpecialPageAction.do",method = RequestMethod.POST)
	public String makeSpecialPageAction(SpecialVo specialVo, MultipartHttpServletRequest request,
			HttpServletResponse response, Model model) throws Exception{
		
		// 한글 깨짐 현상있음
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		HashMap<String, String> result = new HashMap<String, String>();
	    CommonUtil commonUtil = new CommonUtil();
		
		MultipartFile imgFile = request.getFile("s_image");
		MultipartFile linkImgFile = request.getFile("s_linkImg");
		
		//timestamp를 이용하여 고유파일명 부여
		Calendar cal = Calendar.getInstance();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMdd_HHmmSS");
		String time = dateFormat.format(cal.getTime());
		String imgName = time + imgFile.getOriginalFilename();
		String linkImgName = time + linkImgFile.getOriginalFilename();
		
		String filePath = context.getRealPath("/WEB-INF/uploadFiles/");
		// filePath 확인용 출력장치
		System.out.println(filePath);
		
		try {
			FileOutputStream fos = new FileOutputStream(filePath + imgName);
			InputStream is = imgFile.getInputStream();
			int readCount = 0;
			byte[] buffer = new byte[16384];
	        	// 파일을 읽을 크기 만큼의 buffer를 생성하고
				// ( 보통 1024, 2048, 4096, 8192 와 같이 배수 형식으로 버퍼의 크기를 잡는 것이 일반적이다.)
	            
			while ((readCount = is.read(buffer)) != -1) {
				//  파일에서 가져온 fileInputStream을 설정한 크기 (1024byte) 만큼 읽고
				fos.write(buffer, 0, readCount);
					// 위에서 생성한 fileOutputStream 객체에 출력하기를 반복한다
			}
			fos.close();
			specialVo.setS_imagePath(filePath + imgName);
			
			FileOutputStream fos2 = new FileOutputStream(filePath + linkImgName);
			InputStream is2 = linkImgFile.getInputStream();
			int readCount2 = 0;
			byte[] buffer2 = new byte[16384];
			while ((readCount2 = is2.read(buffer2)) != -1) {
				fos2.write(buffer2, 0, readCount2);
			}
			fos2.close();
			specialVo.setS_linkImgPath(filePath + linkImgName);
			
			int resultCnt = specialService.specialInsert(specialVo);
//			result.put("success", (resultCnt > 0)?"Y":"N");
//		    String callbackMsg = commonUtil.getJsonCallBackString(" ",result);
//		      
//		    System.out.println("callbackMsg::"+callbackMsg);
//		      
//		    return callbackMsg;
			
		} catch (Exception e) {
			
			e.printStackTrace();
//			int resultCnt = 0;
//			result.put("success", (resultCnt > 0)?"Y":"N");
//		    String callbackMsg = commonUtil.getJsonCallBackString(" ",result);
//		      
//		    System.out.println("callbackMsg::"+callbackMsg);
//		      
//		    return callbackMsg;
		}
		return "redirect:/special/list.do";
	}

	//DELETE
	@RequestMapping(value="/special/delSpecial.do")
	public String delSpecial(SpecialVo specialVo)throws Exception{

		int delSpecial = 0;
		delSpecial = specialService.specialDelete(specialVo);

		return "/special/list.do";
	}

	//UPDATE
	@RequestMapping(value="/special/updateSpecial.do")
	public String updateGoods()throws Exception{

		return null;
	}

	//MODIFY
	@RequestMapping(value="/special/modifySpecial.do")
	public String modifyGoods()throws Exception{

		return null;
	}


}
