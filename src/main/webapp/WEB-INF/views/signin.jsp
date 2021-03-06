<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <jsp:include page="common/style.jsp"></jsp:include>
</head>
<body class="signin">
<section>
    <div class="signinpanel">
        <div class="row">
            <div class="col-md-7">
                <div class="signin-info">
                    <div class="logopanel">
                        <h1>
                            <span>[</span> Power.API <span>]</span>
                        </h1>
                    </div>

                    <div class="mb20"></div>
                    <h5>
                        <strong>欢迎来到Power.API</strong>
                    </h5>
                    <ul>
                        <li><i class="fa fa-arrow-circle-o-right mr5"></i> 项目管理，不同维度的项目把控</li>
                        <li><i class="fa fa-arrow-circle-o-right mr5"></i> 测试管理，接口一键测试及自动化</li>
                        <li><i class="fa fa-arrow-circle-o-right mr5"></i> 成员管理，细分权限保障接口数据安全</li>
                    </ul>
                    <div class="mb20"></div>
                    <strong>还没开始使用Power.API?&nbsp;&nbsp;<a
                            href="signup">快速注册</a></strong>
                </div>
            </div>
            <div class="col-md-5">

                <c:if test="${error!=null}">
                    <div class="alert alert-danger">
                        <button type="button" class="close" data-dismiss="alert"
                                aria-hidden="true">&times;</button>
                            ${error}
                    </div>
                </c:if>
                <form method="post" action="signin">
                    <h4 class="nomargin">登录</h4>
                    <input type="text" name="username" class="form-control uname"
                           placeholder="用户名"/> <input type="password" name="passwd"
                                                      class="form-control pword" placeholder="密码"/>
                    <%--<small>忘记密码?</small>--%>
                    <br/> <input type="checkbox" value="1" readonly="readonly" checked="checked" name="rememberme"/> 记住我

                    <button class="btn btn-success btn-block">登录</button>

                </form>
            </div>
        </div>
        <div class="signup-footer">
            <div class="pull-left">
                &copy;2016 <a href="http://www.melonlee.com">Melon</a>@www.powerapi.cn
                All Rights Reserved.京ICP备:15006746
            </div>
        </div>
    </div>
</section>
<jsp:include page="common/scripts.jsp"></jsp:include>
</body>
</html>
