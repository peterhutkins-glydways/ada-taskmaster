// hello.cpp
#include "hello.h"
#include <iostream>

// Constructor. Shows when the object is created.
HelloWorld::HelloWorld() {
    std::cout << "C++HelloWorld constructed and initialized.\n";
}


void HelloWorld::say_hello() const {
    std::cout << "Hello world from C++!\n";
}

HelloWorld& HelloWorld::Instance() {
    static HelloWorld instance;
    return instance;
}

// Global static object
static HelloWorld helloInstance = HelloWorld::Instance();

// C wrapper to the C++ function that we want to call.
extern "C" {
    void say_hello_from_cpp() {
        helloInstance.say_hello();
    }
}
