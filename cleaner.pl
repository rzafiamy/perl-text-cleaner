use strict;
use warnings;
use utf8;
use open qw(:std :utf8);

# Check if all required parameters are provided
if (@ARGV < 3) {
    print "Usage: perl cleanup_script.pl <input_file> <output_file> <config_file>\n";
    print "Please provide all the required parameters.\n";
    exit;
}

# Get the input, output, and config file names from command-line arguments
my $input_file = $ARGV[0];
my $output_file = $ARGV[1];
my $config_file = $ARGV[2];

# Check if the input file exists
unless (-e $input_file) {
    print "Input file '$input_file' does not exist.\n";
    exit;
}

# Check if the config file exists
unless (-e $config_file) {
    print "Config file '$config_file' does not exist.\n";
    exit;
}

# Check if input and output files are the same
if ($input_file eq $output_file) {
    print "Input and output files cannot be the same.\n";
    exit;
}

# Read the configuration file
open(my $config_fh, '<', $config_file) or die "Failed to open $config_file: $!";
my @regex_patterns;
while (my $line = <$config_fh>) {
    chomp $line;
    next if $line =~ /^\s*$/;    # Skip empty lines
    next if $line =~ /^\s*#/;    # Skip comment lines

    push @regex_patterns, $line;
}
close($config_fh);

# Read the input file
open(my $input_fh, '<', $input_file) or die "Failed to open $input_file: $!";
my @lines = <$input_fh>;
close($input_fh);

# Apply regex patterns for text cleanup
foreach my $regex_pattern (@regex_patterns) {
    next if $regex_pattern =~ /^\s*;/;    # Skip patterns commented out with ";"
    my ($pattern, $replacement) = $regex_pattern =~ m/^s\/(.*?)\/(.*?)\/$/;
    foreach my $line (@lines) {
        $line =~ s/$pattern/$replacement/;
    }
}

# Write the cleaned-up lines to the output file
open(my $output_fh, '>', $output_file) or die "Failed to open $output_file: $!";
foreach my $line (@lines) {
    print $output_fh $line;
}
close($output_fh);

print "Text cleanup completed. Cleaned-up text written to $output_file.\n";
