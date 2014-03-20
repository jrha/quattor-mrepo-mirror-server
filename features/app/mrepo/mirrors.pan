template features/app/mrepo/mirrors;

include 'components/metaconfig/config';

prefix '/software/components/metaconfig/services/{/etc/mrepo.conf.d/mirrors.conf}';
'module' = 'tiny';
'mode' = 0644;

variable url_sl = 'rsync://mirrorservice.org/ftp.scientificlinux.org/linux/scientific/$release/$arch/';
variable url_epel = 'rsync://mirrorservice.org/dl.fedoraproject.org/pub/epel/$release/$arch/';
variable url_repoforge = 'rsync://mirrorservice.org/apt.sw.be/redhat/el$release/en/$arch/rpmforge/';

# Scientific Linux 5.x
'contents/sl-5.10/' = nlist(
    'name', 'Scientific Linux 5.10',
    'release', '510',
    'arch', 'x86_64',
    'os', url_sl + 'SL/',
    'security', url_sl + 'updates/security/',
);


# Scientific Linux 6.x
'contents/sl-6.4/' = nlist(
    'name', 'Scientific Linux 6.4',
    'release', '6.4',
    'arch', 'x86_64',
    'os', url_sl + 'os/Packages/',
    'security', url_sl + 'updates/security/',
);

'contents/sl-6.5/' = nlist(
    'name', 'Scientific Linux 6.5',
    'release', '6.5',
    'arch', 'x86_64',
    'os', url_sl + 'os/Packages/',
    'security', url_sl + 'updates/security/',
);


# Red Hat Enterprise Linux
'contents/rhel6s' = nlist(
    'name', 'Red Hat Enterprise Linux Server $release ($arch)',
    'release', '6',
    'arch', 'x86_64',
    'updates', 'rhns://rhel-$arch-server-$release',
);


# Extra Packages for Enterprise Linux
'contents/epel-5/' = nlist(
    'name', 'Extra Packages for Enterprise Linux 5',
    'release', '5',
    'arch', 'x86_64',
    'base', url_epel,
);

'contents/epel-6/' = nlist(
    'name', 'Extra Packages for Enterprise Linux 6',
    'release', '6',
    'arch', 'x86_64',
    'base', url_epel,
);


# Repoforge 6
'contents/repoforge-6/' = nlist(
    'name', 'Repoforge Packages for Enterprise Linux 6',
    'release', '6',
    'arch', 'x86_64',
    'base', url_repoforge,
);


# Cloudera Distribution for Hadoop
'contents/cdh-4/' = nlist(
    'name', 'Cloudera Distribution for Hadoop $release (el6 $arch)',
    'release', '4',
    'arch', 'x86_64',
    'base', 'reposync://archive.cloudera.com/cdh4/redhat/6/$arch/cdh/$release/',
);


# Internet2 - Perfsonar
'contents/internet2/' = nlist(
    'name', 'Internet2 - Perfsonar (el6 $arch)',
    'release', '6',
    'arch', 'x86_64',
    'internet2', 'reposync://software.internet2.edu/rpms/el$release/$arch/main/',
    'web100', 'reposync://software.internet2.edu/web100_kernel/rpms/el$release/$arch/main/',
);
