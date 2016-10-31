$str=$ARGV[0];
@splitw=split(/-/,$str);

$plural="";
$f=1;
     
 for($i=0;$i<scalar(@splitw);$i++)
 {
   if($splitw[$i] eq "La")
   {
       if((substr $plural,-1,1) eq "L")
       {
         $plural=$plural."Lu";
        
          
         for($k=$i+1;$k<scalar(@splitw);$k++)
         {
           $inflex=$inflex.$splitw[$k];
    
         }
        last;
       }
   }
       elsif((substr $splitw[$i],-2) eq "la"  && $i>0)
       {
          $su=substr $splitw[$i],0,(length($splitw[$i])-1);
          $plural=$plural.$su."u";
         for($k=$i+1;$k<scalar(@splitw);$k++)
         {
           $inflex=$inflex.$splitw[$k];
         }
        last;
       }
   
   elsif((substr $splitw[$i],-2) eq "ra" && $i>0)
   {
     $su=substr $splitw[$i],0,(length($splitw[$i])-1);
     $plural=$plural.$su."u";
         for($k=$i+1;$k<scalar(@splitw);$k++)
         {
           $inflex=$inflex.$splitw[$k];
         }
        last;

   }
   else
   {
      $plural=$plural.$splitw[$i];  
   }
}
@plurals=split("",$plural);
for($i=scalar(@plurals)-1;$i>=0;$i--)
{
   $suf=$plurals[$i].$suf;
   chomp($suf);
   if($suf eq "lu")
   {
     if($plurals[$i-1] eq "A")
    {
      $suf="amu";
      $i--;
      for($k=$i-1;$k>=0;$k--)
      {
        $root=$plurals[$k].$root;
      }
       $root=$root.$suf;
        open($infile1,"<rootdic.txt");
           while(<$infile1>)
       {
            chomp $_;
          if($root eq $_)
               {
                 print "PLural,";
                 print "$root,";
                 print "$inflex";
                 $f=0;
                 last;
               }


      }

     }
    elsif( $plurals[$i-1] eq "n")
    {
      $suf="nu"; 
      $i=-1;
      for($k=$i-1;$k>=0;$k--)
      {
        $root=$plurals[$k].$root;
      }    
     $root=$root.$suf;
   
   }
    elsif(($plurals[$i-1] eq "u") &&( $plurals[$i-2] eq "t" || $plurals[$i-2] eq  "y"))
   {
      $suf="yi";
      $suf1="yyi";
      $i=$i-2;
      for($k=$i-1;$k>=0;$k--)
      {
        $root=$plurals[$k].$root;
        $root1=$plurals[$k].$root1;
      }
       $root=$root.$suf;
       $root1=$root1.$suf1;
        open($infile1,"< rootdic.txt");
           while(<$infile1>)
       {
            chomp $_;
          if($root eq $_)
               {
                 print "PLural,";
                 print "$root,";
                 print "$inflex";
                 $f=0;
                 last;
               }
        elsif($root1 eq $_)
        {
          print "PLural,";
                 print "$root1,";
                 print "$inflex";
                 $f=0;
                 last;


      }


      }

  }
 
    elsif($plurals[$i-1] eq "u")
    {
      $suf="i";
      $suf1="u";
     $i--;
      for($k=$i-1;$k>=0;$k--)
      {
        $root=$plurals[$k].$root;
        $root1=$plurals[$k].$root1;
      }
       $root=$root.$suf;
       $root1=$root1.$suf1;
        open($infile1,"< rootdic.txt");
           while(<$infile1>)
       {
            chomp $_;
          if($root eq $_)
               {
                 print "PLural,";
                 print "$root,";
                 print "$inflex";
                 $f=0;
                 last;
               }
          elsif($root1 eq $_)
             {
                 print "PLural,";
                 print "$root1,";
                 print "$inflex";
                 $f=0;
                 last;
             }

      }

   }
   elsif($plurals[$i-1] eq "T")
  {
     $suf="Tu";
     $suf1="TTi";
     $suf2="TTu";
      $i--;
      for($k=$i-1;$k>=0;$k--)
      {
        $root=$plurals[$k].$root;
        $root1=$plurals[$k].$root1;
       $root2=$plurals[$k].$root2;
       }
       $root=$root.$suf;
          $root1=$root1.$suf1;
          $root2=$root2.$suf2;
       open($infile1,"< rootdic.txt");
           while(<$infile1>)
       {
            chomp $_;
          if($root eq $_)
               {
                 print "PLural,";
                 print "$root,";
                 print "$inflex";
                 $f=0;
                 last;
               }
          elsif($root1 eq $_)
          {
 
             print "PLural,";
                 print "$root1,";
                 print "$inflex";
                 $f=0;
                 last;
           }
         elsif($root2 eq $_)
         {
            print "PLural,";
                 print "$root2,";
                 print "$inflex";
                 $f=0;
                 last;
         }
      }


  }
  elsif($plurals[$i-1] eq "D" && $plurals[$i-2] eq "m")
  {
   $suf="mDi";
     
      $i=$i-2;
      for($k=$i-1;$k>=0;$k--)
      {
        $root=$plurals[$k].$root;
      }
       $root=$root.$suf;
      open($infile1,"<rootdic.txt");
           while(<$infile1>)
       {
            chomp $_;
          if($root eq $_)
               {
                 print "PLural,";
                 print "$root,";
                 print "$inflex";
                 $f=0;
                 last;
               }


      }

  }
 elsif($plurals[$i-1] eq "r")
{
  $suf="ru";
    
      $i=$i-1;
      for($k=$i-1;$k>=0;$k--)
      {
        $root=$plurals[$k].$root;
      }
       $root=$root.$suf;
        open($infile1,"<rootdic.txt");
           while(<$infile1>)
       {
            chomp $_;
          if($root eq $_)
               {
                 print "PLural,";
                 print "$root,";
                 print "$inflex";
                 $f=0;
                 last;
               }


      }


  }
elsif($plurals[$i-1] eq "u" &&  $plurals[$i-2] eq "l")
{
$suf="li";
     
      $i=$i-2;
      for($k=$i-1;$k>=0;$k--)
      {
        $root=$plurals[$k].$root;
      }
       $root=$root.$suf;
        open($infile1,"<rootdic.txt");
           while(<$infile1>)
       {
            chomp $_;
          if($root eq $_)
               {
                 print "PLural,";
                 print "$root,";
                 print "$inflex";
                 $f=0;
                 last;
               }


      }

  }
elsif($plurals[$i-1] eq "D")
{
  $suf="DDu";
  $suf1="DDi";
      $i=$i-1;
      for($k=$i-1;$k>=0;$k--)
      {
        $root=$plurals[$k].$root;
        $root1=$plurals[$k].$root1;
      }
       $root=$root.$suf;
       $root1=$root1.$suf1;
       open($infile1,"<rootdic.txt");
           while(<$infile1>)
       {
            chomp $_;
          if($root eq $_)
               {
                 print "PLural,";
                 print "$root,";
                 print "$inflex";
                 $f=0;
                 last;
               }
            elsif($root1 eq $_)
        {
          print "PLural,";
                 print "$root1,";
                 print "$inflex";
                 $f=0;
                 last;
        }
      }
  }
else
{
  $suf="";
  $suf1="i";
      for($k=$i-1;$k>=0;$k--)
      {
        $root=$plurals[$k].$root;
        $root1=$plurals[$k].$root1;
      }
       $root=$root.$suf;
       $root1=$root1.$suf1;
       open($infile1,"<rootdic.txt");
           while(<$infile1>)
       {
            chomp $_;
          if($root eq $_)
               {
                 print "PLural,";
                 print "$root,";
                 print "$inflex";
                 $f=0;
                 last;
               }
           elsif($root1 eq $_)
        {
          print "PLural,";
                 print "$root1,";
                 print "$inflex";
                 $f=0;
                 last;


      }



      }
         


 
  }

 
  
  last;
}
elsif($suf eq "Lu")
{
  if($plurals[$i-1] eq "L" && $plurals[$i-2] eq "A")
  {
     $suf="Alu";
     $suf1="ADu";
  
      $i=$i-2;
      for($k=$i-1;$k>=0;$k--)
      {
        $root=$plurals[$k].$root;
        $root1=$plurals[$k].$root1;
      }
       $root=$root.$suf;
        $root1=$root1.$suf1;
        open($infile1,"<rootdic.txt");
           while(<$infile1>)
       {
            chomp $_;
          if($root eq $_)
               {
                 print "PLural,";
                 print "$root,";
                 print "$inflex";
                 $f=0;
                 last;
              }
         elsif($root1 eq $_)
        {
          print "PLural,";
                 print "$root1,";
                 print "$inflex";
                 $f=0;
                 last;


      }

   }
  }
  elsif($plurals[$i-1] eq "L")
  {
     $suf="Di";
     $suf1="Du";
     $suf2="ru";
     $suf3="lu";
     $suf4="mDi";
     $suf5="li";
     $suf6="nnu";
      $i=$i-1;
      for($k=$i-1;$k>=0;$k--)
      {
        $root=$plurals[$k].$root;
        $root1=$plurals[$k].$root1;
        $root2=$plurals[$k].$root2;
        $root3=$plurals[$k].$root3;
        $root4=$plurals[$k].$root4;
        $root5=$plurals[$k].$root5;
        $root6=$plurals[$k].$root6;
      }
       $root=$root.$suf;
       $root1=$root1.$suf1;
        $root2=$root2.$suf2;
       $root3=$root3.$suf3;
        $root4=$root4.$suf4;
       $root5=$root5.$suf5;
       $root6=$root6.$suf6; 
       open($infile1,"<rootdic.txt");
           while(<$infile1>)
       {
            chomp $_;
          if($root eq $_)
               {
                 print "PLural,";
                 print "$root,";
                 print "$inflex";
                 $f=0;
                 last;
               }
          elsif($root1 eq $_)
        {
          print "PLural,";
                 print "$root1,";
                 print "$inflex";
                 $f=0;
                 last;


      }
       elsif($root2 eq $_)
        {
          print "PLural,";
                 print "$root2,";
                 print "$inflex";
                 $f=0;
                 last;


      }
       elsif($root3 eq $_)
        {
          print "PLural,";
                 print "$root3,";
                 print "$inflex";
                 $f=0;
                 last;


      }
       elsif($root4 eq $_)
        {
          print "PLural,";
                 print "$root4,";
                 print "$inflex";
                 $f=0;
                 last;


      }
      elsif($root5 eq $_)
        {
          print "PLural,";
                 print "$root5,";
                 print "$inflex";
                 $f=0;
                 last;
      }
      elsif($root6 eq $_)
        {
          print "PLural,";
                 print "$root6,";
                 print "$inflex";
                 $f=0;
                 last;


      }



   }
  }

}
elsif($suf eq "ru")
{
    if($plurals[$i-1] eq "D" && $plurals[$i-2] eq "m" && $plurals[$i-3] eq "A")
     {
      $suf="Alu";
       $suf1="ADu";
  
      $i=$i-3;
      for($k=$i-1;$k>=0;$k--)
      {
        $root=$plurals[$k].$root;
        $root1=$plurals[$k].$root1;
      }
       $root=$root.$suf;
       $root1=$root1.$suf1;
        open($infile1,"<rootdic.txt");
           while(<$infile1>)
       {
            chomp $_;
          if($root eq $_)
               {
                 print "PLural,";
                 print "$root,";
                 print "$inflex";
                 $f=0;
                 last;
               }


      }

   }
  else
  {
   $suf="Du";
    $suf1="i";
    for($k=$i-1;$k>=0;$k--)
      {
        $root=$plurals[$k].$root;
        $root1=$plurals[$k].$root1;
      }
       $root=$root.$suf;
       $root1=$root1.$suf1;
         open($infile1,"<rootdic.txt");
           while(<$infile1>)
       {
            chomp $_;
          if($root eq $_)
               {
                 print "PLural,";
                 print "$root,";
                 print "$inflex";
                 $f=0;
                 last;
               }
           elsif($root1 eq $_)
            {
             print "PLural,";
                 print "$root1,";
                 print "$inflex";
                 $f=0;
                 last;


           }

       }
    }
}
       
}
if($f!=0)
{
   $root="";
   $inflex="";
  for($k=0;$k<scalar(@splitw);$k++)
      {
        
        $root=$root.$splitw[$k];
     
      open $infile1,"<rootdic.txt";
           while(<$infile1>)
       {
            chomp $_; 
          if($root eq $_)
               {
                 print "Singular,";
                 print "$root,";
                 $f=0;
                 for($l=$k+1;$l<scalar(@splitw);$l++)
                  {
                    $inflex=$inflex.$splitw[$l];
                   }
               print "$inflex";
               last;
              }
      }
    
  }

}
if($f!=0)
{
  print "Wrong Word,-,-";
}
