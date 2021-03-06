#!/usr/bin/env perl -T
use 5.006;
use strict;
use warnings;
use Test::More;

use AMC::Export::ItemAnalysis;

my $whoami = scalar getpwuid($<);
if ($whoami eq 'matthew') {
    plan tests => 1;
} 
else {
    plan skip_all => "Only instructor can run tests on private data";
}

my $project_dir = "/Users/matthew/Box/MC-Projects/20191 Discrete Mathematics/q07.scratch";
my $data_dir = $project_dir . "/data";
my $fich_noms = $project_dir . "/amc.csv";
my $output_file = $project_dir . "/exports/q07-itemanalysis.tex";
my $ex = AMC::Export::ItemAnalysis->new();
$ex->set_options("fich",
        "datadir"=>$data_dir,
        "noms"=>$fich_noms,
        );
ok($ex->export($output_file),"Export succeeded.  View $output_file for results.");
