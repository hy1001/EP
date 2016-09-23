use strict;
use warnings;
use File::Basename;
use File::Copy qw(copy);

my $i = 0;
##my $base_path = "./Previous Cases";
my $base_path = "/media/cantosce/Aruna Pradhan/Assigned Cases/Previous Cases";
## my $base_path = "/media/cantosce/Ben Olenchock/CANTOS/Assigned Cases/Previous Cases";

process_files ($base_path);

# Accepts one argument: the full path to a directory.
# Returns: nothing.
sub process_files {
    my $path = shift;

    # Open the directory.
    opendir (DIR, $path)
	or die "Unable to open $path: $!";

    # Read in the files.
    # You will not generally want to process the '.' and '..' files,
    # so we will use grep() to take them out.
    # See any basic Unix filesystem tutorial for an explanation of them

    my @files = grep { !/^\.{1,2}$/ } readdir (DIR);
    
    # Close the directory.
    closedir (DIR);

    # At this point you will have a list of filenames
    #  without full paths ('filename' rather than
    #  '/home/count0/filename', for example)
    # You will probably have a much easier time if you make
    #  sure all of these files include the full path,
    #  so here we will use map() to tack it on.
    #  (note that this could also be chained with the grep
    #   mentioned above, during the readdir() ).
    @files = map { $path . '/' . $_ } @files;

    for (@files) {

	my $wholePath = $_;
	print $wholePath, "\n";
	my $filename = basename( $_ );
	# print $filename, "\n";
	
	# If the file is a directory
	if (-d $_) {
	    # Here is where we recurse.
	    # This makes a new call to process_files()
	    # using a new directory we just found.
	    process_files ($_);

	    # If it isn't a directory, lets just do some
	    # processing on it.
	} elsif  ( $filename =~ /^\w+.*\Q.doc\E$/ )  {
	## } elsif  ( $_ =~ /^\w{1,}*\.docx$/ )  {
	    print "\n", $i++, "\n";
	    print $filename, "\n";
	    # Do whatever you want here =)
	    # A common example might be to rename the file.
	    # print $_, "\n";

	    ### copy the doc file to /tmp/tmp.doc file

	    copy $_, "/tmp/tmp.doc";

	    ### convert tmp.doc file to tmp.html file via headless soffice
	    system( "soffice --headless --convert-to html --outdir /tmp /tmp/tmp.doc" );
	    if ( $? == -1 )
	    {
	    	print "command failed: $!\n";
	    }
	    else
	    {
	    	printf "command exited with value %d", $? >> 8;
	    }

	    ### cleaning the characters \a\b\r
	    system( " tr -d '\a\b\r' < /tmp/tmp.html > /tmp/tmp2.html " ) ;

	    ### now work with /tmp/tmp2.html file via perl
	    system( " perl /home/hpaik/projects/CANTOS/EndPointCommittee/hptest4.pl /tmp/tmp2.html " );
	    if ( $? == -1 )
	    {
	    	print "command failed: $!\n";
	    }
	    else
	    {
	    	printf "command exited with value %d", $? >> 8;
	    }

	    ### cleaning up
	    unlink "/tmp/tmp.doc";
	    unlink "/tmp/tmp.html";
	    ### save the html file with the original filename
	    rename "/tmp/tmp2.html", "/tmp/".$filename.".html";
	} else {

	}
    }
}
