## Setting up a project

Xcode 16.4

#### SwiftLint

#### Adding SwiftLint
The first step to installing SwiftLint is to install Homebrew, which is a commonly used tool for installing third-party software on macOS. You can find the latest instructions for installing Homebrew here: [https://brew.sh](https://brew.sh) – run that command into a terminal window, wait a few minutes to complete, and you’re done.

Now that SwiftLint is installed, use the `cd` terminal command to change to the directory where you project is, then run `swiftlint` – no special parameters, just that. SwiftLint will immediately scan all the Swift code in the current directory along with any subdirectories, then present its report.

#### Custom build phases
At this point our code has one consistent style, and we’ve made a few line length tweaks to make it all easier to read. However, as soon as we start writing new code chances are we’ll start breaking linting rules pretty much immediately, which means we’ll need to remember to re-run SwiftLint before saving our changes to Git – and make sure other team members do it too.

Fortunately, Xcode has a simple solution: we can have it run SwiftLint automatically every time we try to run a build, so that any problems from SwiftLint automatically show up right inside Xcode.

This is done using a custom Build Phase, so start by selecting your project from the Project Navigator, then selecting the UltimatePortfolio target and selecting the Build Phases tab.

You should currently see five build phases: target dependencies, run build tool plug-ins, compile sources, link binary with libraries, and copy bundle resources. Above those five you’ll see a really small + button, and I’d like you to press that now, choosing Run Script Phase.

A new “Run Script” phase will appear in the list of build phases, and if you double-click that name you can rename it to “SwiftLint” – it’s not required, but it helps keep your project organized, particularly if you end up adding more custom phases.

Below the '/bin/sh' text field, you’ll see a text area with the prompt “Type a script or drag a script file from your workspace to insert its path.” I’d like you to copy the following in there:

```bash
if [[ "$(uname -m)" == arm64 ]]; then
    export PATH="/opt/homebrew/bin:$PATH"
fi

if which swiftlint > /dev/null; then
  swiftlint
else
  echo "warning: SwiftLint not installed, download from https://github.com/realm/SwiftLint"
fi
```
Fixing issue where Xcode can't access swiftlint.yml file [https://thisdevbrain.com/swiftlint-permission-issue/](https://thisdevbrain.com/swiftlint-permission-issue/)   

#### Adding Rules to SwiftLint
SwiftLint’s configuration is stored in a file called `.swiftlint.yml` – that has a dot at the beginning, meaning it’s a hidden file and so best edited using the terminal.
First, run this command: `nano .swiftlint.yml` – that will open the file for editing, creating it if it doesn’t exist already.
Now give the file this content:
```
disabled_rules:
- operator_whitespace
```
When you’re done, press Ctrl+O then Return to save the file, then press Ctrl+X to quit. Reminder: This file starts with a dot so it will be hidden in Finder. If you want to toggle showing hidden files in Finder, activate a Finder window then press Shift+Cmd+. and you’ll see them in translucent colors.
With that final change in place, you should be able to run `swiftlint` again and see no warnings or errors – our code is clean!
Tip: If you disable the rule you might be asked why you’ve adjusted SwiftLint’s defaults. Most of the time, though, most people are just happy to see you follow a consistent style – unless of course you do something particularly “creative”!