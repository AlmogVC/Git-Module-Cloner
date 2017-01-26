my $filename = '.gitmodules';
my $file;
my $nLineIndex;
my $gitUrl;
my $gitName;
my @arrFileLine;

open($file, '<', $filename)
  or die "Could not open file '$filename'";

@arrFileLine = <$file>;
close($file);

print(scalar(@arrFileLine) / 3);

for ($nLineIndex = 0; $nLineIndex  + 3 < scalar(@arrFileLine); $nLineIndex += 3)
{
	if($arrFileLine[$nLineIndex + 1] =~ m/path = (.*)\/repo\n/)
	{
		$gitName = $1;
	}

	if($arrFileLine[$nLineIndex + 2] =~ m/url = (.*)\n/)
	{
		$gitUrl = $1;
	}
	
	
	system("git clone $gitUrl $gitName");
}
  