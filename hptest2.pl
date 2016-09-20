# Uses
use strict;
use Win32::OLE;
use Win32::OLE::Variant;
use Win32::OLE::Const;
use File::Find;

# We want to handle collections
Win32::OLE->Option(_NewEnum => 1);

# Variables
use vars qw($MSWord $wd $startdir);
