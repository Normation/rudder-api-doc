all: clean build/relay.html build/public-api

build/public-api:
	apidoc -v --config src/public-api -i src/public-api/endpoints -f ".*\\.md$$" -o $@ -t template

build/relay/openapi.yml:
	# openapi requires that the parent folder exist but not the target one...
	mkdir -p build
	rm -fr build/relay
	openapi bundle src/relay/openapi.yml -o $@

build/relay.html: build/relay/openapi.yml
	redoc-cli bundle --disableGoogleFont --options.theme.colors.primary.main="#f08004" --options.expandResponses="200," --options.hideHostname=1 --output $@ $<

clean:
	rm -rf build

