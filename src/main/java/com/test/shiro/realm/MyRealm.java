package com.test.shiro.realm;


import com.test.user.entity.UserEntity;
import com.test.user.service.UserService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Set;

/**
 * Created by zhph on 2016-12-19.
 */
@Service
@Transactional
public class MyRealm extends AuthorizingRealm {

    @Autowired
    private UserService userService;
    /**
     * Ϊ��ǰ��¼��Subject�����ɫ��Ȩ��
     *  ������:�����и÷����ĵ���ʱ��Ϊ����Ȩ��Դ������ʱ
     *  ������:����ÿ�η�������Ȩ��Դʱ����ִ�и÷����е��߼�,�����������Ĭ�ϲ�δ����AuthorizationCache
     *  ���˸о���ʹ����Spring3.1��ʼ�ṩ��ConcurrentMapCache֧��,����������Ƿ�����AuthorizationCache
     *  ����˵��������ݿ��ȡȨ����Ϣʱ,��ȥ����Spring3.1�ṩ�Ļ���,����ʹ��Shior�ṩ��AuthorizationCache
     */
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {
        //��ȡ��¼ʱ������û���
        String loginName=(String) principalCollection.fromRealm(getName()).iterator().next();
        //�����ݿ���Ƿ��д˶���
        UserEntity user= userService.findByName(loginName);
        if(user!=null){
            //Ȩ����Ϣ����info,������Ų�����û������еĽ�ɫ��role����Ȩ�ޣ�permission��
            SimpleAuthorizationInfo info=new SimpleAuthorizationInfo();
            //�û��Ľ�ɫ����
            Set<String> rolesName = userService.selectRolesName(loginName);
            info.setRoles(rolesName);
            //�û��Ľ�ɫ��Ӧ������Ȩ�ޣ����ֻʹ�ý�ɫ�������Ȩ�ޣ���������п��Բ�Ҫ\
            Set<String> permissionNames = userService.selectPermissionName(rolesName);
            info.addStringPermissions(permissionNames);

            /*List<Role> roleList=user.getRoleList();
            for (Role role : roleList) {
                info.addStringPermissions(role.getPermissionsName());
            }*/

            return info;
        }
        return null;
    }

    /**
     * ��֤��ǰ��¼��Subject
     * ������:�����и÷����ĵ���ʱ��ΪLoginController.login()������ִ��Subject.login()ʱ
     * @param authenticationToken
     * @return
     * @throws AuthenticationException
     */
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authenticationToken) throws AuthenticationException {
        //UsernamePasswordToken������������ύ�ĵ�¼��Ϣ
        UsernamePasswordToken token=(UsernamePasswordToken) authenticationToken;
        //����Ƿ��д��û�
        UserEntity user=userService.findByName(token.getUsername());
        if(user!=null){
            //�����ڣ������û���ŵ���¼��֤info��
            Subject subject = SecurityUtils.getSubject();
            Session session = subject.getSession();
            session.setAttribute("user",user);
            return new SimpleAuthenticationInfo(user.getAccount() , user.getLoginPass(), getName());
        }
        return null;
    }

    /**
     * ��һЩ���ݷŵ�ShiroSession��,�Ա��������ط�ʹ��
     *  ����Controller,ʹ��ʱֱ����HttpSession.getAttribute(key)�Ϳ���ȡ��
     */
    private void setSession(Object key, Object value){
        Subject currentUser = SecurityUtils.getSubject();
        if(null != currentUser){
            Session session = currentUser.getSession();

            System.out.println("SessionĬ�ϳ�ʱʱ��Ϊ[" + session.getTimeout() + "]����");
            if(null != session){
                session.setAttribute(key, value);
            }
        }
    }
}
