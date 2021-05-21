SUBDIRS = $(wildcard */)
MYMAKE = $(MAKE) --no-print-directory

.PHONY: all subdirs clean

all: subdirs
	@echo > /dev/null
			
subdirs:
	@for dir in $(SUBDIRS); do \
		echo "${CURDIR}/$$dir"; \
		$(MAKE) -C $$dir; \
	done

clean:
	@for dir in $(SUBDIRS); do \
		echo "Cleaning up ${CURDIR}/$$dir"; \
		$(MAKE) -C $$dir clean; \
	done
