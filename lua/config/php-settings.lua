local M = {}
function M.getPhpSettings()
	local composer_path = vim.fn.expand("$HOME/.composer/vendor/")
	return {
		intelephense = {
			files = {
				maxSize = 10000000,
			},
			stubs = {
				"amqp",
				"apache",
				"apcu",
				"bcmath",
				"blackfire",
				"bz2",
				"calendar",
				"cassandra",
				"com_dotnet",
				"Core",
				"couchbase",
				"crypto",
				"ctype",
				"cubrid",
				"curl",
				"date",
				"dba",
				"decimal",
				"dom",
				"ds",
				"enchant",
				"Ev",
				"event",
				"exif",
				"fann",
				"FFI",
				"ffmpeg",
				"fileinfo",
				"filter",
				"fpm",
				"ftp",
				"gd",
				"gearman",
				"geoip",
				"geos",
				"gettext",
				"gmagick",
				"gmp",
				"gnupg",
				"grpc",
				"hash",
				"http",
				"ibm_db2",
				"iconv",
				"igbinary",
				"imagick",
				"imap",
				"inotify",
				"interbase",
				"intl",
				"json",
				"judy",
				"ldap",
				"leveldb",
				"libevent",
				"libsodium",
				"libxml",
				"lua",
				"lzf",
				"mailparse",
				"mapscript",
				"mbstring",
				"mcrypt",
				"memcache",
				"memcached",
				"meminfo",
				"meta",
				"ming",
				"mongo",
				"mongodb",
				"mosquitto-php",
				"mqseries",
				"msgpack",
				"mssql",
				"mysql",
				"mysql_xdevapi",
				"mysqli",
				"ncurses",
				"newrelic",
				"oauth",
				"oci8",
				"odbc",
				"openssl",
				"parallel",
				"Parle",
				"pcntl",
				"pcov",
				"pcre",
				"pdflib",
				"PDO",
				"pdo_ibm",
				"pdo_mysql",
				"pdo_pgsql",
				"pdo_sqlite",
				"pgsql",
				"Phar",
				"phpdbg",
				"posix",
				"pspell",
				"pthreads",
				"radius",
				"rar",
				"rdkafka",
				"readline",
				"recode",
				"redis",
				"Reflection",
				"regex",
				"rpminfo",
				"rrd",
				"SaxonC",
				"session",
				"shmop",
				"SimpleXML",
				"snmp",
				"soap",
				"sockets",
				"sodium",
				"solr",
				"SPL",
				"SplType",
				"SQLite",
				"sqlite3",
				"sqlsrv",
				"ssh2",
				"standard",
				"stats",
				"stomp",
				"suhosin",
				"superglobals",
				"svn",
				"sybase",
				"sync",
				"sysvmsg",
				"sysvsem",
				"sysvshm",
				"tidy",
				"tokenizer",
				"uopz",
				"uv",
				"v8js",
				"wddx",
				"win32service",
				"winbinder",
				"wincache",
				"wordpress",
				"xcache",
				"xdebug",
				"xhprof",
				"xml",
				"xmlreader",
				"xmlrpc",
				"xmlwriter",
				"xsl",
				"xxtea",
				"yaf",
				"yaml",
				"yar",
				"zend",
				"Zend OPcache",
				"ZendCache",
				"ZendDebugger",
				"ZendUtils",
				"zip",
				"zlib",
				"zmq",
				"zookeeper",
			},
			environment = {
				includePaths = {
					"/usr/include/php",
					composer_path,
				},
			},
		},
	}
end

return M
