# Valorium

Hey, you've stumbled across the repository that contains my personal configuration files for my computers running [NixOS].
I put this out here both for my convenience of having version history for things, but also on the off chance that somebody else finds this a helpful reference for setting up their own system.

> [!WARNING]
> At any given point this repo is in constant flux as it is my personal config, and I *love* tweaking things.
> That and Nix as a language and system is still evolving and changing, so things may just change and I forget to update them here.
>
> DO **NOT** tell nix to build and switch to my flake. It **WILL** causes problems and damage.
> My config is very opinionated and assumes the entirety of `~/.config` is declarative and can be wiped with every rebuild.
> This means your personal settings **WILL** be irreversibly lost by building this flake.