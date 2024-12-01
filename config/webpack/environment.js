const { environment } = require('@rails/webpacker')

environment.config.merge({
  entry: {
    application: './app/javascript/packs/application.js',
  }
})

environment.config.set('node', {
  dns: 'empty',
  async_hooks: 'empty',
  bson_ext: 'empty',
  kerberos: 'empty',
  snappy: 'empty',
})

module.exports = environment
