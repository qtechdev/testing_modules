#include <iostream>

#include "modules/greeter/greeter.hpp"

int main(int argc, const char *argv[]) {
  qmod::greeter g("Hello,");



  std::string name;
  std::cout << "What is you name?\n> ";

  std::cin >> name;

  g(name);

  return 0;
}
