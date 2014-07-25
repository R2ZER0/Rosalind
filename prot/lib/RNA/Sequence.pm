package RNA::Sequence;

use Moo;
use namespace::clean;

has 'sequence' => (
    is => 'ro',
    required => 1,
    coerce => sub {
        uc($_[0] =~ s/\s//rg);  # remove whitespace and UPPERCASE
    },
    isa => sub { 
        die "$_[0] is not an RNA sequence!" unless $_[0] =~ m/^[ACGU]$/
    },
);


has 'codons' => (
    is => 'lazy',
);

sub _build_codons {
    my $self = shift;
    
    my @codons = $self->sequence =~ m/(.{1,3})/g;
    return \@codons;
};

1;