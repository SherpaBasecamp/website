#!/usr/bin/env bash
# shellcheck disable=1090,1091,2154

#
#  Testing things out.
#

fmt="https://raw.githubusercontent.com/SherpaCLI/sherpa/refs/heads/master/lib/std/fmt.sh"
# Source std/fmt
. <(curl -s "$fmt")

_install_cli_tools() {

  # Check if webi is installed
  if ! command -v webi &>/dev/null; then
    p "❌ Webi not found, installing..."
    curl -sS https://webinstall.dev/webi | bash &>/dev/null
  else
    p "✅  Webi is installed."
  fi

  # Check if Git is installed
  if ! command -v git &>/dev/null; then
    echo "❌ Git not found, installing..."
    webi git@stable &>/dev/null
  else
    p "✅ Git is installed."
  fi

  # Check if Cargo is installed
  if ! command -v cargo &>/dev/null; then
    echo "❌ Cargo not found, installing..."
    curl -sS https://webi.sh/rustlang | sh &>/dev/null
    source "$HOME/.config/envman/PATH.env"
  else
    echo "✅ Cargo is installed."
  fi

  # Check if Pathman is installed
  if ! command -v pathman &>/dev/null; then
    echo "❌ Pathman not found, installing..."
    webi pathman@stable &>/dev/null
  else
    echo "✅ Pathman is installed."
  fi

  # Check if Aliasman is installed
  if ! command -v aliasman &>/dev/null; then
    echo "❌ Aliasman not found, installing..."
    webi aliasman@stable &>/dev/null
  else
    echo "✅ Aliasman is installed."
  fi

  # Check if WatchExec is installed
  if ! command -v watchexec &>/dev/null; then
    echo "❌ Watchexec not found, installing..."
    webi watchexec@stable &>/dev/null
  else
    echo "✅ WatchExec is installed."
  fi

  # Check if Shellcheck is installed
  if ! command -v shellcheck &>/dev/null; then
    echo "❌ Shellcheck not found, installing..."
    webi shellcheck@stable &>/dev/null
  else
    echo "✅ Shellcheck is installed."
  fi

  # Check if shfmt is installed
  if ! command -v shfmt &>/dev/null; then
    echo "❌ Shfmt not found, installing..."
    webi shfmt@stable &>/dev/null
  else
    echo "✅ Shfmt is installed."
  fi

  # Check if Pandoc is installed
  if ! command -v pandoc &>/dev/null; then
    echo "❌ Pandoc not found, installing..."
    webi pandoc@stable &>/dev/null
  else
    echo "✅ Pandoc is installed."
  fi

  # Check if yq is installed
  if ! command -v yq &>/dev/null; then
    echo "❌ Yq not found, installing..."
    webi yq@stable &>/dev/null
  else
    echo "✅ Yq is installed."
  fi

  # Check if jq is installed
  if ! command -v jq &>/dev/null; then
    echo "❌ Jq not found, installing..."
    webi jq@stable &>/dev/null
  else
    echo "✅ Jq is installed."
  fi

  # Check if bashunit is installed
  if ! command -v bashunit &>/dev/null; then
    echo "❌ Bashunit not found, installing..."
    curl -s https://bashunit.typeddevs.com/install.sh | bash &>/dev/null
  else
    echo "✅ Bashunit is installed."
  fi

  # Check if shdoc is installed
  if ! command -v shdoc &>/dev/null; then
    echo "❌ Shdoc not found, installing..."
    git clone --recursive https://github.com/reconquest/shdoc /tmp/shdoc &>/dev/null
    cd /tmp/shdoc || return
    sudo make install
    rm -rf /tmp/shdoc
  else
    echo "✅ Shdoc is installed."
  fi

  br
  p "${btnSuccess} Done! ${x} The tools are installed"
}

_clone_repo() {
  # Clone the repository into ~/.sherpa

  # Backup existing .sherpa
  if [[ -d "$HOME/.sherpa" ]]; then
    # Rename it to .sherpa-bkp
    # maybe add the date in the name, or something
    mv "$HOME/.sherpa" "$HOME/.sherpa-bkp"
  fi

  echo ""
  echo "Setup SherpaDotDir to ~/.sherpa"
  echo ""
  git clone -q https://github.com/SherpaCLI/sherpa.git "${HOME}/.sherpa"
  [[ -d "$HOME/.sherpa" ]] && echo "SDD Installed!"

  echo ""
  echo "Setup SherpaCustomDir to ~/sherpa"
  echo ""
  [[ -d "${HOME}/sherpa" ]] && mv "${HOME}/sherpa" "${HOME}/sherpa-bkp"
  cp -r "${HOME}/.sherpa/templates/SCD" "${HOME}/sherpa"
  [[ -d "${HOME}/.sherpa" ]] && echo "SCD Installed!"

  br
  p "${btnSuccess} Done! ${x} Directories are created"
}

_add_to_path() {

  # Check if ~/.zherpa directory exists and add it to the PATH using pathman
  if [ -d "$HOME/.sherpa/bin" ]; then
    echo "$HOME/.sherpa/bin directory exists, adding to PATH..."
    pathman add "$HOME/.sherpa/bin"
  else
    echo "$HOME/.sherpa/bin directory does not exist."
  fi

  br
  p "${btnSuccess} Done! ${x} The path is clear"
}

_aliases() {
  # Add basic aliases with Aliasman
  aliasman s sherpa
  aliasman sdd cd "$HOME"/.sherpa
  aliasman scd cd "$HOME"/sherpa
  aliasman boxes cd "$HOME"/sherpa/boxes
  aliasman libs cd "$HOME"/sherpa/libs

  br
  p "${btnSuccess} Done! ${x} Aliases are created"

}

h1 " Setting up the Sh:erpa Basecamp"
hr "+" "-"
p "Grab a cup of tea, by the campfire..."
br

h2 "Unloading the tools"
_install_cli_tools
br

h2 "Cloning the Repo"
_clone_repo
br

h2 "Adding to the Path"
_add_to_path
br

h2 "Creating first aliases"
_aliases
br

echo ""
echo "   _____ __                            "
echo "  / ___// /_  _ ___  _________  ____ _ "
echo "  \__ \/ __ \(_) _ \/ ___/ __ \/ __ */ "
echo " ___/ / / / / /  __/ /  / /_/ / /_/ /  "
echo "/____/_/ /_(_)\___/_/  / .___/\__,_/   "
echo "                      /_/              "
echo " Welcome to the Bash Adventure!        "
echo ""
