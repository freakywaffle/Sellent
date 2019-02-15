package com.sellent.web.dao;

import java.util.List;

import com.sellent.web.entity.ProductFile;
import com.sellent.web.entity.QnaFile;

public interface QnaFileDao {
	int insert(QnaFile qnaFile);
	List<QnaFile> get(int no);
}
