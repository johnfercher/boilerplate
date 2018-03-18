FROM gcc:4.9

# Instala o CMAKE
RUN apt-get update && apt-get -y install cmake

# Copia tudo para o container
COPY . /boilerplate
WORKDIR /boilerplate

# Adiciona permissão de execução dos shellscripts
RUN chmod +x /boilerplate/configure.sh
RUN chmod +x /boilerplate/run.sh

# Executa a instalação na criação dos containers
RUN /boilerplate/configure.sh

# Comando executado no docker run
CMD ["bash", "run.sh"]