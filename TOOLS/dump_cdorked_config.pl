#!/usr/bin/perl
# -*- coding: utf-8 -*-
# 
# This script dumps the content of a shared memory block
# used by Linux/Cdorked.A into a file named httpd_cdorked_config.bin
# when the machine is infected.
#
# Some of the data is encrypted. If your server is infected and you
# would like to help, please send the httpd_cdorked_config.bin
# to our lab for analysis. Thanks!
#
# Alessandro Forghieri <alf@orion.it>
#
use IPC::SysV;

use strict;
use warnings;


my $SHM_SIZE = 6118512;
my $SHM_KEY = 63599;

my $OUTFILE="/tmp/httpd_cdorked_config.bin";

my $shmid = shmget($SHM_KEY, $SHM_SIZE, 0666);
if (!$shmid) {
  print STDERR "System not infected\n"
} else {
  print STDERR "*SYSTEM INFECTED ($shmid)!!!!\n";
  my $addr = shmat($shmid, undef, 0);
  open (OUTFILE,">$OUTFILE") or die "Opening $OUTFILE:$!";
  my $buffer;

  memread($addr,$buffer,$SHM_SIZE);
  my $bytes=syswrite(OUTFILE,$buffer);
  print STDERR "Dumped $SHM_SIZE bytes in $OUTFILE\n";
  close (OUTFILE) or die "closing $OUTFILE:$!";
}