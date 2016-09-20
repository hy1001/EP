# object-based interface
use Text::Extract::Word;
my $file = Text::Extract::Word->new("test1.doc");
my $text = $file->get_text();
my $body = $file->get_body();
my $footnotes = $file->get_footnotes();
my $headers = $file->get_headers();
my $annotations = $file->get_annotations();
my $bookmarks = $file->get_bookmarks();

# # specify :raw if you don't want the text cleaned
# my $raw = $file->get_text(':raw');

# print $raw, "\n";

# # legacy interface
# use Text::Extract::Word qw(get_all_text);
# my $text = get_all_text("test1.doc");

print $text, "\n";

print "*************************\n";

print $body, "\n";
