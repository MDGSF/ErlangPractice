.SUFFIXES: .erl .beam .yrl


.erl.beam:
	erlc -W $<


ERL = erl -boot start_clean


MODS = hello \
       lib_misc


all: compile


compile: ${MODS:%=%.beam} subdirs


special1.beam: special1.erl
	${ERL} -Dflag1 -W0 special1.erl


application1: compile
	${ERL} -pa Dir1 -s application1 start Arg1 Arg2


subdirs:
	cd ch02; $(MAKE)
	cd ch03; $(MAKE)
	cd ch12; $(MAKE)
	cd socket_dist; $(MAKE)

clean:
	rm -rf *.beam erl_crash.dump
	cd ch02; $(MAKE) clean
	cd ch03; $(MAKE) clean
	cd ch12; $(MAKE) clean
	cd socket_dist; $(MAKE) clean

