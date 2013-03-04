# == Class: ubuntu::basic
# Installs basic packages
# Goes into manifests/basic.pp
#

class ubuntu::basic {
	# Install build essential
	package { "build-essential":
		ensure => present,
	}
	# Install unzip
	package { "unzip":
		ensure => present,
	}

}