package com.test.common;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

/**
 * Created by zhph on 2016-12-21.
 */
@WebFilter(filterName = "RequestFilter")
public class RequestFilter implements Filter {
    public void destroy() {
    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest request = (HttpServletRequest) req;
        String path = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+ request.getContextPath();
        System.out.print(path);
        request.setAttribute("path",path);
        chain.doFilter(req, resp);
    }

    public void init(FilterConfig config) throws ServletException {

    }

}
