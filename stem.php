<body align="center">
 <h1 >Syllabification</h1>
  <form method="post" >
 Text:<input type="text" name="my" />
  </form>
 </body>
 <?php
 echo "hi";
 if(isset($_POST['my']))
{
 $res= $_POST['my'];
 echo "$res";
}
?> 