# CC specifies which compiler we're using
CC = g++

# COMPILER_FLAGS specifies the additional compilation options we're using
# -w suppresses all warnings
COMPILER_FLAGS = -w

BGFX_HEADERS =  -Ibgfx/include -Ibx/include -Ibimg/include

#LINKER_FLAGS specifies the libraries we're linking against
LINKER_FLAGS = bgfx/.build/linux64_gcc/bin/libbgfx-shared-libRelease.so -lSDL2 -lGL -lX11 -ldl -lpthread -lrt

#This is the target that compiles our executable
all : main.cpp
	./bgfx/.build/linux64_gcc/bin/shadercRelease \
	-f v_simple.sc \
	-o v_simple.bin \
	--platform linux \
	--type vertex \
	--verbose \
	-i bgfx/src
	./bgfx/.build/linux64_gcc/bin/shadercRelease \
	-f f_simple.sc \
	-o f_simple.bin \
	--platform linux \
	--type fragment \
	--verbose \
	-i bgfx/src
	$(CC) main.cpp -o  main $(COMPILER_FLAGS) $(LINKER_FLAGS) $(BGFX_HEADERS)
