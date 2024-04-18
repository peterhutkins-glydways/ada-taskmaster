// hello.h
#ifndef HELLO_H
#define HELLO_H

class HelloWorld {
public:
    HelloWorld();
    void say_hello() const;

    static HelloWorld& Instance();
};

#ifdef __cplusplus
extern "C" {
#endif

void say_hello_from_cpp();

#ifdef __cplusplus
}
#endif

#endif // HELLO_H
