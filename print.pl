$f=$ARGV[0];
open($in,"$f");
%count;
while (<$in> )
{
  chomp $_;
  foreach $str (split /\s+/, $_)
  {
    $count{$str}++;
  }
}
open $fh, ">sam.txt";
  foreach $str (sort keys %count) {
      printf $fh "$str\n" ;
}


