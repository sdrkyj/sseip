package com.syzc.sseip.controller;

import com.alibaba.fastjson.JSON;
import com.syzc.sseip.entity.User;
import com.syzc.sseip.service.UserService;
import com.syzc.sseip.util.UrlComponentUtil;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Service
public class LoginInteceptor extends HandlerInterceptorAdapter {
    @Resource
    UserService userService;

    public boolean preHandle(HttpServletRequest request,
                             HttpServletResponse response, Object handler) throws Exception {
        HttpSession session = request.getSession();
//        HandlerMethod hm = (HandlerMethod) handler;
        //可能是 DefaultServletHttpRequestHandler， 找不到对应的， 转而寻找静态资源。
        Object o = session.getAttribute("loginUser");
        if (o == null) {
            StringBuilder refer = new StringBuilder();
            refer.append(request.getRequestURL());
            if (request.getQueryString() != null) {
                refer.append('?');
                refer.append(request.getQueryString());
            }
            response.sendRedirect(request.getContextPath() + "/login?refer=" + UrlComponentUtil.encoding(refer.toString()));
            //kj代码里缺少的这个， 否则报已经提交——在后头的提交找不到内容的页面里。
            return false;
        }
        System.out.println(JSON.toJSONString(userService.get(((User) o).getId())));
        return super.preHandle(request, response, handler);
    }
}