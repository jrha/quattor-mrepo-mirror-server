template features/app/mrepo/mrepo;

# Packages
'/software/repositories' = append(create('repository/rpmforge-el6-x86_64'));

'/software/packages' = pkg_repl('mrepo', '0.8.8-0.pre1.el6.rft', 'noarch'); # Use newer version from rpmforge
'/software/packages/{yum-utils}' ?= nlist(); # So we can use reposync

# So we can mirror RHEL
'/software/packages/{python-dmidecode}' ?= nlist();
'/software/packages/{python-ethtool}' ?= nlist();
'/software/packages/{python-gudev}' ?= nlist();
'/software/packages/{dbus-python}' ?= nlist();
'/software/packages/{usermode}' ?= nlist();
'/software/packages/{libnl}' ?= nlist();
'/software/packages/{libgudev1}' ?= nlist();
'/software/packages/{pygobject2}' ?= nlist();
'/software/packages/{m2crypto}' ?= nlist();

# Configuration
include 'components/metaconfig/config';

prefix '/software/components/metaconfig/services/{/etc/mrepo.conf}';
'module' = 'tiny';
'mode' = 0644;

'contents/main/repoviewcmd' = '/bin/true';

'contents/main/quiet' = 'yes'; # Don't complain, send email etc.

# Don't clean up packages if they are removed from upstream, we might be using them!
'contents/main/rsync-cleanup' = 'no';
'contents/main/rhnget-cleanup' = 'no';
'contents/main/reposync-cleanup' = 'no';
'contents/main/mirrordir-cleanup' = 'no';
'contents/main/lftp-cleanup' = 'no';

'contents/main/srcdir' = '/data/mirrors/src';
'contents/main/wwwdir' = '/data/mirrors/www';
'contents/main/arch' = 'x86_64'; # Default architecture to mirror if none specified

'contents/main/rsync-options' = '-rtHL --partial --exclude=sites/'; # There is a mess of symlinks in sites/ sl releases, for anything else this is a noop

'contents/main/createrepo-options' = '-p --simple-md-filenames --update --worker 8 -s sha'; # Until we upgrade everything to sl6 or sl5 + a newer yum we cannot use anything other than sha (sha1) hashing :(

#'contents/main/rhnlogin' = 'username:password';
