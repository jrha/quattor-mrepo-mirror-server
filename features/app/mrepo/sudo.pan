template features/app/mrepo/sudo;

include 'components/sudo/config';

'/software/components/sudo/privilege_lines/' = append(
    nlist(
        'user', 'apache',
        'run_as', 'root',
        'host', 'ALL',
        'options','NOPASSWD:',
        'cmd','/usr/local/sbin/zfs-list-snapshots-json',
    )
);

