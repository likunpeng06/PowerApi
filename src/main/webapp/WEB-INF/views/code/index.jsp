<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <jsp:include page="../common/style.jsp"></jsp:include>
</head>
<body class="horizontal-menu">
<section>
    <div class="mainpanel">
        <jsp:include page="../common/menu.jsp" flush="true">
            <jsp:param name="nav" value="2"/>
        </jsp:include>
        <div class="pageheader">
            <div class="row">
                <div class="col-md-11">
                    <h2>
                        <i class="fa fa-file-code-o"></i>${project.title }<span>项目业务代码</span>
                    </h2>
                </div>
                <div class="col-md-1">
                    <p>
                        <a class="btn btn-primary btn-block" href="create?proId=${project.id}">添加业务码
                        </a>
                    </p>
                </div>
            </div>

        </div>

        <div class="contentpanel">
            <div class="row">
                <c:if test="${status>0}">
                    <div class="col-md-12" id="action_alert">
                        <div class="alert alert-success">
                            <button type="button" class="close" data-dismiss="alert"
                                    aria-hidden="true">&times;</button>
                            操作成功!
                        </div>
                    </div>
                </c:if>

                <c:if test="${codes.size()==0}">
                    <div class="col-md-12">
                        <div class="alert alert-danger">
                            <button type="button" class="close" data-dismiss="alert"
                                    aria-hidden="true">&times;</button>
                            您目前还没有创建业务代码!
                        </div>
                    </div>
                </c:if>

                <div class="col-md-12">
                    <div class="table-responsive">
                        <table class="table table-primary table-buglist">
                            <thead>
                            <tr>
                                <th></th>
                                <th>代&nbsp;码&nbsp;</th>
                                <th>说&nbsp;明&nbsp;</th>
                                <th></th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="code" items="${codes}">
                                <tr>
                                    <td><c:if test="${code.isUpdate==1}">
                                        <span class="pull-right badge badge-danger">更新</span>
                                    </c:if></td>
                                    <td>${code.code}</td>
                                    <td>${code.description}</td>
                                    <td class="table-action"><a
                                            href="view?id=${code.id }&proId=${project.id}"
                                            class="edit-row"><i class="fa fa-pencil"></i></a>&nbsp;<a
                                            href="delete?id=${code.id }" class="delete-row"><i
                                            class="fa fa-trash-o"></i></a></td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                    <ul class="pagination pagination-split nomargin">
                        <li class="disabled"><a href="#"><i
                                class="fa fa-angle-left"></i></a></li>
                        <li><a href="#"><i class="fa fa-angle-right"></i></a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</section>
<jsp:include page="../common/scripts.jsp"></jsp:include>
</body>
</html>