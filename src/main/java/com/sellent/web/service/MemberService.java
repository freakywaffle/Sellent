package com.sellent.web.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.sellent.web.entity.Member;
import com.sellent.web.entity.MemberRole;
import com.sellent.web.entity.Skill;


public interface MemberService {

	int insertMember(Member member, String skill, MultipartFile filedata);

}
