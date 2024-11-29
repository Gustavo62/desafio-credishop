const { environment } = require('@rails/webpacker')

// Define the entry point explicitly
environment.config.merge({
  entry: {
    application: './app/javascript/packs/application.js', // ou o caminho do seu pack
  }
})

module.exports = environment
