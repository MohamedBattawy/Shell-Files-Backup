.ONESHELL:
calldirname:
	 @ cd ~
	 @ echo "type dirname:"; \
	 read dirname; 
	 @ echo "type backupdirname:"; \
	 read backupdirname;
	 if [ ! -d "$$backupdirname" ]; then mkdir -p $$backupdirname; else echo "folder exists" ;fi
	 @ echo "type interval:"; \
	 read interval; 
	 @ echo "type maxbackups"; \
	 read maxbackups; 
	 @./backupd.sh "$$dirname" "$$backupdirname" "$$interval" "$$maxbackups"
