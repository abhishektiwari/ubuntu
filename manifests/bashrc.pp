# == Class: ubuntu::bashrc
#
# Goes into manifests/bashrc.pp						

class ubuntu::bashrc ($owner ='vagrant', $group = 'vagrant', $shared_folder='/vagrant') {
	# resources
	if $owner == 'root' {
		$uhome = "/${owner}"
	}
	else {
		$uhome = "/home/${owner}"
	}
	file {"${uhome}/.bash_profile":
		ensure  => present,
		owner   => $owner,
		group   => $group,
		mode    => '0644',
		# content or source or target
		content => template('ubuntu/bashrc.erb'),
	}
}