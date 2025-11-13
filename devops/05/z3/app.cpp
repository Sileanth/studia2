#include <iostream>

#ifndef COMPILATION_FLAGS
#define COMPILATION_FLAGS "NONE"
#endif

int main() {
    std::cout << "Application Compiled With Flags: " << COMPILATION_FLAGS << std::endl;
    return 0;
}
