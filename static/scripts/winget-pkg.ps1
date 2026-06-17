# List of packages
$packages = @(
  # CLI and TUI Tools
  "Git.Git",
  "GitHub.cli ",
  "GnuPG.GnuPG",
  "GnuPG.Gpg4Win",
  "7zip.7zip",
  "sharkdp.fd",
  "sharkdp.bat",
  "topgrade-rs.topgrade",
  "eza-community.eza",
  "junegunn.fzf",
  "BurntSushi.ripgrep.MSVC",
  "cURL.cURL"
  "ajeetdsouza.zoxide",
  "Starship.Starship",

  # Sharing
  "LocalSend.LocalSend",

  # Browser
  "Mozilla.Firefox",

  # Notebook app
  "Obsidian.Obsidian",

  # Media
  "VideoLAN.VLC",
  "yt-dlp.yt-dlp",

  # Download Manager
  "SoftDeluxe.FreeDownloadManager"

  # Neovim and its dependencies
  "Neovim.Neovim",
  "tree-sitter.tree-sitter-cli",

  # Programming Languages
  "OpenJS.NodeJS.LTS",
  "GoLang.Go"
)

foreach ($pkg in $packages)
{
  Write-Host "Installing $pkg..." -ForegroundColor Cyan
  winget install --id $pkg --silent --accept-package-agreements
}
