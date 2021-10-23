import Danger

let danger = Danger()
let git = danger.git

// Encourage changelog entries.
let hasChangelog = git.modifiedFiles.contains("CHANGELOG.md")
if !hasChangelog {
    fail("Please add a CHANGELOG.md entry for your changes.")
}

// Run Swiftlint
SwiftLint.lint(inline: true, configFile: ".swiftlint.yml")

// Encourage updating test class.
let allSourceFiles = git.modifiedFiles + git.createdFiles
let sourceChanges = allSourceFiles.contains { $0.hasPrefix("SwiftlintDangerSample") }
let testsUpdated = git.modifiedFiles.contains { $0.contains("Tests") }

if sourceChanges && !testsUpdated {
    warn("The source files is changed, but the tests remained unmodified. Please update tests.")
}
