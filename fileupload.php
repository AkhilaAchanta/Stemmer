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
a:visited
{
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
.boldtable
 { 
  font-size:28pt;

 }
input[type=file] {
    -webkit-appearance: none;
    -moz-appearance: none;
    appearance: none;
    background: #EEE;
    background: linear-gradient(to top, #FFF, #DDD);
    border: thin solid rgba(0,0,0, .5);
    border-radius: .25em;
    box-shadow: inset .25em .25em .25em rgba(255,255,255, .5), inset -.1em -.1em .1em rgba(0,0,0, 0.1);
    cursor: text;
    padding: .25em;
}
.container{
           background-color:#f3f3c6;
		   width:1000px;
		   margin:20px auto;
		   border-right:1px solid #000;
		   border-left:1px solid #000;
		   padding:0;
	      }
 </style> 
<body align="center" style="background-image:url(sky11.jpg); background-repeat:no-repeat; background-size:cover;" text="#ffffff" >       
          <center>
          <font size="10"><b><i><h1>Nativo Votos</h1></i></b></font>
          <a href="homepage1.html" style="text-decoration:none;">Home</a>&nbsp &nbsp&nbsp &nbsp
  <a href="my.php" style="text-decoration:none;">Syllabification</a>&nbsp &nbsp&nbsp &nbsp
  <a href="h1.php" style="text-decoration:none;">Stemmer</a>&nbsp &nbsp&nbsp &nbsp
  <a href="fileupload.php" style="text-decoration:none;">Upload File</a>&nbsp </br></br></br></br>
       <font color="white" size="6">Upload a KNS Notated Text File in which each letter is separated by </font>
      <form action = "" method = "POST" enctype = "multipart/form-data">
          <input type = "file" name = "image" />
         <input type = "submit" style="width: 100px; height: 50px;"/>
    </form>
     <center>
  </body>
</html>
<?php
   if(isset($_FILES['image'])){
      $errors= array();
      $file_name = $_FILES['image']['name'];
      $file_size = $_FILES['image']['size'];
      $file_tmp = $_FILES['image']['tmp_name'];
      $file_type = $_FILES['image']['type'];
      if(empty($errors)==true) {
         move_uploaded_file($file_tmp,"C:/xampp/htdocs/Stemmer/".$file_name);
      }else{
         print_r($errors);
      }
    
       $result = shell_exec("C:\Perl\bin\perl.exe print.pl $file_name");
       $result1= shell_exec("C:\Perl\bin\perl.exe stopword.pl");
       $file1 = fopen("unique.txt","r");
       echo "<center><font size='6'><B>OUTPUT:</B></font><table border ='6'class='boldtable'><th>Word</th><th>Syllabified Word</th><th>Singular/Plural</th><th>RootWord</th><th>Inflection</th>";
        while(! feof($file1))
        {
          $word=fgets($file1);
          $result2=shell_exec("C:\Perl\bin\perl.exe syllab.pl $word");
           echo "<tr><td><font size='6'>$word</font></td><td><font size='6'>$result2</font></td> ";
          $result3=shell_exec("C:\Perl\bin\perl.exe rules.pl $result2");        
           list($a,$b,$c)=explode(',',$result3);
            echo "<td><font color='white' size='6'>$a</font></td>";
            echo "<td><font color='white' size='6'>&nbsp$b</font></td>";
            echo "<td><font color='white' size='6'>&nbsp$c</font></td></tr><br>";
        }
       echo "</table></center>"; 
   }