//
// Created by johnathan on 18/03/18.
//

#include <googletest/googletest/include/gtest/gtest.h>
#include <Core.h>

TEST(divide, WhenDivisorIsZero_ShouldThrowInvalidArgumentException){
  srand(time(NULL));

  int a = rand();
  int b = 0;

  // Testa que divisão por zero deve sempre lançar exceção
  EXPECT_THROW(divide(a, b), std::invalid_argument);
}

TEST(divide, WhenDivisiorIsOne_ShouldReturnA){
  srand(time(NULL));

  int a = rand();
  int b = 1;

  // Testa que caso seja divisão por 1, deve retornar o proprio dividendo
  EXPECT_EQ(divide(a, b), a);
}

TEST(calculator, WhenDivisorIsZero_ShouldCerrTheRightError){
  srand(time(NULL));

  int a = rand();
  int b = 0;

  // Testa que divisão por zero deve imprimir um erro no canal de erros
  testing::internal::CaptureStderr();
  EXPECT_NO_THROW(calculator(a, b));
  std::string output = testing::internal::GetCapturedStderr();
  EXPECT_STREQ("[Exception]: Divisao por 0\n", output.c_str());
}

TEST(calculator, WhenDivisorIsValid_ShouldCoutTheRightResponse){
  srand(time(NULL));

  int a = rand();
  int b = rand()+1;

  std::stringstream ss;
  ss << a << " / " << b << " = " << divide(a, b) << std::endl;

  // Testa que divisões válidas devem ser impressas de forma formatada
  testing::internal::CaptureStdout();
  EXPECT_NO_THROW(calculator(a, b));
  std::string output = testing::internal::GetCapturedStdout();
  EXPECT_STREQ(ss.str().c_str(), output.c_str());
}




