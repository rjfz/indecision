const colors = require('tailwindcss/colors')

module.exports = {
  purge: [],
  darkMode: false, // or 'media' or 'class'
  theme: {
    fontFamily: {
      heading: ['Orbitron', 'ui-sans-serif', 'system-ui']
    },
    extend: {
      colors: {
        rose: colors.rose,
        violet: colors.violet,
        amber: colors.amber
      },
    },
  },
  variants: {
    extend: {
      backgroundColor: ['disabled'],
      textColor: ['disabled']
    },
  },
  plugins: [
    require('@tailwindcss/forms')
  ],
}
