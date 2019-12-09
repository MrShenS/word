package com.csu.gymms.service;

import com.csu.gymms.dao.impl.DaoFactory;

public class PurchaseTrainerService {
	
	public static void insertPurchaseTrainer(Object obj) {
		new DaoFactory().createPurchaseTrainer().insertPurchaseTrainer(obj);
	}

}
