# minit
Mini/Micro/Minimal *nix Init Script

This package provides a minimal init script that is pretty much guaranteed to
work in any UNIX-like system, due to its simplicity. It can be used to daemonize
programs of allsorts in a quick fashion, and especially suited for those 
situations where a quick-n-dirty protoype is needed. There is surprisingly
little to configure, and since it is portable between *nixes, it does not
require OS-specific/init-system specific configuration.

# Installation and Notes
- Edit the `config` file to fit your specific needs. The program name, service name,
  and the user it will run under should be changed. When done, set the `CONFIGURED`
  flag to `true`.
- Run `make` to build up the skeleton init script
- Run `make install` to copy the completed init script to your init.d/rc.d directory
- By default, there are no runlevels, and the service is run directly from the rc.local
  script.
- To enable the script to run from rc.local at boot, run `make enable`.
- To disable the script from running at boot, run `make disable`.

# Usage
Once installed, the service can be started/stopped as root:
- To start: /etc/init.d/your_service_name start
- To stop: /etc/init.d/your_service_name stop
This is a basic init script. Start and stop are the only two functions it provides,
which is the minimum to safely start and stop a service at boot and shutdown.

