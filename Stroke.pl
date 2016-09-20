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

    # print "**", $bolds[0]->content_list(), "\n";

    # my @spans = $tree->look_down( _tag => 'span', lang => 'en-US');
    # print scalar( @spans ), "\n";

    my @ps = $tree->look_down( _tag => 'p' );
    my $i = 0;

    # foreach my $node ( @ps ) {
    # 	print $i++, "\n";
    # 	my @kids = $node->content_list();
    # 	print @kids, "\n";
    # 	# print $kids[0]->as_text(), "\n";
    # }

    # print $ps[9]->content_list(), "\n";
    my @tmp = $ps[9]->content_list();
    print $tmp[2], "\n";

    @tmp = $ps[21]->content_list();
    print $tmp[1], "\n";
    
    # foreach my $node ( @spans ) {
    # 	print $node, "\n";
    # 	my @kids = $node->content_list();
    # 	print @kids, "\n";
    # }

    # print "** ", $spans[2]->content_list(), "\n"; ## Q2_Date
    # print "** ", $spans[3]->content_list(), "\n"; ## Q2_Time
    # print "** ", $spans[9]->content_list(), "\n"; ## Comments

    
    my @StrokeCheckBoxes = ("Q1_No", "Q1_Yes", 
			    "Q3_1", "Q3_2", "Q3_3", "Q3_4", "Q3_5", "Q3_6" );


    my @checkboxes = $tree->look_down( _tag => 'input', type => 'checkbox' );

    # print scalar( @checkboxes ), "\n";

    my $i = 0;
    foreach my $node ( @checkboxes ) {
    	# print $node, "\n";
    	# print $node->parent()->content_list(), "\n";
	print $StrokeCheckBoxes[ $i++ ], "\n";

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
