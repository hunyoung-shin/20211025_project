package com.spring.board.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.spring.board.HomeController;
import com.spring.board.service.boardService;
import com.spring.board.vo.BoardVo;
import com.spring.board.vo.PageVo;
import com.spring.common.CommonUtil;

@Controller
public class BoardController {
	
	@Autowired 
	boardService boardService;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value = "/board/boardList.do", method = RequestMethod.GET)
	public String boardList(Locale locale, Model model,PageVo pageVo, BoardVo boardVo
			, HttpSession session , HttpServletRequest request) throws Exception{
		try {
		session = request.getSession();
		String id = (String)session.getAttribute("userId");
		String name = (String)session.getAttribute("userName");
		System.out.println("�꽭�뀡�뿉 �떞寃⑥졇 �엳�뒗 �븘�씠�뵒 : "+id);
		}
		catch(Exception e) {}
							
		List<BoardVo> boardList = new ArrayList<BoardVo>();
		List<BoardVo> comCode = new ArrayList<BoardVo>();
		
		
		int page = 1;
		int totalCnt = 0;
		
		if(pageVo.getPageNo() == 0){
			pageVo.setPageNo(page);
		}
		
		boardList = boardService.SelectBoardList(pageVo);
		totalCnt = boardService.selectBoardCnt();
		comCode = boardService.comCodeList(boardVo);
		
		model.addAttribute("comCode", comCode);
		model.addAttribute("boardList", boardList);
		model.addAttribute("totalCnt", totalCnt);
		model.addAttribute("pageNo", page);
		
		return "board/boardList";
	}
	
	@RequestMapping(value = "/board/{boardType}/{boardNum}/boardView.do", method = RequestMethod.GET)
	public String boardView(Locale locale, Model model
			,@PathVariable("boardType")String boardType
			,@PathVariable("boardNum")int boardNum) throws Exception{
		
		BoardVo boardVo = new BoardVo();
		
		boardVo = boardService.selectBoard(boardType,boardNum);

		model.addAttribute("board", boardVo);
		
		return "board/boardView";
	}
	
	@RequestMapping(value = "/board/selectBoardList.do", method = RequestMethod.POST)
	public String boardTakeList(Locale locale,Model model,@RequestParam(value="chk", required = false)String checkBox,
														BoardVo boardVo, PageVo pageVo) throws Exception {
		List<BoardVo> boardList = new ArrayList<BoardVo>();
		List<BoardVo> comCode = new ArrayList<BoardVo>();
		int page = 1;
		int totalcnt = 0;
		if(pageVo.getPageNo() == 0){
			pageVo.setPageNo(page);
		}
		
			String checklist[] = checkBox.split(",");
			pageVo.setChecked(checklist);
			boardList = boardService.takeBoard(pageVo);
			totalcnt = boardService.selectBoardCnt();
			comCode = boardService.comCodeList(boardVo);
			
			model.addAttribute("comCode", comCode);
			model.addAttribute("boardList", boardList);
			model.addAttribute("totalCnt", totalcnt);
			model.addAttribute("pageNo", page);
		
		return "board/boardList";
	}

	@RequestMapping(value="/board/{boardType}/{boardNum}/boardModify.do", method = RequestMethod.GET)
	public String boardModify(Locale locale, Model model
			,@PathVariable("boardType")String boardType
			,@PathVariable("boardNum")int boardNum) throws Exception {
		BoardVo boardVo = new BoardVo();
		
		boardVo = boardService.selectBoard(boardType,boardNum);
	
		model.addAttribute("board", boardVo);
		
		System.out.println("�닔�젙�셿猷�");
		return "board/boardModify";
	}
	@RequestMapping(value="/borad/boardModifyAction.do", method = RequestMethod.POST)
	@ResponseBody
	public String boardModifyAction(Locale locale,BoardVo boardVo)throws Exception{
		HashMap<String, String> result = new HashMap<String, String>();
		CommonUtil commonUtil = new CommonUtil();
		
		int resultCnt = boardService.boardModify(boardVo);
		
		result.put("success", (resultCnt > 0)?"Y":"N");
		String callbackMsg = commonUtil.getJsonCallBackString(" ",result);
		
		System.out.println("callbackMsg::"+callbackMsg);
		
		return callbackMsg;
	}
	
	
	@RequestMapping(value="/board/boardDelete.do", method = RequestMethod.GET)
	public String boardDelete(Model model ,BoardVo boardVo, HttpServletRequest request)throws Exception{
		String boardNum = request.getParameter("Number");
		System.out.println("�꽆�뼱�샂");
		System.out.println(boardNum);
		boardVo.setBoardNum(Integer.parseInt(boardNum));
		System.out.println(boardVo.getBoardNum());
		
		HashMap<String, String> result = new HashMap<String, String>();
		CommonUtil commonUtil = new CommonUtil();
		
		int resultCnt = boardService.boardDelete(boardVo);
		
		result.put("success", (resultCnt > 0)?"Y":"N");
		String callbackMsg = commonUtil.getJsonCallBackString(" ",result);
		
		System.out.println("callbackMsg::"+callbackMsg);
		
		return "redirect:/board/boardList.do";
	}
	
	@RequestMapping(value = "/board/boardWrite.do", method = RequestMethod.GET)
	public String boardWrite(Locale locale, Model model, BoardVo boardVo) throws Exception{
		
		List<BoardVo> comCode = new ArrayList<BoardVo>();
		
		comCode = boardService.comCodeList(boardVo);
		model.addAttribute("comCode", comCode);
		//System.out.println(comCode);
		return "board/boardWrite";
	}
	
	@RequestMapping(value = "/board/boardWriteAction.do", method = RequestMethod.POST)
	@ResponseBody
	public String boardWriteAction(Locale locale,BoardVo boardVo) throws Exception{
		
		HashMap<String, String> result = new HashMap<String, String>();
		CommonUtil commonUtil = new CommonUtil();
		int resultCnt = boardService.boardInsert(boardVo);
		result.put("success", (resultCnt > 0)?"Y":"N");
		String callbackMsg = commonUtil.getJsonCallBackString(" ",result);
		System.out.println("callbackMsg::"+callbackMsg);
		System.out.println(result.getClass().getTypeName());
		return callbackMsg;
	}

}
	

