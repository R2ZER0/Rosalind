package RNA::Translator;

use Moo;
use namespace::clean;

has 'translation_map' => (is => 'lazy');

sub _build_translation_map {

    my $trans_table_text = q{
        UUU F      CUU L      AUU I      GUU V
        UUC F      CUC L      AUC I      GUC V
        UUA L      CUA L      AUA I      GUA V
        UUG L      CUG L      AUG M      GUG V
        UCU S      CCU P      ACU T      GCU A
        UCC S      CCC P      ACC T      GCC A
        UCA S      CCA P      ACA T      GCA A
        UCG S      CCG P      ACG T      GCG A
        UAU Y      CAU H      AAU N      GAU D
        UAC Y      CAC H      AAC N      GAC D
        UAA Stop   CAA Q      AAA K      GAA E
        UAG Stop   CAG Q      AAG K      GAG E
        UGU C      CGU R      AGU S      GGU G
        UGC C      CGC R      AGC S      GGC G
        UGA Stop   CGA R      AGA R      GGA G
        UGG W      CGG R      AGG R      GGG G 
    };

    my @pairs = $trans_table_text =~ m/([ACGU]{3} [A-Z])/g;
    
    my %trans_map = ();
    foreach my $pair (@pairs) {
        if( $pair =~ m/([ACGU]{3})/ ) {
            $trans_map{$1} = {$2};
        }
    }
    
    return \%trans_map;
};


sub translate {
    # Takes an RNA::Sequence, and returns a string containing the protien
    my ($self, $rna) = @_;
    
    
};

1;