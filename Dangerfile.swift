import Danger

let danger = Danger()

// Encourage changelog entries
let hasChangelog = danger.git.modifiedFiles.contains("CHANGELOG.md")
if (!hasChangelog) {
    warn("Please add a CHANGELOG.md entry for your changes.")
}

// Encourage smaller PRs
var bigPRThreshold = 1000;
if (danger.github.pullRequest.additions + danger.github.pullRequest.deletions > bigPRThreshold) {
  warn("Pull Request size seems relatively large. If this Pull Request contains more changes, please split each into separate PR will helps faster, easier review.")
}
