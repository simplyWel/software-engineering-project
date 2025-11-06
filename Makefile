CC = g++
TARGET_MAIN = bin/executavel
TARGET_TEST = bin/testeRegressivo.exe

all: $(TARGET_MAIN)

$(TARGET_MAIN): src/main.cpp
	$(CC) src/main.cpp -o $(TARGET_MAIN)
test: $(TARGET_TEST)

$(TARGET_TEST): test/main.cpp src/bib.cpp
	$(CC) test/main.cpp src/bib.cpp -Iinclude -o $(TARGET_TEST)