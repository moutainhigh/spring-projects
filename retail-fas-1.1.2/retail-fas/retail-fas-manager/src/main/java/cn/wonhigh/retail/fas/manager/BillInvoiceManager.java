package cn.wonhigh.retail.fas.manager;

import java.util.List;
import java.util.Map;

import cn.wonhigh.retail.fas.common.model.BillInvoice;

import com.yougou.logistics.base.common.exception.ManagerException;
import com.yougou.logistics.base.manager.BaseCrudManager;

/**
 * 请写出类的用途 
 * @author wang.m1
 * @date  2014-11-27 10:56:55
 * @version 1.0.0
 * @copyright (C) 2013 YouGou Information Technology Co.,Ltd 
 * All Rights Reserved. 
 * 
 * The software for the YouGou technology development, without the 
 * company's written consent, and any other individuals and 
 * organizations shall not be used, Copying, Modify or distribute 
 * the software.
 * 
 */
public interface BillInvoiceManager extends BaseCrudManager {

	int verify(BillInvoice obj)throws ManagerException;

	List<BillInvoice> selectFooter(Map<String, Object> params)throws ManagerException;

	List<BillInvoice> setTargetCurencyPropertites(List<BillInvoice> list,Map<String, String> currencyInfo) throws ManagerException;

}