SOURCES=$(wildcard src/*.cpp) $(wildcard modules/*/*.cpp)
OBJECTS=$(addprefix build/,${SOURCES:.cpp=.o})
DIRS=$(sort $(dir ${OBJECTS}))

CXX=g++
LD_FLAGS=
CXX_FLAGS=-std=c++17 -I./

NAME=module_test
BINARY=out/${NAME}

ifdef DEBUG
CXX_FLAGS += -g -DDEBUG
endif
ifndef DEBUG
CXX_FLAGS += -O2
endif

all: dirs ${BINARY}

${BINARY}: ${OBJECTS}
	${CXX} $^ ${LD_FLAGS} -o $@

build/%.o: %.cpp
	${CXX} $< ${CXX_FLAGS} -c -o $@

.PHONY: dirs
dirs:
	mkdir -p ${DIRS}
	mkdir -p out/

.PHONY: clean
clean:
	-rm -r build/
	-rm -r out/
