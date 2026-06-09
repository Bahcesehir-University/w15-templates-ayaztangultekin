# C++ Templates

## 1. Concept Overview
Templates are C++'s tool for **generic programming**: you write a function or
class once, parameterized by type (or value), and the compiler stamps out a
concrete version for each type you actually use. This avoids duplicating logic
for `int`, `double`, `std::string`, and so on. The standard library is built on
templates — `std::vector`, `std::pair`, `std::max` are all generic.

A template is **not** code by itself; it is a recipe. The compiler *instantiates*
it (generates real code) the first time you use it with a specific type.

## 2. Key Concepts
- **Function template** — a generic function: `template <typename T> T f(T x);`
- **Multiple type parameters** — `template <typename T1, typename T2>` lets the
  two arguments differ in type.
- **Trailing return type** — `auto f(...) -> decltype(a + b)` lets the compiler
  compute the correct result type of an expression (e.g. `int + double` →
  `double`).
- **Class template** — a generic class, e.g. `template <typename A, typename B> class Pair`.
- **Generic container** — a class template that stores `T` values, often wrapping
  `std::vector<T>`.
- **Full specialization** — a separate implementation for one specific type.
- **Non-type template parameter** — a *value* parameter such as `int N`, fixed
  at compile time, useful for array sizes.

## 3. Important Keywords
- `template` — introduces a template declaration.
- `typename` / `class` (inside `<>`) — declares a type parameter (interchangeable here).
- `decltype(expr)` — yields the static type of an expression without evaluating it.
- `auto ... -> ReturnType` — trailing return type syntax.
- `template <>` — marks an **explicit (full) specialization**.
- **Non-type parameter** — e.g. `int N`; a compile-time constant value.

## 4. Common Mistakes
- Forgetting the `template <...>` line above the function or class.
- Splitting template definitions into a `.cpp` file — they must be visible where
  instantiated, so keep them in `MainProgram.cpp`.
- Omitting `template <>` before a specialization (it becomes an unrelated overload).
- Returning `T1` instead of `decltype(a + b)` in `addValues`, truncating doubles.
- Treating `N` in `FixedArray<T, N>` as runtime data instead of a compile-time constant.
- Forgetting to `throw std::out_of_range` on invalid indices.

## 5. Mini Examples
```cpp
// Function template
template <typename T>
T maxValue(T a, T b) { return (a > b) ? a : b; }

// Mixed types with deduced return type
template <typename T1, typename T2>
auto addValues(T1 a, T2 b) -> decltype(a + b) { return a + b; }

// Class template
template <typename A, typename B>
class Pair {
    A first_; B second_;
public:
    Pair(A f, B s) : first_(f), second_(s) {}
    A getFirst() const { return first_; }
};

// Full specialization
template <typename T> int describe(const T&) { return 1; }
template <> int describe<std::string>(const std::string& s) {
    return 2 + static_cast<int>(s.size());
}

// Non-type parameter
template <typename T, int N>
class FixedArray { T data_[N]; public: int capacity() const { return N; } };
```

## 6. When to Use This
- You have the **same logic for several types** (math helpers, comparisons).
- You are building a **container or wrapper** that should hold any element type.
- A type needs **special handling** while the rest stay generic → specialization.
- You want a **compile-time-sized** structure with no heap allocation → non-type
  parameter (`FixedArray<T, N>`).
- In practice: most reusable library/utility code in modern C++ is templated.
