package com.syzc.sseip.service;

import com.syzc.sseip.entity.User;
import com.syzc.sseip.entity.UserLogon;
import com.syzc.sseip.util.LocalAcUtil;
import org.springframework.context.ApplicationContext;

public class UserServiceImplTest {
    public static void main(String[] args) {
        ApplicationContext ac = LocalAcUtil.getAc();
        UserService s = (UserService) ac.getBean("userService");
        User user;
        user = s.get(1L);
//        System.out.println(JSON.toJSONString(user, true));
//        s.changeGroup(1L, 1L);
        user = s.get(1L);
//        System.out.println(JSON.toJSONString(user, true));

        UserLogon userLogon;
        userLogon = new UserLogon();
        userLogon.setLastIP("123123");
        userLogon.setUserId(8L);
        System.out.println(s.saveLogonInfo(userLogon));
    }
}