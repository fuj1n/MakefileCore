all: $(OUT_FILE)

$(OUT_FILE): $(i)/Source.o
	$(LINKER) $(i)/Source.o

$(i)/Source.o: src/Source.cpp include/Header.h
	$(COMPILER) src/Source.cpp -o $(i)/Source.o