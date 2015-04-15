# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    solver.pm                                          :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: sle-guil <sle-guil@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2015/04/02 15:50:59 by sle-guil          #+#    #+#              #
#    Updated: 2015/04/02 15:51:03 by sle-guil         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/user/bin/perl

package Solver;

use utf8;
use FindBin;
use lib ".";
use Math;

use Exporter 'import';
our $VERSION = '0.1';
our @EXPORT = qw(solve_poly0 solve_poly1 solve_poly2);

##		Module
#	@name:		Solver
#	@brief:		Provide solver for polynomial equation
#
##		Function
#	@name:		solve_poly0
#	@brief:		solve a null degree polynome.
##
sub solve_poly0 {
	print "Solving a null degree equation...\n";
	if ($_[0]) {
		print "Non-null coefficient : nothing is solution\n";
	}
	else {
		print "Null coefficient : Everything is solution\n";
	}
}

##		Function
#	@name:		solve_poly1
#	@brief:		Solve a first degree equation
##
sub solve_poly1 {
	print "Solving a first degree equation...\n";
	print "Solution is : " . ((-1 * $_[0]) / $_[1]) . "\n";
}

##		Function
#	@name:		solve_poly2
#	@brief:		solve a second degree equation in C
##
sub solve_poly2 {
	my (@coeff) = @_;
	my ($delta);
	print "Solving a second degree equation...\n";
	$delta = ($coeff[1] * $coeff[1]) - (4 * $coeff[0] * $coeff[2]);
	if ($delta > 0) {
		print "delta $delta > 0; Expression have two real solution\n";
		print "- root1 = " . ((-1 * $coeff[1] + &ft_sqrt($delta)) / ($coeff[2] + $coeff[2])) . "\n";
		print "- root2 = " . ((-1 * $coeff[1] - &ft_sqrt($delta)) / ($coeff[2] + $coeff[2])) . "\n";
	}
	elsif ($delta == 0) {
		print "delta $delta; Expression a double real solution : ";
		print ((-1 * $coeff[1]) / ($coeff[2] + $coeff[2])) . "\n";
	}
	else {
		print "delta $delta < 0; Expression have two complexe solution\n";
		$delta *= -1;
		print "- root1 = " . (-1 * $coeff[1] / ($coeff[2] + $coeff[2]));
		print " + i * " . (&ft_sqrt($delta) / ($coeff[2] + $coeff[2])) . "\n";
		print "- root2 = " . (-1 * $coeff[1] / ($coeff[2] + $coeff[2]));
		print " - i * " . (&ft_sqrt($delta) / ($coeff[2] + $coeff[2])) . "\n";
	}
}
