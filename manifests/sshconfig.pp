# Copy a set of config files to servers
# Define: ubuntu:config
# Parameters:
# arguments
# Uses:
# ubuntu::sshconfig { "config":
# 	owner     => "root",
# 	group     => "root"
# }

define ubuntu::sshconfig($configname ='config', $owner ='vagrant', $group = 'vagrant') {
	if $owner =="root" {
		$sshkeypath   = "/${owner}/.ssh/"
		$homefs       = "/${owner}"
	}
	else {
		$sshkeypath   = "/home/${owner}/.ssh/"
		$homefs       = "/home/${owner}"
	}
	file { "${sshkeypath}/${configname}" :
		ensure  => file,
		source  => "puppet:///modules/ubuntu/sshkey/config",
		mode    => '0600',
		owner   => $owner,
		group   => $group,			
	}
}