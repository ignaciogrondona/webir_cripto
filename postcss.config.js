var tailwindcss = require('tailwindcss');

module.exports = {
  "plugins": [
    require('tailwindcss')('./app/javascript/css/tailwind.js'),
    require('autoprefixer')(),
  ]
}
