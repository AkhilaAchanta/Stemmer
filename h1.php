<html>
<head>
 <style>
 a:link {
    height:100px;
 line-height:40px;
 background:#66CCFF;
 width:450px;
 font-size:3em;
 font-weight:bold;
 color:#fff;
 text-align:center;
 text-decoration:none;
 
 /*border radius*/
 border-radius:5px;
 -webkit-border-radius:5px;
 border:1px solid color:#000;
 
 /*gradients*/
 background:-webkit-gradient(linear,left top,left bottom,from(#ff80ff),to(#ff80ff)); 
    
    
}

/* visited link */
a:visited {
    color: white;
}

/* mouse over link */
a:hover {
 background:#ff4dff;
		  background:-webkit-gradient(linear,left top,left bottom,from(#cc00cc),to(#ff33ff));   
}

/* selected link */
a:active {
    background:#ff4dff;
  background:-webkit-gradient(linear,left top,left bottom,from(#cc00cc),to(#ff33ff)); 
  color:#000;
  cursor:default; 
}
 </style>
</head>
 <body align="center" style="background-image:url(sky11.jpg); background-repeat:no-repeat; background-size:cover;" text="#ffffff">
 <center>
  <font size="10"><b><i><h1>Nativo Votos</h1></i></b></font>
 <a href="homepage1.html" style="text-decoration:none;">Home</a>&nbsp &nbsp&nbsp &nbsp
  <a href="my.php" style="text-decoration:none;">Syllabification</a>&nbsp &nbsp&nbsp &nbsp
  <a href="h1.php" style="text-decoration:none;">Stemmer</a>&nbsp&nbsp &nbsp&nbsp 
    <a href="fileupload.php" style="text-decoration:none;">Upload File</a>&nbsp
 <font color="white" size="6"> <h2><b><i>Stemmer</b></i></h2></font>
  <font color="white" size="6">Enter KNS notated text with hyphens between letters</font>
  <form method="post">
  <font color="white" size="6">WORD:</font> <input type="text" name="h" style="font-size: 44pt" placeholder="Enter KNS Text"/></br></br></br>
  <input type="submit" name="sub" value="SUBMIT" style="width: 90px; height: 50px;"/>
</br></br></br>
  </form>

 </body>
</html>
<?php
 if(isset($_POST['h']))
 {
 $res=$_POST['h'];
 $result=shell_exec("C:\Perl\bin\perl.exe syllab1.pl $res");
 $result1=shell_exec("C:\Perl\bin\perl.exe rules.pl $result");
  list($a,$b,$c)=explode(',',$result1);
 echo "<font color='white' size='10'>&nbsp &nbsp Output:</font><input type ='text' value='$a' style='font-size: 44pt ;width:'500px';'/><br><br>";
 echo "<font color='white' size='10'>RootWord:</font><input type ='text' value='$b' style='font-size: 44pt ;width:'500px';'/><br><br>";
 echo "<font color='white' size='10'>Inflection:</font><input type ='text' value='$c' style='font-size: 44pt ;width:'500px';'/><br><br>";
 }
  ?> 
	