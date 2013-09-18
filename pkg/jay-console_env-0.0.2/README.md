Console_Env
-------
This only works with the Puppet Enterprise Console

This is the console_env module. It was written with the sole purpose of adding the ability to specify environments in the console using key/value pairs.

This module is merely a temporary solution, to set environments without having to use an alternative ENC.

Usage
-------
Include this module on your Console node:

`include console_env`

After this module has been included, a symbolic link will be created out of the original ENC and the target will be set to `/etc/puppetlabs/puppet-dashboard/external_node_wenv`
Your original ENC has been maintained, but renamed `/etc/puppetlabs/puppet-dashboard/external_node_orig`. To revert back, simply set the symbolic link to `/etc/puppetlabs/puppet-dashboard/external_node_orig`

Now you are able to specify the environment for individual nodes and groups in the console using the key value pair of:

environment => your_environment

Make sure to make all the proper adjustments in `/etc/puppetlabs/puppet/puppet.conf` specified in the [environment guide](http://docs.puppetlabs.com/guides/environment.html)


Contact
-------
jay@puppetlabs.com

Repo
-------

Please submit any pull request to [console-env repo](https://github.com/revhazroot/console_env/)
