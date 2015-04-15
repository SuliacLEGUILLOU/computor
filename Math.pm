# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Math.pm                                            :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: sle-guil <sle-guil@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2015/04/02 15:52:56 by sle-guil          #+#    #+#              #
#    Updated: 2015/04/02 15:53:00 by sle-guil         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/user/bin/perl

package Math;

use Exporter 'import';
our $VERSION = '0.1';
our @EXPORT = qw(ft_sqrt);

##		Module
#	@name:		Math
#	@brief:		Basic math implementation.
#
##		Function
#	@name:		ft_sqrt
#	@brief:		Return the square of given value.
##
sub ft_sqrt {
	my ($nbr) = @_;
	my ($Xn, $Xnp1);

	$Xnp1 = $nbr / 2;
	$Xn = 0;
	while ($Xn != $Xnp1) {
		$Xn = $Xnp1;
		$Xnp1 = ($Xn + $nbr / $Xn) / 2;
	}
	$Xn;
}
