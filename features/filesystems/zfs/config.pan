template features/filesystems/zfs/config;

'/software/repositories' = append(create('repository/zfsonlinux-epel-6-x86_64'));

'/software/packages/{zfs}' ?= nlist();

'/software/components/chkconfig/service/zfs/on/' = '';
