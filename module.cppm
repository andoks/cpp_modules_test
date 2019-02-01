#include <iostream>

export module hello.core;

export 
namespace hello {
namespace core {
int add_42(int v) {
    return v + 42;
}

void greet(const std::string& name){
    std::cout << "Hello there, " << name << ", nice to meet you!\n";
}

} // namespace core
} // namespace hello
    
