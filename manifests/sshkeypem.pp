# Copy a set of private keys to servers
# Define: ubuntu:sshkeypem
# Parameters:
# arguments
# Uses:
# ubuntu::sshkeypem { "ctn-github-root-pub":
# 	keyname   => "ctn-github.pem",
# 	owner     => "root",
# 	group     => "root"
# }

define ubuntu::sshkeypem($keyname ='mykeypair.pem', $owner ='vagrant', $group = 'vagrant') {

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
}