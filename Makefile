
default:	build

clean:
	rm -rf Makefile objs

build:
	$(MAKE) -f objs/Makefile
	$(MAKE) -f objs/Makefile manpage

install:
	$(MAKE) -f objs/Makefile install

upgrade:
	/root/nginx/sbin/nginx -t

	kill -USR2 `cat /root/nginx/logs/nginx.pid`
	sleep 1
	test -f /root/nginx/logs/nginx.pid.oldbin

	kill -QUIT `cat /root/nginx/logs/nginx.pid.oldbin`
