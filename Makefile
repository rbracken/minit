# For building the delux binary
include config
all:
	if [ $(CONFIGURED) != true ]; then \
		printf "\033[1m\033[31mCONFIGURED flag not set. Have you edited config yet?\033[0m\n"; \
		exit 1; \
	fi
	mkdir -p build
	cp init.d/skel build/$(SERVICE_NAME)
	sed -i 's|PROG_DESCR|$(PROG_DESCR)|g' build/$(SERVICE_NAME)
	sed -i 's|PROG_AUTHOR|$(PROG_AUTHOR)|g' build/$(SERVICE_NAME)
	sed -i 's|BIN_PATH|$(BIN_PATH)|g' build/$(SERVICE_NAME)
	sed -i 's|SERVICE_NAME|$(SERVICE_NAME)|g' build/$(SERVICE_NAME)
	sed -i 's|RUN_AS|$(RUN_AS)|g' build/$(SERVICE_NAME)
	@echo "Build complete. You may now install."
install:
	@echo "Note: this operation requires root privileges"
	cp build/$(SERVICE_NAME) $(INIT_PATH) 
	chown root: $(INIT_PATH)
	chmod +x $(INIT_PATH)
uninstall:
	@echo "Note: this operation requires root privileges"
	@echo "Deleting init script"
	rm -f $(INIT_PATH) 
	@echo "Removing init script from rc.local (if enabled)"
	sed -i '\:$(INIT_PATH):d' /etc/rc.local
enable:
	@echo "Adding script to rc.local"
	@echo "Note: this operation requires root privileges"
	echo "$(INIT_PATH) start" >> /etc/rc.local
disable:
	@echo "Removing init script from rc.local"
	@echo "Note: this operation requires root privileges"
	sed -i '\:$(INIT_PATH):d' /etc/rc.local
clean:
	rm -rf build
