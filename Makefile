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

# Define the check target
check: $(OUTPUT)
	@if [ -e "$(OUTPUT)" ]; then \
		echo "$(OUTPUT) exists."; \
	else \
		echo "Error: $(OUTPUT) does not exist. Please build it using 'make'."; \
		exit 1; \
	fi

clean:
	rm -f $(OUTPUT)

.PHONY: all check clean
