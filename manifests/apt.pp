# == Class: ubuntu::apt
#
# Goes into manifests/apt.pp

class ubuntu::apt {
	# Downloads the package lists from the repositories and "updates" them 
	exec { "apt-update":
		command => "sudo apt-get update"
	}
}