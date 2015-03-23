<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="template/productHeader.html" %>
<body>

<!-- Left side content -->
<%@ include file="template/leftSidebar.html" %>
<!-- Right side -->
<div id="rightSide">

    <!-- Top fixed navigation -->
    <%@ include file="template/topNav.html" %>
    <!-- Responsive header -->
    <%@ include file="template/responsiveHeader.html" %>
    <!-- Title area -->
    <%@ include file="template/titleArea.html" %>
    <div class="line"></div>
    <!-- Shortcuts -->
    <%@ include file="template/shortcuts.html" %>
    <div class="line"></div>

    <!-- Main content wrapper -->
    <div class="wrapper">

        <!-- Validation form -->
        <form:form id="validate" commandName="product" class="form" method="post" action="/admin/addProduct">
            <fieldset>
                <div class="widget">
                    <div class="title"><img src="img/icons/dark/alert.png" alt="" class="titleIcon" /><h6>Add a product</h6></div>
                    <div class="formRow">
                        <form:label path="name">Product Name<span class="req">*</span></form:label>
                        <div class="formRight"><form:input path="name" type="text" class="validate[required]"  name="name" id="name"/></div><div class="clear"></div>
                    </div>
                    <div class="formRow">
                        <form:label path="weight">Product Weight<span class="req">*</span></form:label>
                        <div class="formRight"><form:input path="weight" class="validate[required]" type="text" name="weight" id="weight" /></div><div class="clear"></div>
                    </div>
                    <div class="formRow">
                        <form:label path="regularPrice">Regular Price<span class="req">*</span></form:label>
                        <div class="formRight"><form:input  path="regularPrice" class="validate[required]" type="text" name="regularprice" id="regularprice"/></div><div class="clear"></div>
                    </div>
                    <div class="formRow">
                        <form:label path="salesPrice">Sales Price<span class="req">*</span></form:label>
                        <div class="formRight"><form:input path="salesPrice" type="text" class="validate[required]" name="salesprice" id="salesprice"/></div><div class="clear"></div>
                    </div>
                    <div class="formRow">
                        <form:label path="itemsperbox">Items/Box:<span class="req">*</span></form:label>
                        <div class="formRight"><form:input path="itemsperbox" class="validate[required]" type="text"  name="itemsperbox" id="itemsperbox"/></div><div class="clear"></div>
                    </div>
                    <div class="formRow">
                    <div><form:radiobutton path="enabled"  value="1" id="enabled" name="radioReq" data-prompt-position="topRight:102" /><form:label path="enabled" for="enabled">Enabled</form:label></div>
                    <div><form:radiobutton path="enabled" value="0" id="disabled" name="radioReq" data-prompt-position="topRight:102" /><form:label path="enabled" for="disabled">Disabled</form:label></div>
                    </div>
                    <div class="formRow">
                        <div><form:radiobutton path="featured"  value="1" id="featured" name="radioReq" data-prompt-position="topRight:102" /><form:label path="featured" for="enabled">Featured</form:label></div>
                        <div><form:radiobutton path="featured" value="0" id="notfeatured" name="radioReq" data-prompt-position="topRight:102" /><form:label path="featured" for="disabled">Not Featured</form:label></div>
                    </div>
                    <div class="formRow">
                        <form:label path="">Description:<span class="req">*</span></form:label>
                        <div class="formRight"><form:textarea path="description" rows="8" cols="" name="textarea" class="validate[required]" id="description"/></div><div class="clear"></div>
                    </div>
                    <div class="formSubmit"><input type="submit" value="submit" class="redB" /></div>
                    <div class="clear"></div>

                </div>

            </fieldset>
        </form:form>



    </div>

    <!-- Footer line -->
    <%@ include file="template/Footer.html" %>

</div>

<div class="clear"></div>

</body>
</html>