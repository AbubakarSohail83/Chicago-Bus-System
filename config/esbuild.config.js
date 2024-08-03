const { build } = require("esbuild");

build({
  entryPoints: ["./app/javascript/packs/application.jsx"],
  bundle: true,
  outfile: "./public/packs/application.js",
  minify: true,
  sourcemap: true,
  loader: {
    ".js": "jsx",
  },
}).catch(() => process.exit(1));
