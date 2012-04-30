$out_dir = 'output';
add_cus_dep('mp', '001', 0, 'mpost');
sub mpost {
    my $file = $_[0];
    my ($name, $path) = fileparse($file);
    pushd($path);
    my $return = system "mpost $name";
    popd();
    return $return;
}
