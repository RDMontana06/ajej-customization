<%@ page contentType="text/html;charset=UTF-8" %>


<!DOCTYPE html>


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="layout" content="main">
        <title>ATM Interface Screen</title>
    </head>
    <body>
        <content tag="main-content">
            <g:if test="${flash.message}">
                <div class="box-body">
                    <div class="alert alert-info alert-dismissable">
                        <i class="fa fa-info"></i>
                        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                        <b>Message</b> <div class="message" role="status">${flash.message}</div>
                    </div>
                </div>
            </g:if>

        </content>
        
        <content tag="main-actions">
            <ul>
            </ul>                                        
        </content>
    </body>
</html>
