#! /bin/sh
exec perl -an -x -S $0 ${1+"$@"} # -*-perl-*-
#!perl
#
# process things like
#
# this explicitly makes TOKEN 'true'
# %define TOKEN
#
# this explicitly makes TOKEN 'untrue'
# %undef TOKEN
#
# %ifdef TOKEN
#
# %else %comments allowed after the else...
#
# %endif %comments allowed after the endif...
#
# with proper nesting;

BEGIN 
{
	while (($k,$v) = each %ENV) {
		print qq[$k => $v\n];
	}
	$ison 		= 1;
	%token_hash 	= {};
	@token_list 	= ();
	@cum_ison 		= ();
}

if (/^\%define\s+([A-Za-z_0-9]+)\s*$/) {
	if ($ison) {
		$token_hash{$1} = 1;
	}
} elsif (/^\%undef\s+([A-Za-z_0-9]+)\s*$/) {
	if ($ison) {
		$token_hash{$1} = 0;
	}
} elsif (/^\%ifdef\s+([A-Za-z_0-9]+)\s*$/) {
	push(@token_list,$1);
	push(@cum_ison,$ison && $token_hash{$1});
	$ison = $cum_ison[-1];
} elsif (/^\%else(\s*\%.+)?$/) {
	if (scalar(@token_list))
	{
		if (scalar(@token_list) > 1) {
			$ison = $cum_ison[-2] && !$cum_ison[-1];
		} else {
			$ison = !$cum_ison[-1];
		}
	} else {
		#an error: cannot else when there are no pending %ifdefs
	}
} elsif (/^\%endif(\s*\%.+)?$/) {
	if (scalar(@token_list))
	{
		pop(@token_list);
		pop(@cum_ison);
		if (scalar(@token_list) > 0) {
			$ison = $cum_ison[-1];
		} else {
			$ison = 1;
		}
	} else {
		#an error: cannot endif when there are no pending %ifdefs
	}
} 

if ($ison) {
	print; 
} else {
	print qq[%$_];
}

__END__

