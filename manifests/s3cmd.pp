# == Class: ubuntu::s3cmd
#
# Goes into manifests/s3cmd.pp
#
# === Parameters
#
# === Examples
#

class ubuntu::s3cmd ($my_access_key, $my_secret_key, $owner ='vagrant') {
	# resources
	package { "s3cmd":
		ensure => present,
	}
	# resources
	if $owner == 'root' {
		$uhome = "/${owner}"
	}
	else {
		$uhome = "/home/${owner}"
	}
	file {"${uhome}/.s3cfg":
		ensure  => present,
		owner   => $owner,
		group   => $group,
		mode    => '0644',
		# content or source or target
		content => template('ubuntu/s3cfg.erb'),
	}
}
