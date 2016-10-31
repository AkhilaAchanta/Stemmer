
%exclude;
open ($fh, "<stopwords.txt");
while (<$fh>) {
    chomp;
    $exclude{$_}++;
 }
open ($fh,"<sam.txt");
open ($out,">unique.txt");
while(<$fh>) {
 chomp;
 print $out "$_\n" unless $exclude{$_};
}
