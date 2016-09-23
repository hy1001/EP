use HTML::TreeBuilder 5 -weak; # Ensure weak references in use
use Data::Dumper;

sub death {
    my $tree = shift;
    my $fileName = shift;
    print "\n=========================== Death ========================\n";
    my @spans = $tree->look_down( _tag => 'span', lang => 'en-US');

    # print "\n *** # spans : ", scalar( @spans ), " *** \n";
    if( scalar( @span ) != 14 ) {
	print "##############\n";
	print "\n *** # spans : ", scalar( @spans ), " *** \n";
    } 
    # else {
    # }

    my @DeathCheckBoxes31 = ("Q1_No", "Q1_Yes", 
			   "Q3_Cardio", "Q3_NonCV", "Q3_Unk",
			   "Q4_1", "Q4_3", "Q4_5", "Q4_6", "Q4_8", "Q4_9", 
			   "Q4_13", "Q4_13a", "Q4_13b", "Q4_13c",
			   "Q4_14", "Q4_15", "Q4_16", "Q4_17",
			   "Q5_2", "Q5_4", "Q5_5", "Q5_6", "Q5_7", "Q5_8",
			   "Q5_9", "Q5_10", "Q5_11", "Q5_12",
			     "Q6_No", "Q6_Yes" );

    my @DeathCheckBoxes28 = ("Q1_No", "Q1_Yes", 
			     "Q3_Cardio", "Q3_NonCV", "Q3_Unk",
			     "Q4_1", "Q4_3", "Q4_5", "Q4_6", "Q4_8", "Q4_9", 
			     "Q4_13", # "Q4_13a", "Q4_13b", "Q4_13c",
			     "Q4_14", "Q4_15", "Q4_16", "Q4_17",
			     "Q5_2", "Q5_4", "Q5_5", "Q5_6", "Q5_7", "Q5_8",
			     "Q5_9", "Q5_10", "Q5_11", "Q5_12",
			     "Q6_No", "Q6_Yes" );

    my @checkboxes = $tree->look_down( _tag => 'input', type => 'checkbox' );

    if( scalar( @checkboxes ) == 31 ) {


	my $i = 0;
	foreach my $node ( @checkboxes ) {
	    print $DeathCheckBoxes31[ $i++ ], "\t";
	    if ( exists $node->{'checked'} ) {
		print "checked";
	    } 
	    print "\n";
	}
    } elsif ( scalar( @checkboxes ) == 28 ) {

	print "##############\n";
	print "\n *** # checkboxes : ", scalar( @checkboxes ), " *** \n";

	my $i = 0;
	foreach my $node ( @checkboxes ) {
	    if ( $i == 11 ) {
		# my @tmp = $node->content_list();
		my @tmp = $node->parent()->content_list();
		# print scalar( @tmp ), "\n";
		print $tmp[1] , "\n";
		if ( $tmp[1] ne " 13. Other vascular " ) {
		    print "!!!!!!!!!!!!!!!!!!!!!!11WRONG!!!!!!!!!!!!!!!!!!!!!!!!\n";
		}
	    ## print  Dumper( $node->parent()->content_list() );
	    }

	    print $DeathCheckBoxes28[ $i++ ], "\t";
	    if ( exists $node->{'checked'} ) {
		print "checked";
	    } 
	    

	    print "\n";
	}
    } else {
	
	print "##############\n";
	print "\n *** # checkboxes : ", scalar( @checkboxes ), " *** \n";
	
    }
    



    print "----------------------- end Death ------------------------\n";
    
    return 1;
}

sub mi {

    my $tree  = shift;
    my $fileName = shift;
    
 #   print Dumper( $tree ); 
    print "\nMI\n";
    my @spans = $tree->look_down( _tag => 'span', lang => 'en-US');
    # print "\n *** # spans : ", scalar( @spans ), " *** \n";
    if( scalar( @spans ) != 23 ) {
	print "##############\n";
	print "\n *** # spans : ", scalar( @spans ), " *** \n";
    }
    return 1;
}

foreach my $file_name (@ARGV) {
    my $tree = HTML::TreeBuilder->new; # empty tree
    $tree->parse_file($file_name);

    # $tree->dump; # a method we inherit from HTML::Element

    my @bolds = $tree->find_by_tag_name('b');

    # foreach my $node ( @bolds ) {
    # 	my @kids = $node->content_list();
    # 	print @kids, "\n";
    # 	# print $kids[0]->as_text(), "\n";
    # }

    my @tmp = $bolds[0]->content_list();
    print "\n******* ",$tmp[0], " ************\n";
    
    if ( $tmp[0] =~ m/CANTOS Death Adjudication/ ) {
	&death( $tree , $file_name);
    }

    # elsif ( $tmp[0]  =~ "Myocardial") {
    #  	&mi( $tree, $file_name );
    # }

    # my @spans = $tree->look_down( _tag => 'span', lang => 'en-US');
    # print "\n *** # spans : ", scalar( @spans ), " *** \n";
    
    # # foreach my $node ( @spans ) {
    # # 	print $node, "\n";
    # # 	my @kids = $node->content_list();
    # # 	print @kids, "\n";
    # # }

    # # print "** ", $spans[2]->content_list(), "\n"; ## Q2_Date
    # # print "** ", $spans[3]->content_list(), "\n"; ## Q2_Time
    # # print "** ", $spans[9]->content_list(), "\n"; ## Comments

    
    # my @DeathCheckBoxes = ("Q1_No", "Q1_Yes", 
    # 			   "Q3_Cardio", "Q3_NonCV", "Q3_Unk",
    # 			   "Q4_1", "Q4_3", "Q4_5", "Q4_6", "Q4_8", "Q4_9", 
    # 			   "Q4_13", "Q4_13a", "Q4_13b", "Q4_13c",
    # 			   "Q4_14", "Q4_15", "Q4_16", "Q4_17",
    # 			   "Q5_2", "Q5_4", "Q5_5", "Q5_6", "Q5_7", "Q5_8",
    # 			   "Q5_9", "Q5_10", "Q5_11", "Q5_12",
    # 			   "Q6_No", "Q6_Yes" );


    # my @checkboxes = $tree->look_down( _tag => 'input', type => 'checkbox' );
    # print "*** # checkboxes : ", scalar( @checkboxes ), " ***\n";

    # # my $i = 0;
    # # foreach my $node ( @checkboxes ) {
    # # 	# print $node, "\n";
    # # 	# print $node->parent()->content_list(), "\n";
    # # 	print $DeathCheckBoxes[ $i++ ], "\n";

    # # 	if ( exists $node->{'checked'} ) {
    # # 	    print "checked\t";
    # # 	} else {
    # # 	    print "\t";
    # # 	}

    # # 	# foreach my $key ( sort keys %{ $node } ) {
    # # 	#     print $key, " : ",  $node->{$key}, "\n";
    # # 	# }
    # # 	print "\n";
    # # }


    # # my @checked = $tree->look_down( 'checked', 'checked' );
    # my @checked = $tree->look_down( _tag => 'input', checked => 'checked' );

    # print scalar( @checked ), "\n";
}
