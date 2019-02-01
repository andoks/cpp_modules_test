#include <iostream>

export module hello.core;

export 
namespace hello {
namespace core {
int add_42(int v) {
    return v + 42;
}
} // namespace core
} // namespace hello
    
