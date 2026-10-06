# homebrew-tap

Homebrew formulae for my terminal tools, for macOS and Linux.

```bash
brew tap huseynteymurzade28/tap
brew install pokeductor
```

or in one step, `brew install huseynteymurzade28/tap/<formula>`.

| Formula | What it is | Installs |
|---|---|---|
| [`pokeductor`](https://github.com/Huseynteymurzade28/pokeductor) | Terminal Pokedex and evolution analyzer | Prebuilt binary, completions, man page |
| [`tuiba`](https://github.com/Huseynteymurzade28/tuiba) | Game Boy Advance emulator in the terminal | Prebuilt binary |
| [`flerp`](https://github.com/Huseynteymurzade28/flerp) | TUI for exploring and analyzing text, PDFs and images | Built from source with Rust |
| [`kizamu`](https://github.com/Huseynteymurzade28/Kizamu) | Terminal typing test: WPM and accuracy | Built from source with Zig 0.16 |

`pokeductor` is written by its own release workflow on every tagged release,
so its formula is not edited here by hand. The others are updated here when a
new version is released. Every formula is installed, tested and audited on
macOS and Linux for each pull request.
