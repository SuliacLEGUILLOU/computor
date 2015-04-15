# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    computor.pl                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: sle-guil <sle-guil@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2015/04/02 15:51:15 by sle-guil          #+#    #+#              #
#    Updated: 2015/04/15 16:21:43 by sle-guil         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/usr/bin/perl -w

use utf8;
use FindBin;
use lib ".";
use Solver;

print "Hi ! Welcome to my computorV1 : simple polynome solver edition !\n";

##		function
#	@name:		get_expr
#	@brief:		Get a user input expression
#	@return:	Checked users expression.
#
##		regex
#	@brief:		Check if line is a polynomial equation
#	@synt:		((+-)(coeff)(* X^pow)?)+
##
sub get_expr {
	my (@element);

	print "Enter your polynomial equation :\n";
	chomp($_ = <STDIN>);
	if (m/.*= .*/) {
		@element = split/= /, $_;
		if ($element[0] !~ m/^[\+\-]/) {
			$element[0] = "+ " . $element[0];
		}
		if ($element[1] !~ m/^[\+\-]/) {
			$element[1] = "+ " . $element[1];
		}
		$_ = join "= ", @element;
	}
	if (m/([\+\-] \d+(\.\d+)?( \* X(\^\d+)?)? )+=( [\+\-] \d+(\.\d+)?( \* X(\^\d+)?)?)+/) {
		$_;
	}
	else {
		$_ = 0;
	}
}

##		function
#	@name:		get_indice
#	@brief:		extract indice from given line.
##
sub get_indice {
	my ($line) = @_;
	my ($tmp);

	@tmp = split/\^/, $line;
	if ($tmp[1]) {
		$tmp[1];
	}
	else {
		1;
	}
}

##		function
#	@name:		tab_add
#	@brief:		extract the coefficent in the given expr, and add them to give table.
##
sub tab_add {
	my ($expr, $op, @table) = @_;
	my ($i, $indice, @line);

	$i = 0;
	@line = split/\s+/, $expr;
	while ($i < $#line + 1) {
		$indice = 0;
		if ($line[$i] eq "+" || $line[$i] eq "-") {
			if ($line[$i + 2] eq "*") {
				$indice = get_indice($line[$i + 3]);
			}
			if ($line[$i] eq $op) {
				$table[$indice] += $line[$i + 1];
			}
			else {
				$table[$indice] -= $line[$i + 1];
			}
		}
		$i++;
	}
	@table;
}

##		function
#	@name:		get_degree
#	@brief:		Find the real degree of the expression
##
sub get_degree {
	my ($i, $ret);

	$i = 0;
	$ret = 1;
	foreach (@_) {
		$i++;
		if ($_) {
			$ret = $i;
		}
	}
	$ret - 1;
}

##		function
#	@name:		parse_expr
#	@brief:		parse the expr into a coefficient table to solve the equation
#	@return:	Coefficient table
##
sub parse_expr {
	my ($expr) = @_;
	my ($line, $degree, @table);

	@line = split /=/, $expr;
	$table[0] = 0;
	@table = &tab_add($line[0], "+", @table);
	@table = &tab_add($line[1], "-", @table);
	$degree = &get_degree(@table);
	print "Given expression have a degree of $#table\nReduced to a degree $degree expression : ";
	@table;
}

##		function
#	@name:		print_expr
#	@brief:		print given expression.
##
sub print_expr {
	my $i = 0;

	print "$_[0]";
	foreach (@_) {
		if ($i && $_) {
			if ($_ < 0) {
				print " $_*X^$i";
			}
			else {
				print " +$_*X^$i";
			}
		}
		$i++;
	}
	print " = 0\n";
}

##		Main loop
while (1) {
	$base = &get_expr;
	if ($base) {
		@expr = &parse_expr($base);
		&print_expr(@expr);
		$degree = get_degree(@expr);
		if ($degree == 0) {
			&solve_poly0(@expr);
		}
		elsif ($degree == 1) {
			&solve_poly1(@expr);
		}
		elsif ($degree == 2) {
			&solve_poly2(@expr);
		}
		else {
			print "I don't have tools for that equation\n";
		}
	}
	else {
		print "Error : I can not read what you typed\n";
		print "Format of an element of a polynome is  : [+-] (coeff) * X^(pow)\n";
		print "Only the coefficient is mandatory in this program\n";
	}
	print "\n";
}
