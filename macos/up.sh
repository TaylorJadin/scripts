#!/bin/sh
# up script to keep your Mac up-to-date (OS, Homebrew, and App Store updates) via the command line, except it is silent and doesn't ask any questions

# Tweaked by https://github.com/taylorjadin based on https://github.com/mayel based on a script by https://github.com/imwally

# macOS
echo "\n\033[1;31mChecking for macOS updates... \033[0m\n"
sudo softwareupdate -i -a

# homebrew
echo "\n\033[1;31mChecking for homebrew packages... \033[0m\n"
brew update > /dev/null;
new_packages=$(brew outdated --quiet)
num_packages=$(echo $new_packages | wc -w)

if [ $num_packages -gt 0 ]; then
	echo "$num_packages New brew updates available:"
	for package in $new_packages; do
		echo "		* $package";
	done
	brew upgrade && echo "Brew updates done!"
	brew cleanup && echo "Brew cleanup done!"
else
	echo "No brew updates available."
fi

# brew cask (requires https://github.com/buo/homebrew-cask-upgrade)
echo "\n\033[1;31mChecking for homebrew cask packages... \033[0m\n"
brew cu --yes --quiet

# mac app store (requires https://github.com/mas-cli/mas)
echo "\n\033[1;31mChecking for Mac App Store updates... \033[0m"
new_packages=$(mas outdated)
echo $new_packages
num_packages=$(echo $new_packages | wc -w)

if [ $num_packages -gt 0 ]; then
	mas upgrade && echo "Mac App Store updates done!"
else
	echo "No Mac App Store updates available."
fi
