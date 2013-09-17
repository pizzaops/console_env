Console-Env
-------
This only works with the Puppet Enterprise Console

This is the console-env module. It was written with the sole purpose of adding the ability to specify environments in the console using key/value pairs.

This module is merely a temporary solution, to set environments without having to use an alternative ENC.

Usage
-------
Include this module on your Console node:

`include console-env`

Edit `/etc/puppetlabs/puppet/puppet.conf` and change the following line:

From:
`external_nodes = /etc/puppetlabs/puppet-dashboard/external_node`

To:

`external_nodes = /etc/puppetlabs/puppet-dashboard/external_node_wenv`


Restart PE-httpd:

`service pe-httpd restart`

Now you are able to specify the environment for individual nodes and groups in the console using the key value pair of:

environment => your_environment

Make sure to make all the proper adjustments in `/etc/puppetlabs/puppet/puppet.conf` specified in the [environment guide](http://docs.puppetlabs.com/guides/environment.html)


Contact
-------
jay@puppetlabs.com

Repo
-------

Please submit any pull request to [console-env repo](https://github.com/revhazroot/console-env/)
