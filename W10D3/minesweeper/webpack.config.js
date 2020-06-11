
module.exports = {
  entry: './frontend/react_minesweeper.jsx',
  output: {
    filename: 'bundle.js'
  },
  module: {
    rules: [
      {
        test: /\.jsx?$/,
        exclude: /(node_modules)/,
        use: {
          loader: 'babel-loader',
          query: {
            presets: ['@babel/preset-env', '@babel/preset-react']
          }
        },
      }
    ]
  },
  devtool: 'source-map',
  resolve: {
    extensions: [".js", ".jsx", ".*"]
  }
};