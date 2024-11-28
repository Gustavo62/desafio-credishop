# Usar uma imagem oficial do Ruby como base
FROM ruby:3.3.5-bullseye

# Instalar dependências de sistema
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

# Definir o diretório de trabalho dentro do contêiner
WORKDIR /app

# Copiar o Gemfile e o Gemfile.lock para o contêiner
COPY Gemfile Gemfile.lock ./

# Instalar as dependências do bundle
RUN gem install bundler:2.3.26 && bundle install

# Copiar todo o código da aplicação para o contêiner
COPY . .

# Configurar a porta em que a aplicação irá rodar
EXPOSE 3000

# Definir o comando para rodar o servidor Rails
CMD ["bin/rails", "server", "-b", "0.0.0.0"]
