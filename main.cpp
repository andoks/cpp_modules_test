#include <iostream>

import hello.core;

const auto input =  1337;

int main(int, char*[]) {
    std::cout << "add_42(" << input << ") = " << hello::core::add_42(input) << '\n';

    hello::core::greet("andoks");
}
