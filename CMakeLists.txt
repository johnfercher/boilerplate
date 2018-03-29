CMAKE_MINIMUM_REQUIRED (VERSION 2.6)
PROJECT(boilerplate)

# Todos os diretórios
INCLUDE_DIRECTORIES(src)
INCLUDE_DIRECTORIES(include)
INCLUDE_DIRECTORIES(third-party)

# Cria uma lista chamada SRC
# com todos os arquivos .cpp de dentro da pasta src
file(GLOB_RECURSE SRC src/*.cpp)

# Remove o arquivo que contém a declaração função main
# da lista de arquivos .cpp
list(REMOVE_ITEM SRC "src/Main.cpp")

# Cria uma lista chamada INCLUDE
# com todos os arquivos .h de dentro da pasta include
file(GLOB_RECURSE INCLUDE include/*.h)

# Adiciona todos os .h e .cpp na biblioteca core
ADD_LIBRARY(core ${INCLUDE} ${SRC})

# Adiciona o .cpp com a função main ao boilerplate
ADD_EXECUTABLE(boilerplate src/Main.cpp)

# Linka a biblioteca (core) ao executável (boilerplate)
TARGET_LINK_LIBRARIES(boilerplate core)

enable_testing()

add_subdirectory(third-party/googletest)

include_directories(${gtest_SOURCE_DIR}/include ${gtest_SOURCE_DIR})
include_directories(${gmock_SOURCE_DIR}/include ${gmock_SOURCE_DIR})

# Cria uma lista chamada TEST
# com todos os arquivos .cpp de dentro da pasta test
file(GLOB_RECURSE TEST test/*.cpp)

ADD_EXECUTABLE(tests ${TEST})

# Linka todas as bibliotecas necessárias
# ao executável (test), incluindo a biblioteca
# (core) que será testada
target_link_libraries(tests
        pthread
        gtest
        gtest_main
        core)

# Compilação de release x debug
# A tag -Werror força warning como erro de compilação
# As tags -Wall e -Wextra forçam mais coisas a serem reportadas como warnings
# A tag -o2 na compilação de release otimiza o código
# A tag -g na compilação que não é release habilita o código para debug
IF(RELEASE)
    SET(CMAKE_CXX_FLAGS "-Wall -Werror -o2 -std=c++11")
ELSE()
    SET(CMAKE_CXX_FLAGS "-g -Wall -Werror -std=c++11")
ENDIF()