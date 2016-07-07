charmap     := charmap.md
font-name   := file-icons
font-folder := dist
font-config := icomoon.json
icon-size   := 34
icon-folder := svg
svg         := $(wildcard $(icon-folder)/*.svg)


all: unpack $(font-folder)/$(font-name).woff2


# Aliases
unpack:  $(font-folder)/$(font-name).ttf
charmap: $(charmap)


# Extract a downloaded IcoMoon folder
$(font-folder)/%.ttf: %.zip
	@rm -rf $(font-folder) tmp $(font-config)
	@unzip -qd tmp $^
	@mv tmp/fonts $(font-folder)
	@mv tmp/selection.json $(font-config)
	@rm -rf tmp $^
	@echo "Files extracted."


# Generate a WOFF2 file from a TTF
%.woff2: %.ttf
	@[ ! -f $@ ] && { \
		hash woff2_compress 2>/dev/null || { \
			echo >&2 "WOFF2 conversion tools not found. Consult the readme file."; \
			exit 2; \
		}; \
		woff2_compress $^ >/dev/null; \
		echo "WOFF2 file generated."; \
	};
	


# Clean up SVG source
lint: $(svg)
	@perl -0777 -pi -e '\
		s/\r\n/\n/g; \
		s/<g id="icomoon-ignore">\s*<\/g>//gmi; \
		s/<g\s*>\s*<\/g>//gmi; \
		s/\s+(id|viewBox|xml:space)="[^"]*"/ /gmi; \
		s/<!DOCTYPE[^>]*>//gi; \
		s/<\?xml.*?\?>//gi; \
		s/<!--.*?-->//gm; \
		s/ style="enable-background:.*?;"//gmi; \
		s/"\s+>/">/g; \
		s/\x20{2,}/ /g; \
		s/[\t\n]+//gm;' $^



# Generate/update character map
$(charmap):
	@./create-map.pl -i=$(icon-folder) --size=$(icon-size) $(font-folder)/$(font-name).svg $@




# Reset unstaged changes/additions in object directories
clean:
	@git clean -fd $(font-folder)
	@git checkout -- $(font-folder) 2>/dev/null || true


# Delete extracted and generated files
distclean:
	@rm -rf $(font-folder)


.PHONY: clean distclean $(charmap)
.ONESHELL:
