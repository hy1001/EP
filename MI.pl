use HTML::TreeBuilder 5 -weak; # Ensure weak references in use
use Data::Dumper;

foreach my $file_name (@ARGV) {
    my $tree = HTML::TreeBuilder->new; # empty tree
    $tree->parse_file($file_name);

    # $tree->dump; # a method we inherit from HTML::Element

    my @bolds = $tree->find_by_tag_name('b');

    foreach my $node ( @bolds ) {
    	my @kids = $node->content_list();
    	print @kids, "\n";
    	# print $kids[0]->as_text(), "\n";
    }

    print "**", $bolds[0]->content_list(), "\n";

    my @spans = $tree->look_down( _tag => 'span', lang => 'en-US');
    # print scalar( @spans ), "\n";
    
    foreach my $node ( @spans ) {
    	print $node, "\n";
    	my @kids = $node->content_list();
    	print @kids, "\n";
    }

    # print "** ", $spans[2]->content_list(), "\n"; ## Q2_Date
    # print "** ", $spans[3]->content_list(), "\n"; ## Q2_Time
    # print "** ", $spans[9]->content_list(), "\n"; ## Comments

    
    my @MICheckBoxes = ("Q1_No", "Q1_Yes", "Q2_No", "Q2_Yes", 
			   "Q4_1", "Q4_2", "Q4_3", "Q4_6", "Q4_5", "Q4_6", 
			   "Q4_7", 
			   "Q5_ST", "Q5_NonST", "Q5_Unk",
			   "Q6_PCI_No", "Q6_PCI_Yes",
			   "Q6_CABG_No", "Q6_CABG_Yes",
			   "Q7_No", "Q7_Yes", "Q7_Unk",
			   "Q8_1_No", "Q8_1_Yes",
			   "Q8_2_No", "Q8_2_Yes",
			   "Q8_3_No", "Q8_3_Yes",
			   "Q8_4_No", "Q8_4_Yes",
			   "Q8_5_No", "Q8_5_Yes",
			   "Q8_6_No", "Q8_6_Yes",
			   "Q8_7_No", "Q8_7_Yes", "Q8_7_Neg", "Q8_7_Pos" );


    my @checkboxes = $tree->look_down( _tag => 'input', type => 'checkbox' );
    # print scalar( @checkboxes ), "\n";

    my $i = 0;
    foreach my $node ( @checkboxes ) {
    	# print $node, "\n";
    	# print $node->parent()->content_list(), "\n";
    	print $MICheckBoxes[ $i++ ], "\n";
	## print  $i++ , "\n";

    	if ( exists $node->{'checked'} ) {
    	    print "checked\t";
    	} else {
    	    print "\t";
    	}

    	# foreach my $key ( sort keys %{ $node } ) {
    	#     print $key, " : ",  $node->{$key}, "\n";
    	# }
    	print "\n";
    }


    # my @checked = $tree->look_down( 'checked', 'checked' );
    my @checked = $tree->look_down( _tag => 'input', checked => 'checked' );

    print scalar( @checked ), "\n";


}
