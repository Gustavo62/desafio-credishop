# Usa a imagem base Ruby
FROM ruby:3.3

# Instala dependências do sistema
RUN apt-get update -qq && apt-get install -y \
  build-essential \
  libpq-dev \
  nodejs \
  postgresql-client \
  curl

# Instala Yarn usando o método oficial
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
    apt-get update -qq && apt-get install -y yarn

# Define o diretório de trabalho dentro do contêiner
WORKDIR /app

# Copia o Gemfile e o Gemfile.lock para instalar as gems
COPY Gemfile* ./
RUN bundle install

# Copia os arquivos do projeto para o contêiner
COPY . .

# Instala dependências do Webpacker
RUN yarn install

# Expõe a porta padrão do Rails
EXPOSE 3000

# Comando padrão do contêiner
CMD ["sh", "bin/start-rails.sh"]
