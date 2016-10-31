%syllables=("a","V","A","V","i","V","I","V","u","V","U","V","e","V","E","V","ai","V","o","V","O","V","au","V","k","C","kh","C","g","C","gh","C","c","C","ch","C","j","C","jh","C","t","C","th","C","T","C","Th","C","D","C","Dh","C","N","C","d","C","dh","C","n","C","p","C","ph","C","b","C","bh","C","m","C","y","C","r","C","l","C","w","C","s`","C","S","C","s","C","h","C","L","C","R`","C");
$word=$ARGV[0];
chomp $word;
@splitword=split(/-/,$word);
for($i=0;$i<scalar(@splitword);$i++)
{
  $strno=$strno.$syllables{$splitword[$i]}."-";
  $str=$str.$splitword[$i]."-";
}
chop($strno);
chop($str);
@splits=split(/-/,$strno);
@splitw=split(/-/,$str);
$k=0;
for($j=0;$j<scalar(@splits);$j++)
{
  if($splits[$j] eq  "V" &&  $splits[$j+1] eq  "C" &&  $splits[$j+2] eq  "V")
   {
       $syllabify=$syllabify.$splits[$j]."-";
       $syllabnot=$syllabnot.$splitw[$j]."-";
       $k=0;
            for($k=$j+1;$splits[$k] ne "V";$k+=1)
             {
               $syllabify=$syllabify.$splits[$k];
               $syllabnot=$syllabnot.$splitw[$k];
             }
            $syllabify=$syllabify.$splits[$k]."-";
            $syllabnot=$syllabnot.$splitw[$k]."-";
            $j=$k;
      }


    elsif($splits[$j] eq "V" && $splits[$j+1] eq "C" &&  $splits[$j+2] eq "C")
      {
      
        $syllabify=$syllabify.$splits[$j].$splits[$j+1]."-";
         $syllabnot=$syllabnot.$splitw[$j].$splitw[$j+1]."-";
        $k=0;
        for($k=$j+2;$splits[$k] ne "V";$k+=1)
             {
               $syllabify=$syllabify.$splits[$k];
               $syllabnot=$syllabnot.$splitw[$k];
             }
            $syllabify=$syllabify.$splits[$k]."-";
             $syllabnot=$syllabnot.$splitw[$k]."-";

            $j=$k;
       }
  elsif( ($j-1)!=-1 && $splits[$j-1] eq "V" && $splits[$j]  eq "C" && $splits[$j+1] eq "C")
   {
        chop($syllabify);
        chop($syllabnot);
        $syllabify=$syllabify.$splits[$j]."-";
         $syllabnot=$syllabnot.$splitw[$j]."-";
        $k=0;
        for($k=$j+1;$splits[$k] ne "V";$k+=1)
             {
               $syllabify=$syllabify.$splits[$k];
                $syllabnot=$syllabnot.$splitw[$k];
             }
            $syllabify=$syllabify.$splits[$k]."-";
             $syllabnot=$syllabnot.$splitw[$k]."-";
             
            $j=$k;
      }
  elsif($splits[$j-1] eq "V" && $splits[$j] eq "C" && $splits[$j+1] eq "V")
  {
      $syllabify=$syllabify.$splits[$j].$splits[$j+1]."-";
      $syllabnot=$syllabnot.$splitw[$j].$splitw[$j+1]."-";
      $j++;

   }
elsif($splits[$j] eq "C" && $splits[$j+1] eq "C")
{
  
    for($k=$j;$splits[$k] ne "V";$k++)
    {
    $syllabify=$syllabify.$splits[$k];
     $syllabnot=$syllabnot.$splitw[$k];
    }
   
    $syllabify=$syllabify.$splits[$k]."-";
    $syllabnot=$syllabnot.$splitw[$k]."-";
    $j=$k;
    

}
  
  elsif($splits[$j] eq "C" && $splits[$j+1] eq "V")
 {
    $syllabify=$syllabify.$splits[$j].$splits[$j+1]."-";
     $syllabnot=$syllabnot.$splitw[$j].$splitw[$j+1]."-";
    $j++;
 }
 elsif($splits[$j] eq "V" && $splits[$j+1] eq "V")
{
   print "Wrong word";
   $syllabnot="";
    
   $j++;
  last;
   
}
elsif($splits[$j-1] eq "V" && $splits[$j] eq "V")
{
   print "Wrong word";
   $syllabnot="";
   last;  
}
elsif($j==(scalar(@splits)-1) && $splits[$j] eq "C")
{
   chop($syllabify);
   chop($syllabnot);
   
   $syllabify=$syllabify.$splits[$j]."-";
    $syllabnot=$syllabnot.$splitw[$j]."-";
   

}
  
 else
 {
   
   $syllabify=$syllabify.$splits[$j]."-";
    $syllabnot=$syllabnot.$splitw[$j]."-";


 }

} 
chop($syllabnot);
print "$syllabnot";
