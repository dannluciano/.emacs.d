EMACS=emacs
EFLAGS= -L . 					\
	-L ./vendor/ 				\
	-L ./elpa/yasnippet-bundle-0.6.1/ 	\
	-L ./elpa/emms-20110425/ 		\
	-L ./elpa/magit-20120616/ 		\
	-L ./elpa/textmate-20110816/

SRC=dl-darwin.el dl-gnu-linux.el

all: dlcorp elc


elc:
	$(EMACS) $(EFLAGS) -q -batch  -f batch-byte-compile $(SRC)

dlcorp:
	rm -f $@.el
	cat src/*.el > $@.el
	echo "(provide 'dlcorp)" >> $@.el

clean:
	rm -f dlcorp.el *.elc
