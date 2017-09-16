#!/usr/bin/perl

my  $refStructure = [ 
    { a => 1, b => 2, c => 3 }, 
    { d => 4, e => 5 },
    [ 6, 7, 8 ], 9, 10, 11, [ 12, 13, 14 ] 
];

sub addtwo {
    my $s = shift;

    if (ref($s) eq "ARRAY") {
        for my $e (@$s) {
            ref $e ? addtwo( $e ) : $e++;
        } 
    }
    elsif (ref($s) eq "HASH") {
        for my $key (keys %$s) {
            $s->{$key}++;
        }
    }
}

sub printResult {    
  for my $e (@$refStructure) {       
      if (ref($e) eq "ARRAY") {
          print "( @$e )\n";
       } 
       elsif (ref($e) eq "HASH") {
	      #print %$e;         
          print "( ";
          my @keys = keys %$e;
          for my $key (@keys) {
               my $item = $e->{$key};
               print "$key -> $item, ";
          }
          print " )\n";
       }
       else {
          print "$e\n";
       }
  }
}

addtwo( $refStructure );
printResult();
