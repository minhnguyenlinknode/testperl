#!/usr/bin/perl

# Initial array pointer
my  $refStructure = [ 
    { a => 1, b => 2, c => 3 }, 
    { d => 4, e => 5 },
    [ 6, 7, 8 ], 9, 10, 11, [ 12, 13, 14 ] 
];

# Recursive function
sub addtwo {
    my $s = shift;

    #if is array pointer
    if (ref($s) eq "ARRAY") { 
        for my $e (@$s) {
	    #check to repeat for sub array pointer
            ref $e ? addtwo( $e ) : $e++; 
        } 
    }
    #if is hash pointer
    elsif (ref($s) eq "HASH") { 
        for my $key (keys %$s) {
            $s->{$key}++;
        }
    }
}

# This is just for output testing
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
