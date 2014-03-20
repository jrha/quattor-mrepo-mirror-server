template features/app/mrepo/httpd;

# Install and configure webalizer
include 'components/filecopy/config';

'/software/packages/{webalizer}' ?= nlist();

prefix '/software/components/filecopy/services/{/etc/webalizer.conf}/';
'config' = file_contents('features/app/mrepo/webalizer.conf');
'owner' = 'root:root';
'perms' = '0444';


# Configure httpd
include 'components/metaconfig/config';

'/software/packages' = pkg_repl('config-templates-metaconfig', '1.39-1', 'noarch'); # Provides TemplateToolkit patterns for httpd among others

prefix '/software/components/metaconfig/services/{/etc/httpd/conf.d/mrepo.conf}';
'module' = 'httpd/generic_server';
'mode' = 0644;
'daemon/0' = 'httpd';

'contents/global/pairs' = list(
    nlist(
        'key', 'indexoptions',
        'value', list(
            'NameWidth=*',
            'DescriptionWidth=*',
        ),
    ),
    nlist(
        'key', 'ReadmeName',
        'value', '/FOOTER.html',
    ),
    nlist(
        'key', 'HeaderName',
        'value', '/HEADER.php',
    ),
);

'contents/aliases/' = list(
    nlist(
        'url', '/mrepo',
        'destination', '/data/mirrors/www',
    ),
    nlist(
        'url', '/yum',
        'destination', '/data/mirrors/www',
    ),
    nlist(
        'url', '/current',
        'destination', '/data/mirrors/www',
    ),
    nlist(
        'url', '/snapshot',
        'destination', '/data/snapshot',
    ),
);

'contents/directories/' = list(
    nlist(
        'name', '/data/(mirrors|snapshot)',
        'regex', true,
        'quotes', '"',
        'options', list(
            'Indexes',
	    'FollowSymlinks',
	    'SymLinksifOwnerMatch',
	    'IncludesNOEXEC',
	),
    ),
    nlist(
        'name', '.*rhel.*',
        'regex', true,
        'quotes', '"',
        'access' , nlist(
            'order', list('deny', 'allow'),
            'deny', 'all',
            'allow', '.gridpp.rl.ac.uk',
        ),
    ),
);

'contents/vhosts' = nlist(
    'pairs', nlist(
        'mirrors', nlist(
            'ip', 'mirrors.gridpp.rl.ac.uk', #TODO: Don't hardcode this!
            'port', '80',
            'servername', 'sdsdf',
            'rewrite', nlist(
                'engine', 'on',
                'rule', '^/snapshot/([0-9\-]+)/(.*)$  /data/snapshot/$1/www/$2',
            ),
        ),
    ),
);
