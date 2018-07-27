.PHONY: html

html:
	apidoc -v -i src/api_v2 -f ".*\\.md$$" -o build/site -t template

clean:
	rm -rf build

