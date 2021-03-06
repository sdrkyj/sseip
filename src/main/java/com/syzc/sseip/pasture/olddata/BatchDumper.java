package com.syzc.sseip.pasture.olddata;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONReader;
import com.alibaba.fastjson.util.TypeUtils;
import com.syzc.sseip.dao.CustomerDao;
import com.syzc.sseip.dao.MemoDao;
import com.syzc.sseip.entity.CustomerDto;
import com.syzc.sseip.entity.Memo;
import com.syzc.sseip.util.HosException;
import com.syzc.sseip.util.LocalAcUtil;
import org.apache.log4j.Level;

import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.zip.GZIPInputStream;

public class BatchDumper {
    public static void dump(String path) throws IOException {
        CustomerDao cd = (CustomerDao) LocalAcUtil.getAc().getBean("customerDao");
        MemoDao md = (MemoDao) LocalAcUtil.getAc().getBean("memoDao");

        cd.alterAutoIncr();

//        JSONReader jr = new JSONReader(new BufferedReader(new FileReader("e:/customer-details.json"), 6553600));
//        JSONReader jr = new JSONReader(new BufferedReader(new InputStreamReader(new GZIPInputStream(new FileInputStream("e:/customer-details.json.gz"))), 6553600));
        JSONReader jr = new JSONReader(new BufferedReader(new InputStreamReader(new GZIPInputStream(new FileInputStream(path)), "UTF-8"), 6553600));

        int cnt = 0;
        CustomerDto dto;

        JSONArray ja = (JSONArray) jr.readObject();
//        JSONObject jo;

//        JSONWriter jw = new JSONWriter(new BufferedWriter(new FileWriter("e:/customer-details2.json"), 6553600));
//        jw.startArray();

        for (Object o : ja) {
//            jo = (JSONObject) o;
//            dto = TypeUtils.castToJavaBean(jo, CustomerDto.class);
            dto = TypeUtils.castToJavaBean(o, CustomerDto.class);
//            jw.writeValue(dto);

//            System.out.println(JSON.toJSONString(dto));

            try {
                cd.addOld(dto);
                for (Memo memo : dto.getMemos()) {
                    md.addToCustomerF(memo, dto.getId());
                }
            } catch (Exception e) {
                throw HosException.create(e, String.format("DB write error while dumping the old data, at row %d", cnt), Level.ERROR);
            }
        }

//        System.out.println(ja.size());
//        System.out.println(cnt);

//        jw.endArray();
//        jw.close();
    }

    public static void main(String[] args) throws IOException {
        dump("E:\\codeslike\\sseip\\src\\main\\webapp\\WEB-INF\\customer-details.json.gz");
    }
}