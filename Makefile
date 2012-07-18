TARGET=dlcorp.el

all:
	cat src/*.el > dlcorp.el
	echo "(provide 'dlcorp)" >> dlcorp.el

clean:
	rm dlcorp.el
