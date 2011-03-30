# Setting up Bugzilla with Puppet

Notes for setting up Bugzilla with Puppet on a CentOS 5.5 box

[Bugzilla Notes](/bugzilla)


### Code Snippet for Listing Installed Perl Modules

	perl -MFile::Find=find -MFile::Spec::Functions -Tlwe 'find { wanted => sub { print canonpath $_ if /\.pm\z/ }, no_chdir => 1 }, @INC'

## Using Yum to find Packages

	yum list installed perl*
	yum list available perl-C*
	yum list perl


## Puppet File

	class centos55 {
		$centosPackages = ["git", "subversion", "emacs"]
		package { $centosPackages: ensure => installed }
	}

	class bugzilla {
		$bugzillaPackages = [
			"perl",
			"perl-DateTime",
			"perl-DBD-MySQL",
			"perl-DBI",
			"perl-Digest-SHA",
			"perl-Email-MIME",
			"perl-Email-Send",
			"perl-URI",
			"mysql",
			"mysql-server",
		]
		package { $bugzillaPackages: ensure => installed } 
	}

	include centos55
	include bugzilla
