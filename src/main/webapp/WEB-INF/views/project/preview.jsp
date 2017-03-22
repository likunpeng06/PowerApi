<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="host" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <jsp:include page="../common/style.jsp"></jsp:include>
    <style type="text/css">
        .table-hover > tbody > tr:hover > td, .table-hover > tbody > tr:hover > th {
            background-color: #bbbbbb;
            cursor: hand;
        }
    </style>
</head>
<body>
<jsp:include page="../common/leftmenu.jsp" flush="true">
    <jsp:param name="nav" value="2"/>
</jsp:include>
<section>
    <div class="mainpanel">

        <jsp:include page="../common/pageheader.jsp">
            <jsp:param name="index" value="5"/>
        </jsp:include>
        <div class="tab-content">
            <div class="tab-pane active">
                <div class="row">
                    <div class="col-md-12">
                        <div class="col-sm-2 col-lg-2">
                            <br/>
                            <ul class="nav nav-pills nav-stacked nav-email mb20"
                                id="module_nav">
                                <c:forEach var="module" items="${modules}">
                                    <li id="${module.id}" title="${module.title}"
                                        data-url="${module.url}" data-desc="${module.description}"
                                        class="module_nav_row"><a href="#"> <i
                                            class="glyphicon glyphicon-folder-open"></i> ${module.title } <span
                                            class="pull-right badge badge-success">${module.functions }</span>
                                    </a></li>
                                </c:forEach>
                            </ul>
                        </div>
                        <div class="col-sm-3 col-lg-3">
                            <div class="panel panel-default">
                                <div class="panel-body">
                                    <div class="table-responsive">
                                        <table class="table table-hover mb30 table-success">
                                            <thead>
                                            <tr>
                                                <th>#名称</th>
                                            </tr>
                                            </thead>
                                            <tbody id="function_row">
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-7 col-lg-7">
                            <div class="panel panel-default">
                                <div class="panel-body" id="function_detail">
                                    <blockquote>
                                        <i class="fa fa-quote-left"></i>
                                        <p id="detail_url"></p>
                                    </blockquote>

                                    <div class="panel-heading">
                                        <h4 class="panel-title">接口参数</h4>
                                        <p>
                                        <table class="table mb30 table-primary">
                                            <thead>
                                            <tr>
                                                <th>名称</th>
                                                <th>类型</th>
                                                <th>说明</th>
                                                <th>必填</th>
                                                <th>示例</th>
                                                <th>默认值</th>
                                                <th></th>
                                            </tr>
                                            </thead>
                                            <tbody id="params">
                                            </tbody>
                                        </table>
                                        </p>
                                    </div>
                                    <div class="panel-heading">
                                        <h4 class="panel-title">返回示例</h4>
                                        <p id="response_body"></p>
                                    </div>
                                    <div class="panel-heading">
                                        <h4 class="panel-title">请求方式</h4>
                                        <p id="method"></p>
                                    </div>
                                    <div class="panel-heading">
                                        <h4 class="panel-title">返回类型</h4>
                                        <p id="response_type"></p>
                                    </div>
                                    <div class="panel-heading">
                                        <h4 class="panel-title">接口说明</h4>
                                        <p id="description"></p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</section>
<jsp:include page="../common/scripts.jsp"></jsp:include>
<script src="${host}/static/js/service/project.js"></script>
</body>
</html>