<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<%@ page session="true" %>

<%@ include file="template/header.jsp" %>
<div class="row">
    <!-- Register Account-->
    <div class="span10 pull-right">
        <h1 class="heading1"><span class="maintext">Register Account</span><span class="subtext">Register Your details with us</span>
        </h1>

        <form:form commandName="account" action="/register" method="post" class="form-horizontal">
            <form:errors path="*" cssClass="error"/>
            <h3 class="heading3">Your Personal Details</h3>

            <div class="registerbox">
                <fieldset>
                    <div class="control-group">

                        <form:hidden path="roleId" value="2"/>
                        <form:hidden path="enabled" value="1"/>
                        <form:label path="firstname" class="control-label"><span class="red">*</span> First Name:</form:label>

                        <div class="controls" >
                            <form:input path="firstname" type="text" class="input-xlarge"></form:input>
                        </div>
                    </div>
                    <div class="control-group">
                        <form:label path="surname" class="control-label"><span class="red">*</span> Last Name:</form:label>

                        <div class="controls">
                            <form:input path="surname" type="text" class="input-xlarge"/>
                        </div>
                    </div>
                    <div class="control-group">
                        <form:label path="email" class="control-label"><span class="red">*</span> Email:</form:label>

                        <div class="controls">
                            <form:input path="email" type="text" class="input-xlarge"/>
                        </div>
                    </div>
                    <div class="control-group">
                        <form:label path="mobile" class="control-label"><span class="red">*</span> Mobile:</form:label>

                        <div class="controls">
                            <form:input  path="mobile" type="text" class="input-xlarge"/>
                        </div>
                    </div>

                    <div class="control-group">
                        <form:label path="gender" class="control-label"><span class="red">*</span> Gender:</form:label>

                        <div class="inline controls">

                            <form:radiobutton label="Male" name = "gender" path="gender" value="1" class="input-xlarge"/>
                            <form:radiobutton label="Female" name = "gender" path="gender" value="2" class="input-xlarge"/>
                        </div>
                    </div>
                    <div class="control-group">
                        <form:label path="dob" class="control-label"><span class="red">*</span> Date of Birth:</form:label>

                        <div class="controls">
                            <fmt:formatDate value="${dob}" var="dob"
                                            pattern="yyyy-MM-dd" />
                            <form:input class="date-pick input-xlarge"
                                        path="dob" name="end"
                                        value = "${dob}"  type="date"/>
                        </div>
                    </div>

                </fieldset>
            </div>
            <h3 class="heading3">Your Address</h3>

            <div class="registerbox">
                <fieldset>
                    <div class="control-group">
                        <form:label path="addresslineone" class="control-label"><span class="red">*</span> Address 1:</form:label>

                        <div class="controls">
                            <form:input path="addresslineone" type="text" class="input-xlarge"/>
                        </div>
                    </div>
                    <div class="control-group">
                        <form:label path="addresslinetwo" class="control-label"> Address 2:</form:label>

                        <div class="controls">
                            <form:input path="addresslinetwo" type="text" class="input-xlarge"/>
                        </div>
                    </div>
                    <div class="control-group">
                        <form:label path="city" class="control-label">
                            <span class="red">*</span>City:</form:label>

                        <div class="controls">
                            <form:input path="city" type="text" class="input-xlarge"/>
                        </div>
                    </div>
                    <div class="control-group">
                        <form:label path="postcode" class="control-label">
                            <span class="red">*</span>Post Code:</form:label>

                        <div class="controls">
                            <form:input path="postcode" type="text" class="input-xlarge"/>
                        </div>
                    </div>
                    <div class="control-group">
                        <form:label path="country" for="select01" class="control-label">
                            <span class="red">*</span>Country:</form:label>

                        <div class="controls">
                            <form:select path="country" id="select01" class="span3">
                                <form:option value="United Kingdom">United Kindom</form:option>
                                <form:option value="United States">United States</form:option>
                            </form:select>
                        </div>
                    </div>
                </fieldset>
            </div>
            <h3 class="heading3">Login Details</h3>

            <div class="registerbox">
                <fieldset>
                    <div class="control-group">

                        <form:label path="username" class="control-label"><span class="red">*</span> Username:</form:label>

                        <div class="controls">
                            <form:input path="username" type="text" class="input-xlarge"/>
                        </div>
                    </div>
                    <div class="control-group">
                        <form:label path="password" class="control-label"><span class="red">*</span> Password:</form:label>

                        <div class="controls">
                            <form:input path="password" type="password" class="input-xlarge"/>
                        </div>
                    </div>
                </fieldset>
            </div>

            <div class="pull-right">
                <input type="Submit" class="btn btn-orange" value="Register">
            </div>
        </form:form>
        <div class="clearfix"></div>
        <br>
    </div>
</div>
</div>
</section>
</div>
<%@ include file="template/footer.html" %>
</body>
</html>