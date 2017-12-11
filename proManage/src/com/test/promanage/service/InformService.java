package com.test.promanage.service;

import org.springframework.stereotype.Service;

import com.test.promanage.po.TableInform;

@Service
public interface InformService {

	int addInform(TableInform tableInform)throws Exception;
}
