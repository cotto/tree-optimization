# Copyright (C) 2001-2008, Parrot Foundation.
# $Id$

=head1 NAME

examples/benchmarks/addit.pir - Variable Argument Subroutines

=head1 SYNOPSIS

    % time ./parrot examples/benchmarks/addit.pir

=head1 DESCRIPTION

An IMC version of Joe Wilson's original PASM version of his C<varargs>
subroutines benchmark rewritten as it would be generated by a compiler
using Parrot calling conventions (PDD 3). It calls an "add it" function
50000 times in a loop and prints the result (21001097.970000).

=cut

.sub addit :main
        .local pmc a0
    a0 = new 'Integer'
    a0 = 1000
        .local pmc a1
    a1 = new 'Float'
    a1 = 7.100
        .local pmc a2
    a2 = new 'Integer'
    a2 = 87
        .local pmc a3
    a3 = new 'String'
    a3 = "3.87"
        .local pmc a4
    a4 = new 'String'
        a4 = "21000000"
    .local pmc x
    x = new 'Integer'
        x = 50000
AGAIN:
        dec x
        lt x, 0, FIN
    .local pmc result
        result = _varargs_adder(a0, a1, a2, a3, a4)
        branch AGAIN
FIN:
        print result
        print "\n"
        end
.end

.sub _varargs_adder
        .param pmc a0
    .param pmc a1
    .param pmc a2
    .param pmc a3
    .param pmc a4
        .local pmc sum
    sum = new 'Float'
        add sum, a0
        add sum, a1
        add sum, a2
        add sum, a3
        add sum, a4
    .return (sum)
.end

=head1 SEE ALSO

F<examples/benchmarks/addit.pl>, F<examples/benchmarks/addit.pasm>,
F<examples/benchmarks/addit2.pir>.

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
