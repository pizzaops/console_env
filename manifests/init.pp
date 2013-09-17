# == Class: console-env
#
# This is the console-env module. It was written with the sole purpose of adding the ability to specify environments in the console using key/value pairs
#
# === Important
#
# This Module only works to add functionality to the Puppet Enterprise Console
#
# Once you have applied this class to you need to adjust /etc/puppetlabs/puppet/puppet.conf:
#
# Change the line: external_nodes = /etc/puppetlabs/puppet-dashboard/external_node to external_nodes = /etc/puppetlabs/puppet-dashboard/external_node_env
# Please remember to make this adjustment after the class has been applied (ie after the first puppet run)
#
# You are going to need to restart pe-httpd before the ENC node can take affect
#
# === Parameter in Console
#
# Now using the node or group in the console you can set the environment key value pair
#
# environment => YOURENVIRONMENT
#
#
# === Author
#
# Jay Wallace <jay@puppetlabs.com>
#
# === Copyright
#
# Copyright 2013 Jay Wallace
#
# === Notes.
# Essentially this module just manages a file (the adjusted enc), if you run into any issues just revert back to the original ENC in puppet.conf and restart
# pe-httpd
#
# Feel free to just use the adjust ENC script if you do not prefer to use the module. I promise I won't be offended.
#
# This is not the most elegant solution, but it works.
class console-env {

  file { "/etc/puppetlabs/puppet-dashboard/external_node_wenv":
    owner => root,
    group => root,
    mode  => 755,
    source => "puppet:///modules/console-env/external_node_wenv",
  }
}
