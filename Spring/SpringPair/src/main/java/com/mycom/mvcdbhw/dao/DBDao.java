package com.mycom.mvcdbhw.dao;

import java.util.List;

import com.mycom.mvcdbhw.dto.QuizDto;

public interface DBDao {
	public QuizDto quizDetail(int q_index);
	public List<QuizDto> quizList();
	public int quizInsert(QuizDto dto);
	public int quizUpdate(QuizDto dto);
	public int quizDelete(int q_index);
}