package com.ssafy.happyhouse.model.dao;

import java.util.List;

import com.ssafy.happyhouse.model.BoardDto;
import com.ssafy.happyhouse.model.BoardFileDto;

public interface BoardDao {
	public int boardInsert(BoardDto dto);
	public int boardUpdate(BoardDto dto);
	public int boardDelete(int boardId);
	
	public BoardDto boardDetail(int boardId);
	
	public List<BoardDto> boardList(int limit, int offset);
	public int boardListTotalCnt();
	
	public List<BoardDto> boardListSearchWord(int limit, int offset, String searchWord);
	public int boardListSearchWordTotalCnt(String searchWord);
	
	// New for FileUpload
	public int boardFileInsert(BoardFileDto dto);
	public List<BoardFileDto> boardDetailFileList(int boardId);
	public int boardFileDelete(int boardId);
	public List<String> boardFileUrlDeleteList(int boardId);
	
	// New for ReadCnt
	public int boardUserReadCount(int boardId, int userSeq);
	public int boardUserReadInsert(int boardId, int userSeq);
	public int boardReadCountUpdate(int boardId);
}