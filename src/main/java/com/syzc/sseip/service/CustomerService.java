package com.syzc.sseip.service;

import com.syzc.sseip.dao.CustomerDao;
import com.syzc.sseip.entity.Customer;
import com.syzc.sseip.entity.enumtype.pasture.AccessPointType;
import com.syzc.sseip.entity.enumtype.Sex;
import com.syzc.sseip.entity.enumtype.pasture.Website;
import com.syzc.sseip.entity.enumtype.pasture.DiseaseType;
import com.syzc.sseip.util.Page;

import java.util.Date;

public interface CustomerService extends BaseService<Customer, CustomerDao> {

    Page<Customer> listByGroup(Long groupId, Long pageNo, Byte size);

    Page<Customer> listByUser(Long userId, Long pageNo, Byte size);

    Page<Customer> listByFilter(Sex sex, Website website, AccessPointType accessPointType, DiseaseType diseaseType, Boolean faraway, Boolean emergency, Date since, Date till, Long groupId, Long userId, Long pageNo, Byte size);
}