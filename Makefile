# Path to the vAmiga executable
VIRTUALC64 = /tmp/VirtualC64/VirtualC64.app/Contents/MacOS/VirtualC64

SUBDIRS = C64
MYMAKE = $(MAKE) --no-print-directory

export VIRTUALC64

.PHONY: all subdirs clean

all: subdirs
	@echo > /dev/null
	
prebuild:
	@echo "Entering ${CURDIR}"
		
subdirs:
	@for dir in $(SUBDIRS); do \
		echo "Entering ${CURDIR}/$$dir"; \
		$(MAKE) -C $$dir; \
	done

clean:
	@for dir in $(SUBDIRS); do \
		echo "Cleaning up ${CURDIR}/$$dir"; \
		$(MAKE) -C $$dir clean; \
	done
