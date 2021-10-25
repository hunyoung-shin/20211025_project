package com.spring.board.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.board.dao.BoardDao;
import com.spring.board.vo.BoardVo;
import com.spring.board.vo.PageVo;

@Repository
public class BoardDaoImpl implements BoardDao{
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public String selectTest() throws Exception {
		// TODO Auto-generated method stub
		
		String a = sqlSession.selectOne("board.boardList");
		
		return a;
	}

	@Override
	public List<BoardVo> selectBoardList(PageVo pageVo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList("board.boardList",pageVo);
	}
	
	@Override
	public int selectBoardCnt() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("board.boardTotal");
	}
	
	@Override
	public BoardVo selectBoard(BoardVo boardVo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("board.boardView", boardVo);
	}
	
	/*
	 * @Override public int boardInsert(BoardVo boardVo) throws Exception { // TODO
	 * Auto-generated method stub return sqlSession.insert("board.boardInsert",
	 * boardVo.getBoardVoList()); }
	 */
	@Override
	public List<BoardVo> takeBoard(PageVo pageVo)throws Exception{
			
		return sqlSession.selectList("board.takeBoard", pageVo);
	}
	
	
	@Override
	public int boardModify(BoardVo boardVo) throws Exception{
		
		return sqlSession.update("board.boardModify", boardVo);
	}
	@Override
	public int boardDelete(BoardVo boardVo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.delete("board.boardDelete", boardVo);
	}
	@Override
	public int boardInsert(BoardVo boardVo) {
		int count = boardVo.getBoardVoList().size();
		int chkcount = 0;
		int i = 0;
		while(chkcount < count) {
			try {
				boardVo.setBoardType(boardVo.getBoardVoList().get(i).getBoardType());
				boardVo.setBoardTitle(boardVo.getBoardVoList().get(i).getBoardTitle());
				boardVo.setBoardComment(boardVo.getBoardVoList().get(i).getBoardComment());
				sqlSession.insert("board.boardInsert", boardVo);
				chkcount += 1;
				i += 1;
			}
			catch(Exception e) {
				i += 1;
				if(i > count) {
					break;
				}
			}
		}
		
		return 1;
	}
	@Override
	public List<BoardVo> comCodeList(BoardVo boardVo)throws Exception{
		
		return sqlSession.selectList("board.comCodeList", boardVo);
	}
}
