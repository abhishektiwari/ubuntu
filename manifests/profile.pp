# == Class: ubuntu::profile
#
# Goes into manifests/profile.pp
#
# === Parameters
#
# === Examples
#

class ubuntu::profile ($pname, $pcontent) {
	# Create a profile for Java
	file {"/etc/profile.d/${pname}.sh":
		ensure  => present,
		owner   => root,
		group   => root,
		mode    => 0644,
		content => template("${pcontent}"), 
	}
}