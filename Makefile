.PHONY: public-api relay-api

SITES=public-api relay-api

all: $(SITES)

$(SITES):
	apidoc -v --config src/$@ -i src/$@/endpoints -f ".*\\.md$$" -o build/$@ -t template

clean:
	rm -rf build

