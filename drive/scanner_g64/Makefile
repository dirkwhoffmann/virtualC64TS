# Regression testing script for vAmiga (v0.1)
#
# To run all regression tests:
# make [-j<number of parallel threads>]

SUBDIRS = $(wildcard */)
INI = $(wildcard *.ini)
LOG = $(INI:.ini=.log)
TIFF = $(INI:.ini=.tiff)
MYMAKE = $(MAKE) --no-print-directory

.PHONY: all prepare clean

all: prepare $(LOG) $(TIFF) subdirs
	@echo > /dev/null

prepare:
	@echo "Running regression tests..."

subdirs:
	@for dir in $(SUBDIRS); do \
		echo "Entering ${CURDIR}/$$dir"; \
		$(MAKE) -C $$dir; \
	done

clean:
	rm -f *.log
	@for dir in $(SUBDIRS); do \
		echo "Cleaning up ${CURDIR}/$$dir"; \
		$(MAKE) -C $$dir clean; \
	done

# Failing tests
rpm3.log: 
	@echo "$(basename $@): FAIL"
	@echo "$(basename $@): FAIL" > $@

%.log: %.tiff
	-@cp $(basename $@).g64 /tmp/$(basename $(@F)).g64 &> /dev/null || true
	@$(VIRTUALC64) $(basename $@).ini &> /dev/null
	@cmp /tmp/$(basename $(@F)).tiff $(basename $@).tiff
	@echo "$(basename $@): PASS"
	@echo "$(basename $@): PASS" > $@
	-@rm /tmp/$(basename $(@F)).g64 &> /dev/null || true
	-@rm /tmp/$(basename $(@F)).tiff &> /dev/null || true

%.tiff:
	@echo "Creating missing reference image $@"
	-@cp $(basename $@).g64 /tmp/$(basename $(@F)).g64 &> /dev/null || true
	-@$(VIRTUALC64) $(basename $@).ini &> /dev/null
	@cp /tmp/$(basename $(@F)).tiff $(basename $@).tiff
	-@rm /tmp/$(basename $(@F)).g64 &> /dev/null || true
	-@rm /tmp/$(basename $(@F)).tiff &> /dev/null || true
	