# Valorium

Hey, you've stumbled across the repository that contains my personal configuration files for my computers running [NixOS].

> [!WARNING]
> At any given point this repo is in constant flux as it is my personal config, and I *love* tweaking things.
> That and Nix as a language and system is still evolving and changing, so things may just change and I forget to update them here.
>
> Just remember that like with all pieces of software, the code is the most update to date form of documentation.

---

# Usage

I package a few things in this repo that others have packaged and at times things that are unique.
If you want to use/steal anything, rather than copy pasting, just add a reference to my flake as an input to your own `flake.nix`:

```nix
{
  # Assumes you already have `nixpkgs` as an input.
  inputs.valorium.url = "github:naharie/config";
  inputs.valorium.inputs.nixpkgs.follows = "nixpkgs";
}
```

This flake exports nixosModules and homeManagerModules, though at any given time one or both of those may be empty, so track specific commits if you really need to.

---

# Library

If you would like to use them, I've packaged all of my personal utility functions (all the stuff in `lib`) into a single wrapper.
Just use `inputs.valorium.lib` (assuming `valorium` is what you called the input).

As an example, just use a basic `let` and name it something like `vlib`:
```nix
let vlib = inputs.valorium.lib; in
# Your code here...
```

If you really want to have a single lib set to use, just merge the sets as usual:
```nix
let lib = nixpkgs.lib // inputs.valorium.lib;
# Your code here...
```

---

# Packages

For packages just use them as you would from any other flake.
If you aren't sure what that means, just something like the following:
```nix
inputs.valorium.packages.x86_64-linux.package-name
```

> [!NOTE]
> So far I run Nix on one machine and so only have to worry about that one architecture, so even though some packages are architecture agnostic, I only export for the one system I test on.
> If you need or want a package for another system, please open an issue or email me, and I can update my flake to export it for your system.

---

# Building and updating the system

For my and your convenience, I've provided a trivial script called `nix-rebuild-switch` to build a new config and switch to it.
It specifies that a flake is being used and specifies to build the output for the system's hostname.
Only really useful for building a new system or pure laziness (fewer characters to type out when updating).

---

# Troubleshooting

If you encounter any kind of errors with the provided modules or packages, please do open an issue, so I and others can benefit from making things more bullet proof and flexible.
To be clear, though, no support will be provided for anything within `hosts` or `users` or code derived from them as they are meant solely for my use and your inspiration, but not necessarily your reuse.

---

[NixOS]: https://nixos.org/