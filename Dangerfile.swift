import Danger

let danger = Danger()
let git = danger.git

// Enforce changelog entries.
let hasChangelog = git.modifiedFiles.contains("CHANGELOG.md")
if !hasChangelog {
    fail("Please add a CHANGELOG.md entry for your changes.")
}

// Encourage smaller PRs
let createdFilesCount = git.createdFiles.count
let modifiedFilesCount = git.modifiedFiles.count
let deletedFilesCount = git.deletedFiles.count
let bigPRThreshold = 500
if (createdFilesCount + modifiedFilesCount + deletedFilesCount) > bigPRThreshold {
  warn("Pull Request size seems relatively large. Please split each into separate PR will helps faster, easier review.")
}

// Encourage updating test class.
let allSourceFiles = git.modifiedFiles + git.createdFiles
let sourceChanges = allSourceFiles.contains { $0.hasPrefix("SwiftlintDangerSample") }
let testsUpdated = git.modifiedFiles.contains { $0.contains("Tests") }
if sourceChanges && !testsUpdated {
    warn("The source files is changed, but the tests remained unmodified. Please update tests.")
}

// Run Swiftlint
SwiftLint.lint(inline: true, configFile: ".swiftlint.yml")
