
%count;
open $fh, "<sample.txt";
while (<$fh> )
{
  chomp $_;
  foreach $str (split /\s+/, $_)
  {
    $count{$str}++;
  }
}
  foreach $str (sort keys %count) {
      printf "%-31s \n", $str ;
}

