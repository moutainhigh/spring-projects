package cn.wonhigh.retail.fas.service;

import cn.wonhigh.retail.fas.dal.database.SelfShopDepositAccountMapper;
import com.yougou.logistics.base.dal.database.BaseCrudMapper;
import com.yougou.logistics.base.service.BaseCrudServiceImpl;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;

/**
 * 请写出类的用途 
 * @author user
 * @date  2015-08-17 16:59:10
 * @version 1.0.0
 * @copyright (C) 2013 WonHigh Information Technology Co.,Ltd 
 * All Rights Reserved. 
 * 
 * The software for the WonHigh technology development, without the 
 * company's written consent, and any other individuals and 
 * organizations shall not be used, Copying, Modify or distribute 
 * the software.
 * 
 */
@Service("selfShopDepositAccountService")
class SelfShopDepositAccountServiceImpl extends BaseCrudServiceImpl implements SelfShopDepositAccountService {
    @Resource
    private SelfShopDepositAccountMapper selfShopDepositAccountMapper;

    @Override
    public BaseCrudMapper init() {
        return selfShopDepositAccountMapper;
    }
}