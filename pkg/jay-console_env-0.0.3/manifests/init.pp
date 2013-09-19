# == Class: console_env
#
# This is the console-env module. It was written with the sole purpose of adding the ability to specify environments in the console using key/value pairs
#
# === Important
#
# This Module only works to add functionality to the Puppet Enterprise Console
#
# This module changes external_node to a symbolic link and points the link to the modified enc version. The original
# ENC is include, and has been renamed external_node_orig
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
class console_env {

  file { "/etc/puppetlabs/puppet-dashboard/external_node_wenv":
    owner => root,
    group => root,
    mode  => 755,
    source => "puppet:///modules/console_env/external_node_wenv",
  }
  file { "/etc/puppetlabs/puppet-dashboard/external_node_orig":
    owner  => root,
    group  => root,
    mode   => 755,
    source => "puppet:///modules/console_env/external_node_orig",
}
  file {  "/etc/puppetlabs/puppet-dashboard/external_node":
    ensure  => "link",
    target  => "/etc/puppetlabs/puppet-dashboard/external_node_wenv",
    require => File['/etc/puppetlabs/puppet-dashboard/external_node_wenv'],
}
}
