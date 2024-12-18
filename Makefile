all: spike

.PHONY:  clean

spike:
	# Unfortunately there is no tag on the Spike repo, so we pick the latest
	-git clone --depth 1 https://github.com/riscv-software-src/riscv-isa-sim.git
	mkdir build
	cd build && ../riscv-isa-sim/configure CFLAGS=-static CXXFLAGS="-static -static-libgcc -static-libstdc++" LDFLAGS=-static && make -j `nproc` spike && cp spike ../

clean:
	-rm -rf build riscv-isa-sim spike
