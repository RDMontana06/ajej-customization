<!DOCTYPE html>
<html>
  <head>
    <meta name="layout" content="login">
    <title></title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport' />
    
    
    <asset:stylesheet src="myCustomStyleSheet.css"/>
    <asset:stylesheet src="bootstrap.min.css"/>
    <asset:stylesheet src="AdminLTE/morris/morris.css"/>
    <asset:stylesheet src="alertify.min.css"/>
    <asset:stylesheet src="themes/semantic.min.css"/>
    <!-- jvectormap -->
    <asset:stylesheet src="AdminLTE/jvectormap/jquery-jvectormap-1.2.2.css"/>
    <!-- bootstrap wysihtml5 - text editor -->
    <asset:stylesheet src="AdminLTE/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css"/>
    <!-- Theme style -->
    <!--asset:stylesheet src="AdminLTE/AdminLTE.css"/-->
    <!-- asset:javascript src="notify.js"/ -->
    <asset:javascript src="alertify.min.js"/>
    <script>
        
        $( document ).ready(function() {
            console.log( "ready!" );
            AppTitle = "MB-ExpressO";
            console.log("AppTitle: "+AppTitle);
            alertify.defaults.theme.ok = "btn btn-primary";
            alertify.defaults.theme.cancel = "btn btn-danger";
            alertify.defaults.theme.input = "form-control";  
        });
    </script>    
  </head> 
  <body class="bg-black">
    <content tag="main-content">
     <div class="form-box-msg" id="message-log-box">
       <g:if test="${flash.success}">
          <div style="margin:auto" class="box-bodylogin">
              <div class="alert alert-info alert-dismissable">
                  <i class="fa fa-info"></i>
                  <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                  <b>Message</b> <div class="message" role="status">${flash.success}</div>
              </div>
          </div>
      </g:if>
      <g:if test="${flash.error}">
          <div style="margin:auto" class="box-bodylogin">
              <div class="alert alert-danger alert-dismissable">
                  <i class="fa fa-exclamation"></i>
                  <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                  <b>Message</b> <div class="message" role="status">${flash.error}</div>
              </div>
          </div>
      </g:if>
     </div>
     <!--<div class="box bg-white">-->
     <div class="form-box" id="login-box">
       <div class="header">
            <img class="banner" src="${resource(dir: "images", file: "expresso.png")}">
       </div>
        <g:form controller="authentication" action="authenticate">
         <div class="body bg-gray">
          <div class="form-group1 fieldcontain ${hasErrors(bean: userMasterInstance, field: 'userName', 'error')} ">
            <!--<div class="col-sm-4">-->
            <!--<div class="col-sm-12"> -->
              <g:textField id="userNameFL" name="username" value="${userMasterInstance?.username}" class="form-control1" placeholder="Username (case-sensitive)" />
            <!--</div>-->
          </div>
          <div class="form-group1 fieldcontain ${hasErrors(bean: userMasterInstance, field: 'password', 'error')} ">
            <!--<div class="col-sm-4">-->
            <!--<div class="col-sm-12">-->
              <g:field id="passsWordFL" type="password" name="password" value="${userMasterInstance?.password}" class="form-control1" placeholder="Password (case-sensitive)" />
              <g:hiddenField id="plugOnOffLogUser" name="plugOnOffLogUser" value="false" />
          </div>
         </div>
          <!--<div class="form-group form-buttons">-->

            <g:if test="${flash.error == 'You are logged in other terminal.'}">
            <div class="footer" style="text-align: center;height: 100px;">
                <g:submitButton id="clickmeFL" name="login" class="btn btn-success btn-block" value="Login"/>  
                <a href="#"  class="btn btn-danger btn-block" data-toggle="modal" data-target="#myModalHelpLogout" style="text-align: center;" onClick="">Help Me Log Out</a>
                </br>
            </div>    
            </g:if>
            <g:else>
            <div class="footer">
                <g:submitButton  id="clickmeFL" name="login" class="btn btn-success btn-block" value="Login"/>  
            </div>                 
            </g:else>
        </g:form>

          
<div id="myModalHelpLogout" class="modal fade" role="dialog">
    
   <div class="modal-dialog">
    <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title" style="color: black;text-align: center;">MB-ExpressO</h4>
            </div>
            
            <div class="modal-body" style="text-align: center;">
                 <h3>Enter Your Credentials</h3>
                 <h4>(force logout your user)</h4>
                 <g:textField id="userFLusername" name="userFLusername"  class="form-control " style="width: 50%;margin: auto;text-align: center;" placeholder="Enter Username (case-sensitive)"/>
                 </br>
                 <g:passwordField id="userFLpassword" name="userFLpassword" type="password"  class="form-control " style="width: 50%;margin: auto;text-align: center;" placeholder="Enter Password (case-sensitive)" />
            </div>
            
            <div class="modal-footer" style="text-align: center;">
                <a href ="#" onclick="validateOverride();" id="sender" name="sender" class="btn btn-primary">Submit</a>
                <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                
            </div>
            <script>
                function validateOverride(){
                    var thetheusername = $('#userFLusername').val();
                    var thethepassword = $('#userFLpassword').val();
                    //console.log("thetheusername: "+thetheusername);
                    //console.log("thethepassword: "+thethepassword);
                    alertify.confirm(AppTitle,"Are you sure you want to force logout this user?",
                      function(){
                        //userNameFL/passsWordFL/plugOnOffLogUser
                        $('#userNameFL').val($('#userFLusername').val());
                        $('#passsWordFL').val($('#userFLpassword').val());
                        $('#plugOnOffLogUser').val('true');
                        document.getElementById("clickmeFL").click();
 
                      },
                      function(){
                        
                      }
                    );
                }
            </script>    

        </div>

    </div>

</div>
<!-- modal close -->          
      </div>
    </content>
  </body> 
</html>
