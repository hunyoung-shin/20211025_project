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
import com.spring.special.vo.BannerVo;
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
	      
		themeList = specialService.s_themeList(); 
		brandList = specialService.s_brandList();
		specialList = specialService.selectList(); 
         
		model.addAttribute("brandList", brandList);
		model.addAttribute("themeList", themeList);
		model.addAttribute("specialList", specialList);

		return "/special/list";
	}

	//VIEW
	@RequestMapping(value="/special/{s_Num}/view.do", method = RequestMethod.GET)
	public String specialview(HttpSession session, @RequestParam("s_Num")int s_Num, Model model)throws Exception{

		SpecialVo specialVo = new SpecialVo();
		BannerVo bannerVo = new BannerVo();
		List<String> linkImgList = new ArrayList<String>();
		
		specialVo.setS_Num(s_Num);
		specialVo = specialService.specialView(s_Num);
		bannerVo = specialService.bannerView(s_Num);
		linkImgList = specialService.linkSelect(specialVo.getBr_Id());
		
		model.addAttribute("specialList", specialVo);
		model.addAttribute("bannerList", bannerVo);
		model.addAttribute("linkImgList", linkImgList);
		
		session.setAttribute("s_brandInit", specialVo.getS_brandInit());
		session.setAttribute("s_title", specialVo.getS_title());
		session.setMaxInactiveInterval(60*10);
		session.getCreationTime();

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
	@ResponseBody
	public String makeSpecialPageAction(SpecialVo specialVo) throws Exception{
		
		HashMap<String, String> result = new HashMap<String, String>();
		CommonUtil commonUtil = new CommonUtil();
		int resultCnt = specialService.specialInsert(specialVo);
		result.put("success", (resultCnt > 0)?"Y":"N");
		String callbackMsg = commonUtil.getJsonCallBackString(" ",result);
		
		return callbackMsg;
	}
	
	@RequestMapping(value="/special/makePageImgAction.do",method = RequestMethod.POST)
	public String makePageImgAction(SpecialVo specialVo, BannerVo bannerVo,
			MultipartHttpServletRequest request, HttpServletResponse response) throws Exception{
		
		try {
			MultipartFile main_imgFile = request.getFile("main_imgFile");
			MultipartFile link_imgFile = request.getFile("link_imgFile");
			List<MultipartFile> ban_imgFileList = request.getFiles("ban_imgFile");
			int a = ban_imgFileList.size();
			
			//timestamp를 이용하여 고유파일명 부여
			Calendar cal = Calendar.getInstance();
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMdd_HHmmSS");
			String time = dateFormat.format(cal.getTime());
			
			String mainImgName = time + main_imgFile.getOriginalFilename();
			String linkImgName = time + link_imgFile.getOriginalFilename();
			String[] banImgNameList = new String[a];
			
			
			String filePath = context.getRealPath("/WEB-INF/uploadFiles/");
			// filePath 확인용 출력장치
			System.out.println(filePath);
			
			// 아래에 filepath 처리로 인해 여기서 Name 처리
			for(int i = 0; i < a; i++) {
				banImgNameList[i] = filePath + time + ban_imgFileList.get(i).getOriginalFilename();
			}
			
			FileOutputStream fos = new FileOutputStream(filePath + mainImgName);
			InputStream is = main_imgFile.getInputStream();
			int readCount = 0;
			byte[] buffer = new byte[16384];
	            
			while ((readCount = is.read(buffer)) != -1) {
				//  파일에서 가져온 fileInputStream을 설정한 크기 (1024byte) 만큼 읽고
				fos.write(buffer, 0, readCount);
					// 위에서 생성한 fileOutputStream 객체에 출력하기를 반복한다
			}
			fos.close();
			bannerVo.setMain_img(filePath + mainImgName);
			
			fos = new FileOutputStream(filePath + linkImgName);
			is = link_imgFile.getInputStream();
			readCount = 0;
			buffer = new byte[16384];
			while ((readCount = is.read(buffer)) != -1) {
				fos.write(buffer, 0, readCount);
			}
			fos.close();
			bannerVo.setLink_img(filePath + linkImgName);
			
			for(int i = 0; i < a ; i++) {
				fos = new FileOutputStream(banImgNameList[i]);
				is = ban_imgFileList.get(i).getInputStream();
				readCount = 0;
				buffer = new byte[16384];
				while ((readCount = is.read(buffer)) != -1) {
					fos.write(buffer, 0, readCount);
				}
				fos.close();
			}
			bannerVo.setBan_img(banImgNameList.toString());
			
			int resultCnt = specialService.bannerInsert(bannerVo);
			
		} catch (Exception e) {
			
			e.printStackTrace();
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
