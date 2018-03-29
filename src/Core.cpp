//
// Created by johnathan on 18/03/18.
//

#include <iostream>
#include <stdexcept>
#include "Core.h"

void calculator(int a, int b) {
  try {
    float result = divide(a, b);
    // Imprime a divisão formatada
    std::cout << a << " / " << b << " = " << result << std::endl;
  }
  catch (const std::invalid_argument& ia) {
    // Caso a divisão lance uma exceção, o mesmo a imprime no canal de errors
    std::cerr << "[Exception]: " << ia.what() << std::endl;
  }
}

double divide(int a, int b){
  // Lança exceção se for divisão por zero
  if(b == 0){
    throw std::invalid_argument("Divisao por 0");
  }

  // Retorna a divisão
  return a / b;
}


