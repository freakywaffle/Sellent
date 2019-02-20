package com.sellent.web.service;

import java.io.File; 
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.sellent.web.dao.MemberDao;
import com.sellent.web.dao.MemberRoleDao;
import com.sellent.web.dao.SkillDao;
import com.sellent.web.entity.Member;
import com.sellent.web.entity.MemberRole;
import com.sellent.web.entity.Skill;
 

@Service
public class SellentMemberService implements MemberService {
	
	@Autowired
	private MemberDao memberDao;
	@Autowired
	private SkillDao skillDao;
	@Autowired
	private MemberRoleDao memberRoleDao;

	@Override
	public int insertMember(Member member, String skill, MultipartFile filedata) {
		// TODO Auto-generated method stub
		member.setPhoto(filedata.getOriginalFilename());
		memberDao.insertMember(member);
		String [] skills = skill.split(",");
		for(String s: skills) {
			Skill sk = new Skill();
			sk.setMemberId(member.getId());
			System.out.println("skill-memberid= " + sk.getMemberId());
			sk.setName(s);	
			System.out.println("skill-skillname= " + sk.getName());
			skillDao.insert(sk);
		}
		MemberRole memberRole = new MemberRole(member.getId(),"ROLE_MEMBER");
		memberRoleDao.insert(memberRole);
		
		
		
		String filePath = "F:\\sellent\\profile\\";
		System.out.println(filedata.getOriginalFilename());
		String path = filePath+member.getId();
		File dir = new File(path);
		if (!dir.isDirectory()) {
			dir.mkdir();
		}
		byte[] data;
		try {
			data = filedata.getBytes();
			FileOutputStream fos = new FileOutputStream(path + "\\" + filedata.getOriginalFilename());
			fos.write(data);
			fos.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	
	}


	

}
