PROJECT := project
BIN_DIR := bin

CC := g++
AR := ar rcs
CFLAGS := -O2 -Wall -Iinclude -fPIC

SRC := $(wildcard src/*.cpp)
HDR := $(wildcard src/*.hpp) $(wildcard include/*.hpp) $(wildcard include/*.h)
OBJS := $(patsubst src/%.cpp,$(BIN_DIR)/%.o,$(SRC))

.PHONY: all clean dirs

all: dirs $(BIN_DIR)/lib$(PROJECT).a $(BIN_DIR)/lib$(PROJECT).so $(BIN_DIR)/$(PROJECT).dll $(BIN_DIR)/$(PROJECT).exe

dirs:
    @mkdir -p $(BIN_DIR)

# Compila cada .cpp de src para bin/*.o
$(BIN_DIR)/%.o: src/%.cpp $(HDR)
    $(CC) $(CFLAGS) -c $< -o $@

# Bibliotecas e executável
$(BIN_DIR)/lib$(PROJECT).a: $(OBJS)
    $(AR) $@ $^

$(BIN_DIR)/lib$(PROJECT).so: $(OBJS)
    $(CC) -shared -o $@ $^

# Gera DLL (Windows) — pode requerer MinGW/MSYS; gera também um arquivo de import lib .dll.a
$(BIN_DIR)/$(PROJECT).dll: $(OBJS)
    $(CC) -shared -o $@ $^ -Wl,--out-implib,$(BIN_DIR)/lib$(PROJECT).dll.a

# Executável
$(BIN_DIR)/$(PROJECT).exe: $(OBJS)
    $(CC) $(CFLAGS) -o $@ $^

clean:
    -rm -f $(BIN_DIR)/*.o $(BIN_DIR)/*.a $(BIN_DIR)/*.so $(BIN_DIR)/*.dll $(BIN_DIR)/*.dll.a $(BIN_DIR)/*.exe