class { "firewall":
  ensure => stopped
} ->
class { 'continuent_install' :
  installMysql => true,
  installSSHKeys => true
}

if $ec2_tag_group == "" {
	host { "db1": ip => "192.168.11.101" } ->
	host { "db2": ip => "192.168.11.102" } ->
	host { "db3": ip => "192.168.11.103" } ->
	host { "db4": ip => "192.168.11.104" } ->
	host { "db5": ip => "192.168.11.105" } ->
	host { "db6": ip => "192.168.11.106" } ->
	host { "db7": ip => "192.168.11.107" } ->
	host { "db8": ip => "192.168.11.108" } ->
	Class["firewall"]
} else {
	class { "ec2_hosts": 
		include_short_hostname => true
	} ->
	Class["firewall"]
}