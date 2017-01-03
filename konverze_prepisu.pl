#!/usr/bin/perl
#use warnings;
use locale;

print "Zadejte adresar s textovymi soubory :";
my $dir = <STDIN>; #slozka s trs
chomp $dir;
my @rep=<$dir/*txt>; #seznam obsazenych trs

#pro kazdy soubor z dir                                    
foreach $file (@rep) {

  my $name_input = substr($file,6,-4); #nazev sondy
  my $output = "konvertovano_".substr($file,0,-4).".txt"; #exportni soubor

  #soubory otevreni
  open (I,"$file") or die "Nelze otevrit soubor";
  open (O,">$output") or die "nelze ulozit soubor";
                                     
  while ($row = <I>) {
   chomp $row;
              
   #nahrazeni v radku
   $row =~ s/ďi/di/g;
   $row =~ s/ťi/ti/g;
   $row =~ s/ňi/ni/g;
   $row =~ s/ďe/dě/g;
   $row =~ s/ťe/tě/g;
   $row =~ s/ňe/ně/g;
   $row =~ s/dz/c/g;
   $row =~ s/dž/č/g;
   $row =~ s/ďí/dí/g;
   $row =~ s/ťí/tí/g;
   $row =~ s/ňí/ní/g;
   $row =~ s/tk/dk/g;
   $row =~ s/([^ ])šk([^ ]/$1žk$2/g;
   $row =~ s/vje/vě/g;   
   $row =~ s/aší/ažší/g;
   
   #tisk radku do noveho souboru
   print O $row;
    
  }
  #soubory zavreni
  close (I);
  close (O);
  
}#konec foreach
              
print "Hotovo.";