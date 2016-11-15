<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script type="text/javascript" src="js/jquery-1.11.0.min.js"></script>	
<title>Insert title here</title>
</head>
<body>
<p id="result2"></p>
</body>
<script type="text/javascript">
	$(document).ready(function(){
         $.ajax({
             url : 'http://diadiem.com/Comp.aspx',
             type : 'POST',
             dataType : 'json',
             data: {"stpe":"1","st":"HaNoi","F":"","C":"","K":"vlxd","A":"0_0","S":"M","P":"1","R":"2","fD":"1","uID":"0","cID":"0","dID":"0"},
             success : function (result){
                 
                 var html = '';
                 html += '<table border="1" cellspacing="0" cellpadding="10">';
                 html += '<tr>';
                    html += '<td>';
                         html += 'Dien thoai';
                         html += '</td>';
                         html += '<td>';
                         html += 'DiaChi';
                    html += '</td>';
                 html += '<tr>';
                var phone = new RegExp('^(0[129]).*');
                var text='';
                
                 // Kết quả là một object json
                 // Nên ta sẽ loop result
                 $.each (result['dsCompany'], function (key, item){
                	 if( item['Add'] != '' && phone.test(item['P'])) {
	                		 html +=  '<tr>';
	                         html +=  '<td>';
	                             html +=  item['P'];
	                         html +=  '</td>';
	                         html +=  '<td>';
	                             html +=  item['Add'];
	                         html +=  '</td>';
	                     	html +=  '<tr>';
	                     	text += item['P'] + "&nbsp;" + item['Add'] + "<br/>";
                	 }
                 });
                  
                 html +=  '</table>';
                  
                 $('#result2').html(html);
                 $('#result2').select();
                 document.execCommand("copy");
             }
         });
	});
</script>
</html>