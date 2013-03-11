# Copy a set of private and public keys to servers
# Define: ubuntu:sshkey
# Parameters:
# arguments
# Uses:
# ubuntu::sshkey { "ctn-github-root":
# 	keyname   => "ctn-github",
# 	owner     => "root",
# 	group     => "root"
# }

define ubuntu::sshkey($keyname ='id_dsa', $owner ='vagrant', $group = 'vagrant') {
	
	if $owner =="root" {
		$sshkeypath   = "/${owner}/.ssh/"
		$homefs       = "/${owner}"
	}
	else {
		$sshkeypath   = "/home/${owner}/.ssh/"
		$homefs       = "/home/${owner}"
	}

	file { "${sshkeypath}/${keyname}":
		ensure => file,
		source => "puppet:///modules/ubuntu/sshkey/${keyname}",
		mode    => '0600',
		owner   => $owner,
		group   => $group,
	}

	file { "${sshkeypath}/${keyname}.pub":
		ensure => file,
		source => "puppet:///modules/ubuntu/sshkey/${keyname}.pub",
		mode    => '0600',
		owner   => $owner,
		group   => $group,
	}
}