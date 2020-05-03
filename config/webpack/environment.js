const { environment } = require('@rails/webpacker')

//For Bootstrap Date:11/04/20
const webpack = require('webpack')
environment.plugins.append('Provide',
new webpack.ProvidePlugin({
    $: 'jquery',
    jQuery : 'jquery',
    popper : ['popper.js', 'default']
  })
)
//End
module.exports = environment
