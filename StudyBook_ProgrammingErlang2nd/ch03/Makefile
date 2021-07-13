.SUFFIXES: .erl .beam .yrl


.erl.beam:
	erlc -W $<


ERL = erl -boot start_clean


MODS = 


all: compile


compile: ${MODS:%=%.beam}


clean:
	rm -rf *.beam erl_crash.dump

