import Danger

let danger = Danger()
let git = danger.git

// Enforce changelog entries.
let hasChangelog = git.modifiedFiles.contains("CHANGELOG.md")
if !hasChangelog {
    fail("Please add a CHANGELOG.md entry for your changes.")
}

// Encourage smaller MRs
let createdFilesCount = git.createdFiles.count
let modifiedFilesCount = git.modifiedFiles.count
let deletedFilesCount = git.deletedFiles.count
let bigChangedThreshold = 500
if (createdFilesCount + modifiedFilesCount + deletedFilesCount) > bigChangedThreshold {
  warn("Pull Request size seems relatively large. Please split each into separate MR will helps faster, easier review.")
}

// Ensure added MR description
if danger.github.pullRequest.body == nil || danger.github.pullRequest.body?.isEmpty == true {
    message("MR has no description. You should provide a MR description.")
}

// Run Swiftlint
SwiftLint.lint(inline: true, configFile: ".swiftlint.yml")
