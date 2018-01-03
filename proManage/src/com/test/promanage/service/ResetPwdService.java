package com.test.promanage.service;

import org.springframework.stereotype.Service;

@Service
public interface ResetPwdService {
	int selectByExample(String userid, String username);
}
