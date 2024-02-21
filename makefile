OBJS	= spirograph.o spiroProcs.o
ASM	= yasm -g dwarf2 -f elf64
CC	= g++ -g -std=c++11 

all: spirograph

spirograph.o: spirograph.cpp
	$(CC) -c spirograph.cpp

spiroProcs.o: spiroProcs.asm 
	$(ASM) spiroProcs.asm -l sprioProcs.lst

spirograph: $(OBJS)
	$(CC) -no-pie -o spirograph $(OBJS) -lglut -lGLU -lGL -lm

# -----
# clean by removing object files.

clean:
	rm  $(OBJS)
	rm  spiroProcs.lst
