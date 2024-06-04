const fs = require("node:fs");

const scopes = fs
  .readdirSync("./lua/lazyvimenhanced/plugins/extras", { withFileTypes: true })
  .filter((dirent) => dirent.isDirectory())
  .map((dirent) => dirent.name);

module.exports = {
  allowCustomIssuePrefixs: false,
  allowEmptyIssuePrefixs: false,
  issuePrefixs: [{ value: "Closes" }],
  maxHeaderLength: 100,
  scopes: scopes,
  skipQuestions: ["body", "breaking"],
  useCommitSignGPG: true,
};
