use strict;
use warnings;

my $infile = $ARGV[0];

my $reAdjID = qr/<b>Adjudicator Initials: <\/b><span lang=\"en-US\"><b>(\S+)<\/b><\/span><b>/;
my $AdjID;
my $reUEID = qr/Unique Event ID #: (S+) /;
my $UEID;

# my $re = qr/<as+href=["']([^"']+)["']/i;
# my $html = do { local $/; <DATA> }; # slurp _DATA_ section

# my @links = ($html =~ m{ $re }gx);



open(DATA, "<$infile") or die "Couldn't open file $infile, $!";

while(<DATA>){
    # print "$_";

#     if ( $_ =~ m { $AdjID }gx ) {
# ##    	print $1, "\n";
# ##    	$AdjID = $1;
#     }

    if ( $_ =~ /<b>Adjudicator Initials: <\/b><span lang=\"en-US\"><b>(\S+)<\/b><\/span><b>/ ) {
	print $1, "\n";
    }
    if ( $_ =~ /Unique Event ID #: (\S+) / ) {
	print $1, "\n";
    }
    if ( $_ =~ / Subject ID #: (\S+) / ) {
	print $1, "\n";
    }
    
    # if ( $_ =~ m { $reUEID }gx ) {
    # 	print $1, "\n";
    # 	$UEID = $1;
    # }
}

close( DATA );
