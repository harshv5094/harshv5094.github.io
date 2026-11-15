---
title: "Rewriting My Neovim Setup"
date: 2026-11-15T08:36:17+05:30
draft: false
description: So in this blog, I'm talking about why and how I rewritted my entire neovim setup again after using lazyvim for more than 2 years
tocOpen: false
toc: true
isStarred: false
---

Hello 👋, it's been a while since I've written any blogpost here.

So, it's been 5 months, i've kinda been busy with my personal life (as most people should be). I've also been tweaking my dotfiles(mostly cleanup) and removing old files that I don't need anymore. So I've also dropped my old [LazyVim](https://lazyvim.org) setup and rewritten it from scratch with builtin features like `vim.pack` and `vim.lsp`.

So in this blog, I'm gonna be discussing about why I gave up on my old neovim setup config, why I shifted to `vim.pack`, also how **OpenCode** helped me to implement some of my custom utils for my dotfiles.

## Let's talk about my old dotfiles

So, I've been following [craftzdog](https://craftz.dog) (aka Matsuyama Takuya) for the past 4 years. It was him who introduced me to neovim since `v0.5` during my covid college years. I'm still very grateful that I found him on that random day and he introduced me to my life greatest joy of a text editor name neovim.

So, most of my dotfiles changes are inspired from his setup, so when he uploaded the video on his [LazyVim setup](https://youtu.be/fFHlfbKVi30?si=CwQvHmd0zGQIRQWf). I was so exited to try this neovim distro.

So for my oblivious part of audience who don't know what is LazyVim, Let me Explain!

LazyVim is a neovim distro created by tpope of neovim, "[folke](https://github.com/folke)" (I'm not exaggerating, his plugin suite is very robust and solid). It's closer to an tui IDE, but you can customize this for your needs. The main goal of this project was to be feature rich but still be a performant text editor.

In that sense, I can say that LazyVim has achieved it's goal, by being easy to use, community friendly on various stupid question thrown by the user, etc. I was daily driving LazyVim for the past 2 years, and it's been a blast, I love how polish and stylish it looks, how it's just one line away for enabling most of the language/debugger support.

But, I still felt that I've been using someone else dotfiles, it's like sitting behind a taxi driver, who takes you to your destination, but you still misses the feel of driving the car, following your own path, going random street, etc.

So I've decided to rewrite my neovim setup again.

## Creating **`mnvim`**

My first challenge for me to write my new neovim config is where should I keep it? I don't want to create another branch with a bunch of commits, then push it to main dotfiles, as this is gonna be a multi months effort on my free time to migrate my dotfiles.

So, as I was reading neovim documentation, I found out about [`NVIM_APPNAME`](https://neovim.io/doc/user/starting/#_nvim_appname) ,this was my solution for all my dotfiles problem. So without wasting any time, I created a private github repository name **mnvim** and created and alias as shown below

```bash
if [[ ! -d $XDG_CONFIG_DIG/mnvim ]]; then
    alias mnvim="NVIM_APPNAME=mnvim nvim"
fi
```

This helped me a lot, as I have a primary and secondary neovim config so that I can work on my transition at my own pace. It took me 3 to 4 months since I don't have a lot of free time now.

## Moving out of LazyVim

So, my first step was to move my current `LazyVim` setup to my custom setup with `lazy.nvim` as my package manager (I'm gonna talk about `vim.pack` in the later section).

My first roadblock that I faced is **lsp**, I wanted to keep my lsp configuration as simple as possible, luckily I also follow [Maria](https://github.com/MariaSolOs). She is in the core developer team of neovim. So, I dive into her [dotfiles](https://github.com/MariaSolOs/dotfiles) and found a very good implementation of autocmd for enabling lsp based on `BufRead` events. I'm linking that implementation [here](https://github.com/MariaSolOs/dotfiles/blob/0c5e0cd3ac699bf3eba3e5a89d19c9447b3de096/.config/nvim/lua/lsp.lua#L259), you can go there and read it if you're curious about it.

TL;DR, it reads files from `lsp/<lsp-name>.lua`, and formats the file name into just `<lsp-name>` then use that name to enable lsp server using `vim.lsp.enable(<lsp-name>)`. That way you don't have to enable a bunch of unused `lsp` servers at once, and it automatically starts itself based on the config specified in `lsp/` directory.

After setting up lsp, the rest of the process was quite simple, as you alredy know by name, `lazy.nvim` was also the plugin manager for LazyVim. So shifting rest of my plugins was a cake-walk.

I started using my new custom setup for like more than a month, and I was feeling comfortable using this setup, so I decide to make my next move, i.e. moving to `vim.pack`.

## Moving my setup again, this time to `vim.pack`

So, neovim introduced [`vim.pack`](https://neovim.io/doc/user/pack/#vim.pack) from `v0.12`, it's a builtin package manager written by [mini.nvim](https://github.com/nvim-mini/mini.nvim) author [echasnovski](https://echasnovski.com). This module perfectly reflects mini.nvim philosophy, minimal but functional. It's still marked as in experimental phase, but, it's stable enough to be use as a daily driver feature.

So, anyone who used `lazy.nvim` knows that the plugin structure is returning a table. See the following snippet as example.

```lua
return {
    {
        "folke/tokyonight.nvim",
        opts = {}
    }
}
```

It also has a `build` option, which leads to building plugins with `make` like [telescope-fzf-native.nvim](https://github.com/nvim-telescope/telescope-fzf-native.nvim). This was my second bottleneck I was facing. I was searching the whole internet for days for the solution as how I can fix this, granted AI could solve this, but the problem is `vim.pack` is a new feature at the time of release so there wasn't any reference material for LLM's to generate a solution for.

So, I took my problem to matrix neovim public group for discussion, and the lead maintainer ["Justin M Keys"](https://github.com/jsutinmk) replied to my problem, he told me that `vim.pack` has two events name `PackChanged` and `PackChangedPre` which could help me figuring out this solution. I also found this [github discussion](https://github.com/nvim-telescope/telescope.nvim/discussions/3652) which was very helpful for me to implement this.

## Post `vim.pack` stage

So after, moving my whole setup to `vim.pack`, I started modifying and optimizing it for my needs.

I removed some of the plugins like `lualine.nvim`, `gitsigns.nvim`, `snacks.nvim`. and replace them with [`mini.nvim`](https://github.com/nvim-mini/mini.nvim). This plugin fulfills the basic needs of every neovim plugins that I mentioned above. For a while I was using [toggleterm.nvim](https://github.com/akinsho/toggleterm.nvim) and [lazygit.nvim](https://github.com/kdheepak/lazygit.nvim), I was quite happy with it, but I still wanted to reduce my plugin footprint between 40 to 50 or below 40 plugins. So I need to find another way about it.

So, I decided, "Why not create a utility module for this operation!". So I fired my trusted [opencode](https://opencode.ai), and started buiding two modules name `toggle_terminal` and `toggle_lazygit`, and since I know how neovim buffer system works, it was quite an easy implementation.

As so it happens, Takuya also dropped his new neovim setup with his markdown based MCP [dicsussion](https://www.devas.life/effective-neovim-setup-for-agentic-coding-towards-2027/), which made working with opencode a whole lot easier. It actually give me more control on AI's output, and this works surprisingly well.

So after doing all those changes my current setup structure looks something like this.

```
init.lua                 -> entry point, loads config.base, also enables vim.loader based on version number
lua/
  config/
    base.lua             -> bootstraps my config files and imports plugin specs
    options.lua          -> vim options
    keymaps.lua          -> global + LSP keymaps
    autocmds.lua         -> autocommands (incl. LSP auto-enable)
    diagnostics.lua      -> vim.diagnostic config + virtual text toggle
    pack.lua             -> Custom nvim_user_commands for `vim.pack`
  plugins/               -> plugin specs (one file per concern: lsp, ui, format, ...)
  utils/                 -> small helper modules
lsp/                     -> per-server LSP configs (vim.lsp.Config), auto-loaded
```

I still have some future changes, but now my full transition for neovim is completed. So I [merge](https://github.com/harshv5094/dotfiles/pull/2) those changes in my main dotfiles. I'm liking this setup very much, it feels like that this is **My neovim configuration**, not using someone else dotfiles.

So, that's it for the post, if you want to chat about it, my [mail](mailto:harshv5094@gmail.com) box always open, see you next time. Bye! 👋

~ Harsh Vyapari ✌️
