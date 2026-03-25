# 🚀 Mac Terminal - Zsh + P10k + Solarized 安裝指南

## 1. 基礎工具安裝: Homebrew

```bash
# 安裝 Homebrew (如果尚未安裝)
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

設定 Homebrew 路徑，編輯 `~/.zshrc` 加入：

```zsh
# 自動偵測 Homebrew 路徑 (相容 Intel/M 系列)
if [[ -f "/opt/homebrew/bin/brew" ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
elif [[ -f "/usr/local/bin/brew" ]]; then
  eval "$(/usr/local/bin/brew shellenv)"
fi

# 套用 Solarized dircolors (需安裝 coreutils)
if command -v gdircolors >/dev/null 2>&1; then
  eval `gdircolors $HOME/.dir_colors/dircolors`
fi
```

## 2. 安裝 Oh My Zsh

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

## 3. 安裝與設定 Powerlevel10k

```bash
brew install coreutils powerlevel10k
```

將 P10k 連結到 Oh My Zsh 的 custom themes 目錄：

```bash
ln -s $(brew --prefix)/share/powerlevel10k ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
```

編輯 `~/.zshrc`，將 `ZSH_THEME` 改為：

```zsh
ZSH_THEME="powerlevel10k/powerlevel10k"
```

重新載入設定後，執行 `p10k configure` 即可設定介面：

```bash
source ~/.zshrc
p10k configure
```

> [!TIP]
> P10k 的個人設定檔存放在 `~/.p10k.zsh`，會由 Oh My Zsh 自動載入。

## 4. Solarized 配色方案 (三位一體設定)

### 4.1 檔案顏色 (dircolors)

```bash
mkdir -p ~/.dir_colors
curl -L https://raw.githubusercontent.com/seebi/dircolors-solarized/master/dircolors.ansi-dark -o ~/.dir_colors/dircolors
```

> [!NOTE]
> `dircolors` 是用來設定 `LS_COLORS` 環境變數的工具。它可以讓 `ls` (或 `gls`) 指令在顯示檔案與資料夾時，呈現符合 Solarized 配色的視覺效果，解決預設顏色在深色背景下難以辨識的問題。

### 4.2 下載 iTerm2 配色

```bash
# 下載 Dark 版本
curl -O https://raw.githubusercontent.com/altercation/iterm2-colors-solarized/master/Solarized%20Dark.itermcolors

# 下載 Light 版本
curl -O https://raw.githubusercontent.com/altercation/iterm2-colors-solarized/master/Solarized%20Light.itermcolors
```

### 4.3 匯入並套用配色

下載完成後，用以下方式匯入：

按 `Cmd + ,` (即 **iTerm2 -> Settings / Preferences**) > **Profiles > Colors > Color Presets... > Import...**，選取下載的檔案

匯入後，在同一個 **Color Presets...** 選單中選取 **Solarized Dark** 即完成套用。
