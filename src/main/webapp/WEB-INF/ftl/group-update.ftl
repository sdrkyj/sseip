<!doctype html>
<html>
<head>
<#include "/common/common_css.ftl">
    <title>修改部门信息</title>
</head>
<body class="no-skin">
<div class="main-content-inner">
    <!-- #section:basics/content.breadcrumbs -->
    <div class="breadcrumbs" id="breadcrumbs">
        <script type="text/javascript">
            /*try {
                ace.settings.check('breadcrumbs', 'fixed')
            } catch (e) {
            }*/
        </script>

        <ul class="breadcrumb">
            <li>
                <span class="ace-icon fa fa-home home-icon"></span>
                <a href="${context.contextPath}/" target="_top">Home</a>
            </li>
            <li><a href="${context.contextPath}/group/list/1">部门列表</a></li>
            <li class="active">修改部门信息</li>
        </ul>
        <!-- /.breadcrumb -->
    </div>

    <div class="page-content">
        <div class="row">
            <div class="col-xs-12">
                <!-- PAGE CONTENT BEGINS -->
                <form method="post" id="addForm" class="form-horizontal">
                    <!-- #section:elements.form -->
                <#if success??>
                    <div class="row">
                        <div class="col-sm-offset-3 col-sm-4 alert alert-success">${success}</div>
                    </div>
                </#if>
                <#if error??>
                    <div class="row">
                        <div class="col-sm-offset-3 col-sm-4 alert alert-danger">${error}</div>
                    </div>
                </#if>
                <#if errors??>
                    <#list errors as error>
                        <div class="row">
                            <div class="col-sm-offset-3 col-sm-4 alert alert-danger">${error}</div>
                        </div>
                    </#list>
                </#if>
                    <div class="form-group">
                        <label class="col-sm-3 control-label no-padding-right">部门名字</label>

                        <div class="col-sm-9">
                            <input name="name" type="text" size="30" class="col-xs-10 col-sm-5"
                                   placeholder="部门名字" value="${(group.name)!''}"/>
                        </div>
                    </div>

                    <div class="space-4"></div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label no-padding-right">部门描述</label>

                        <div class="col-sm-9">
                            <input class="col-xs-10 col-sm-5" id="description" type="text" name="description"
                                   placeholder="部门描述" value="${(group.description)!''}" title="部门描述"/>
                        </div>
                    </div>

                    <div class="clearfix form-actions">
                        <div class="col-md-offset-3 col-md-9">
                            <button class="btn btn-info" type="submit">
                                <span class="ace-icon fa fa-plus bigger-110"></span>提交修改
                            </button>
                            <button class="btn" type="reset">
                                <span class="ace-icon fa fa-undo bigger-110"></span>重置表单
                            </button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
        <!-- /.row -->
    </div>
</div>
<#include "/common/common_js.ftl">
<link rel="stylesheet" type="text/css" href="${context.contextPath}/resources/css/validate/main.css"/>
<script type="text/javascript" src="${context.contextPath}/resources/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="${context.contextPath}/resources/js/jquery.validate.js"></script>
<script type="text/javascript" src="${context.contextPath}/resources/js/core/jquery.cms.validate.js"></script>
<script type="text/javascript">
    $(function () {
//        $("#addForm").cmsvalidate();
        $("#refresh").click(function () {
            $('#captcha').attr('src', '${context.contextPath}/captcha?' + Date.now());
        });
    });
</script>

</body>
</html>