all: tsToJs
TSSrc := $(wildcard public/js/*.ts)
JSSrc := $(TSSrc:.ts=.js)
tsToJs: $(TSSrc) $(JSSrc)

%.js : %.ts
	-tsc $< -module system
