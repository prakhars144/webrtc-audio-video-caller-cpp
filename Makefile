# Compiler
CXX := g++

# Compiler flags
CXXFLAGS := -std=c++17 -Wall -Wextra -pedantic

# Boost libraries
# apt install libboost-all-dev

# Source files
SOURCES := ./src/http_async.cpp

# Output executable
OUTPUT := webrtc_app

# Build target
all: $(OUTPUT)

$(OUTPUT): $(SOURCES)
	$(CXX) $(CXXFLAGS) -o $@ $^ -lboost_system -lboost_thread -lboost_date_time -lboost_regex -lboost_filesystem -lpthread

clean:
	rm -f $(OUTPUT)

.PHONY: all clean

