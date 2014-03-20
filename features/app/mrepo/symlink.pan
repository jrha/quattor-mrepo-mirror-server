template features/app/mrepo/symlink;

include 'components/symlink/config';

'/software/components/symlink/links' = append(
    nlist(
        'name', '/data/snapshot',
        'target', '/data/mirrors/.zfs/snapshot',
        'exists', false,
        'replace', nlist(
            'all', 'yes',
        ),
    )
);
