# ============================================================================
#  Makefile  -  C++ Templates Lab
#  Linux autograder + local dev. C++17, Catch2 v3 (amalgamated).
# ============================================================================

CXX      = g++
CXXFLAGS = -Wall --std=c++17

# Program build (your MainProgram.cpp with its own main())
PROGRAM  = MainProgram
PROG_SRC = MainProgram.cpp

# Test build (Catch2). test.cpp #includes MainProgram.cpp directly,
# so there is NO copy step and it stays cross-platform.
TEST_BIN = test_bin
TEST_SRC = test.cpp catch_amalgamated.cpp

# ----------------------------------------------------------------------------
# Default: build the program.
# ----------------------------------------------------------------------------
all: $(PROGRAM)

$(PROGRAM): $(PROG_SRC)
	$(CXX) $(CXXFLAGS) $(PROG_SRC) -o $(PROGRAM)

# ----------------------------------------------------------------------------
# Build the test binary.
# ----------------------------------------------------------------------------
$(TEST_BIN): $(TEST_SRC) MainProgram.cpp
	$(CXX) $(CXXFLAGS) $(TEST_SRC) -o $(TEST_BIN)

# Run ALL tests.
test: $(TEST_BIN)
	./$(TEST_BIN)

# ----------------------------------------------------------------------------
# Per-group targets for PARTIAL CREDIT grading.
# Each runs only the tests tagged with its group.
# ----------------------------------------------------------------------------
test_1: $(TEST_BIN)
	./$(TEST_BIN) "[group1]"

test_2: $(TEST_BIN)
	./$(TEST_BIN) "[group2]"

test_3: $(TEST_BIN)
	./$(TEST_BIN) "[group3]"

test_4: $(TEST_BIN)
	./$(TEST_BIN) "[group4]"

test_5: $(TEST_BIN)
	./$(TEST_BIN) "[group5]"

test_6: $(TEST_BIN)
	./$(TEST_BIN) "[group6]"

# ----------------------------------------------------------------------------
# Cleanup.
# ----------------------------------------------------------------------------
clean:
	rm -f $(PROGRAM) $(TEST_BIN)

.PHONY: all test test_1 test_2 test_3 test_4 test_5 test_6 clean
