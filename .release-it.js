module.exports = {
  git: {
    commitArgs: ["-S"],
    commitMessage: "chore(release): v${version}",
    tagAnnotation: "v${version}",
    tagName: "v${version}",
  },

  github: { release: true },
  npm: { publish: false },

  plugins: {
    "@release-it/conventional-changelog": { infile: "CHANGELOG.md" },
  },
};
