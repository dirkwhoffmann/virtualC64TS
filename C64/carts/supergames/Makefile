# Regression testing script for vAmiga (v0.1)
#
# To run all regression tests:
# make [-j<number of parallel threads>]

# Collect all .ini files
INI=$(wildcard *.ini)
LOG=$(INI:.ini=.log)
TIFF=$(INI:.ini=.tiff)

.PHONY: all prepare clean

all: prepare $(LOG) $(TIFF)
	@echo > /dev/null

prepare:
	@echo "Running regression tests..."

clean:
	rm -f *.log

%.log: %.tiff
	-@cp $(basename $@).crt /tmp/$(basename $(@F)).crt &> /dev/null || true
	@$(VIRTUALC64) $(basename $@).ini &> /dev/null
	@cmp /tmp/$(basename $(@F)).tiff $(basename $@).tiff
	@echo "$(basename $@): PASS"
	@echo "$(basename $@): PASS" > $@
	-@rm /tmp/$(basename $(@F)).crt &> /dev/null || true
	-@rm /tmp/$(basename $(@F)).tiff &> /dev/null || true

%.tiff:
	@echo "Creating missing reference image $@"
	-@cp $(basename $@).crt /tmp/$(basename $(@F)).crt &> /dev/null || true
	@$(VIRTUALC64) $(basename $@).ini &> /dev/null
	@cp /tmp/$(basename $(@F)).tiff $(basename $@).tiff
	-@rm /tmp/$(basename $(@F)).crt &> /dev/null || true
	-@rm /tmp/$(basename $(@F)).tiff &> /dev/null || true
	