# Lab: C++ Templates

**Topic:** Function templates, class templates, multiple/non-type template
parameters, and template specialization
**Course:** Object-Oriented Programming with C++
**Level:** 2nd-Year Engineering
**Duration:** ~60 minutes

## Learning Objectives
- Write function templates with one and multiple type parameters.
- Use a trailing return type with `decltype` for mixed-type arithmetic.
- Define class templates with const-correct accessors.
- Build a generic container on top of `std::vector<T>`.
- Provide a full template specialization for a specific type.
- Use a non-type template parameter to fix array size at compile time.

## Prerequisites
- Classes, encapsulation, constructors, getters/setters.
- `std::vector` basics and exception handling (`throw` / `std::out_of_range`).
- A C++17 compiler (`g++`) and `make`.

## File Structure
```
MainProgram.cpp          # the file you complete
test.cpp                 # Catch2 tests (do not edit)
catch_amalgamated.hpp    # Catch2 (provided)
catch_amalgamated.cpp    # Catch2 (provided)
Makefile
README.md
explain.txt
explain.md
MainProgram_teacher.cpp  # reference solution (instructor only)
```

## How to Compile
```
make
```
This builds the `MainProgram` executable from `MainProgram.cpp`.

## How to Run
```
./MainProgram
```

## How to Test
Run all tests:
```
make test
```
Run a single group (useful while you work through the TODOs):
```
make test_1   # Group 1: maxValue
make test_2   # Group 2: addValues
make test_3   # Group 3: Pair
make test_4   # Group 4: Box
make test_5   # Group 5: describe
make test_6   # Group 6: FixedArray
```
Clean build artifacts:
```
make clean
```

## Submission Instructions
Submit **only** `MainProgram.cpp`. Do not rename functions, classes, methods,
or change their signatures — the autograder depends on them. Do not add header
files or split the code into multiple files.

## Common Mistakes
- Forgetting `template <typename T>` directly above the function/class.
- Defining template member functions in a separate `.cpp` (templates must be
  visible where instantiated — keep everything in `MainProgram.cpp`).
- Writing the specialization without `template <>` before it.
- Returning `T1` instead of `decltype(a + b)` in `addValues` (loses precision).
- Forgetting to throw `std::out_of_range` on invalid indices.
- Treating `N` in `FixedArray<T,N>` as a runtime value — it is a compile-time
  constant.

## Academic Integrity
This is an individual assignment. You may discuss concepts, but the code you
submit must be your own. Sharing or copying solutions is a violation of the
course academic integrity policy.
