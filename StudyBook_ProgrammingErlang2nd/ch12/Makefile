.SUFFIXES: .erl .beam .yrl


.erl.beam:
	erlc -W $<


ERL = erl -boot start_clean


MODS = area_server0 \
			 area_server1 \
			 area_server2 \
			 area_server_final


all: compile


compile: ${MODS:%=%.beam}


clean:
	rm -rf *.beam erl_crash.dump

