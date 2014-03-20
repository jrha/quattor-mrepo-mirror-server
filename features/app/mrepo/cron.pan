template features/app/mrepo/cron;

include 'components/cron/config';

'/software/components/cron/entries' = merge(
    list(
        nlist(
            'name', 'mirror-repositories',
            'command', 'nice -n 9 mrepo -ug',
            'timing', nlist(
                'minute', '0',
                'hour', '1,13',
            ),
        ),
        nlist(
            'name', 'create-monthly-snapshot',
            'command', '/usr/local/sbin/zfs-create-daily-snapshot data/mirrors',
            'timing', nlist(
                'minute', '0',
                'hour', '12',
                'day', '1',
            ),
        ),
    )
);
