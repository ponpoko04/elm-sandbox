const HtmlPlugin = require("html-webpack-plugin");

module.exports = {
    entry: "./src/index.js",
    output: {
        filename: "main.js",
        path: __dirname + "/public",
    },
    module: {
        rules: [
            //{ test: /\.elm/, use: "elm-webpack-loader" }
            {test: /\.elm/, use: ['elm-hot-loader', 'elm-webpack-loader']},
        ],
    },
    plugins: [new HtmlPlugin({ title: "MY COOL ELM APP" })],
};