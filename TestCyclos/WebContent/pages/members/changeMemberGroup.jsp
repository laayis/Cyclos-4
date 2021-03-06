<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags/struts-bean" prefix="bean" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags/struts-html" prefix="html" %>
<%@ taglib uri="http://sslext.sf.net/tags/sslext" prefix="ssl" %>
<%@ taglib uri="http://devel.cyclos.org/tlibs/cyclos-core" prefix="cyclos" %>

<cyclos:script src="/pages/members/changeMemberGroup.js" />
<script>
	var permanentRemoveConfirmationMessage = "<cyclos:escapeJS><bean:message key="changeGroup.member.confirmPermanentRemove"/></cyclos:escapeJS>";
</script>
<ssl:form action="${formAction}" method="post">
<html:hidden property="memberId" />
<table class="defaultTableContent" cellspacing="0" cellpadding="0">
    <tr>
        <td class="tdHeaderTable"><bean:message key="changeGroup.member.title" arg0="${member.name}"/></td>
        <cyclos:help page="groups#change_group"/>
    </tr>
    <tr>
        <td colspan="2" align="left" class="tdContentTableForms">
            <table class="defaultTable">
				<tr>
                	<td class="label" width="20%"><bean:message key="changeGroup.current"/></td>
                	<td><input class="large InputBoxDisabled" readonly="readonly" value="${member.group.name}"></td>
                </tr>
                <c:choose><c:when test="${permanentlyRemoved}">
					<tr>
	                	<td colspan="2" align="center" class="fieldDecoration">
	                		
	                		<bean:message key="changeGroup.removedMember"/>
	                	</td>
	                </tr>
                </c:when><c:otherwise>
					<tr>
	                	<td class="label"><bean:message key="changeGroup.new"/></td>
	                	<td>
	                		<html:select property="newGroupId">
	                			<html:option value=""><bean:message key="global.select.empty" /></html:option>
	                			<c:forEach var="current" items="${possibleGroups}">
		                			<html:option value="${current.id}"><cyclos:escapeHTML>${current.name}</cyclos:escapeHTML></html:option>
	                			</c:forEach>
	                		</html:select>
	                	</td>
	                </tr>
	                <tr>
	                	<td valign="top" class="label"><bean:message key="remark.comments"/></td>
	                	<td><html:textarea styleId="comments" styleClass="full" rows="5" property="comments"/></td>
	                </tr>
                </c:otherwise></c:choose>
	   			<c:if test="${!permanentlyRemoved}">
	               	<tr>
	               		<td colspan="2" align="right">
						   	<input type="submit" value="<bean:message key="global.submit"/>" class="button">
						</td>
					</tr>
				</c:if>
			</table>
		</td>
	</tr>
</table> 

<table class="defaultTableContentHidden">
	<tr>
		<td width="10%"><input type="button" id="backButton" id="backButton" class="button" value="<bean:message key="global.back"/>"></td>
		<td align="right">
   			<c:if test="${canRemove}">
   				&nbsp;&nbsp;
	   			<span class="label"><bean:message key="changeGroup.action.remove"/></span>
	   			<input type="button" id="removeButton" value="<bean:message key="global.submit"/>" class="button">
   			</c:if>
		</td>
	</tr>
</table>
</ssl:form>
            	
<c:if test="${not empty history}">
	<table class="defaultTableContent" cellspacing="0" cellpadding="0">
		<tr>
			<td class="tdHeaderTable" style="height: 19px"><bean:message key="changeGroup.title.history" arg0="${member.name}"/></td>
			<td class="tdHelpIcon">&nbsp;</td>
		</tr>
		<tr>
			<td colspan="2" align="left" class="tdContentTableLists">
				<c:forEach var="remark" items="${history}" varStatus="loop">
					<c:if test="${loop.count > 1}">
						<hr/>
					</c:if>
		            <table style="width:100%" cellspacing="0" cellpadding="0">
		                <tr>
		                    <td class="tdHeaderContents" width="25%"><bean:message key="remark.date"/></td>
		                    <td><cyclos:format dateTime="${remark.date}"/></td>
		                </tr>
		                <tr>
							<td class="tdHeaderContents" width="25%" align="center"><bean:message key="changeGroup.old"/></td>
							<td>${remark.oldGroup.name}</td>
						</tr>
		                <tr>
							<td class="tdHeaderContents" width="25%" align="center"><bean:message key="changeGroup.new"/></td>
							<td>${remark.newGroup.name}</td>
						</tr>
		                <tr>
							<td class="tdHeaderContents" width="25%" align="center"><bean:message key="remark.writer"/></td>
							<td>${remark.writer.name}</td>
						</tr>
		                <tr>
							<td class="tdHeaderContents" width="25%" valign="top" align="center"><bean:message key="remark.comments"/></td>
							<td><cyclos:escapeHTML>${remark.comments}</cyclos:escapeHTML></td>
						</tr>
		            </table>
	            </c:forEach>
			</td>
		</tr>
	</table>
</c:if>