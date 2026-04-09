# 🚀 Linux Terminal - Zsh + P10k + Solarized 安裝指南

本指南提供 Linux (Ubuntu) 環境的終端機設定，包含基礎工具安裝、Oh My Zsh、Powerlevel10k 主題以及 Solarized 配色方案。

## 0. 前置作業：安裝字體 (Fonts)

在開始安裝主題之前，強烈建議先安裝 **Nerd Fonts**，否則 Powerlevel10k 的圖示將無法正常顯示。

- **建議字體**：[MesloLGS NF](https://github.com/romkatv/dotfiles-public/tree/master/.local/share/fonts/NerdFonts) (P10k 官方推薦)
- **安裝方式**：下載 `.ttf` 檔案後，在 Ubuntu 中連點兩下安裝，或放入 `~/.local/share/fonts/` 目錄中。
- **設定**：安裝後，需在 Terminal 的 **Preferences > Profiles > Text > Custom font** 選取該字體。

> [!NOTE]
> 如果你是從 Mac 透過 SSH 連線到遠端 Ubuntu，伺服器端不需要安裝字體。你只需要確保本地端的 Mac (iTerm2) 已安裝並選用 Nerd Font 即可正常顯示圖示。

## 1. 基礎工具安裝: `APT`

在 Linux 上，我們直接使用系統內建的 `apt` 來安裝必要的基礎組件。

```bash
# 更新套件清單並安裝
sudo apt update
sudo apt install -y zsh curl git coreutils uuidgen dconf-cli
```

## 2. 安裝 Oh My Zsh

Oh My Zsh 的安裝腳本會自動備份舊的 `~/.zshrc` 為 `~/.zshrc.pre-oh-my-zsh`。

```bash
# 使用單行指令自動安裝 (不中斷模式)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
```

## 3. 安裝與設定 Powerlevel10k 主題

將主題 Repository 直接 Clone 到 Oh My Zsh 的自訂主題目錄中。

```bash
# Clone 到 ZSH_CUSTOM 目錄
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
```

編輯 `~/.zshrc`，將主題設定修改為：

```zsh
ZSH_THEME="powerlevel10k/powerlevel10k"
```

安裝完成後，開啟新分頁或執行 `zsh` 即可進入自動設定精靈：

```bash
zsh
# 若需手動重新設定，可執行：
# p10k configure
```

> [!TIP]
> P10k 的個人設定檔存放在 `~/.p10k.zsh`，會由 Oh My Zsh 自動載入。

## 4. Solarized 配色方案 (三位一體設定)

### 4.1 檔案顏色 (`dircolors`)

Linux 內建 `dircolors` 指令，我們下載配色定義檔後在 `.zshrc` 中載入。

```bash
mkdir -p ~/.dir_colors
curl -L https://raw.githubusercontent.com/seebi/dircolors-solarized/master/dircolors.ansi-dark -o ~/.dir_colors/dircolors
```

> [!NOTE]
> `dircolors` 是用來設定 `LS_COLORS` 環境變數的工具。它可以讓 `ls` 指令在顯示檔案與資料夾時，呈現符合 Solarized 配色的視覺效果，解決預設顏色在深色背景下難以辨識的問題。

在 `~/.zshrc` 加入以下內容：

```zsh
if [ -f ~/.dir_colors/dircolors ]; then
    eval $(dircolors ~/.dir_colors/dircolors)
fi
```

### 4.2 GNOME Terminal 視窗配色

使用 `gnome-terminal-colors-solarized` 解決背景與 ANSI 色階不協調的問題。

```bash
# 下載並執行自動安裝腳本 (會自動偵測或建立 Solarized Profile)
git clone https://github.com/aruhier/gnome-terminal-colors-solarized.git /tmp/gnome-terminal-colors-solarized
cd /tmp/gnome-terminal-colors-solarized
./set_dark.sh
```

## 5. 環境變數合併 (重要)

安裝 Oh My Zsh 後，請務必將原本 `~/.bashrc` 或舊版 `~/.zshrc` 中的設定貼回新的 `~/.zshrc` 底部，尤其是：

- **Conda** 初始化區塊
- **CUDA / NVIDIA** 環境變數
- **PATH** 調整項目（如 `Bun`, `Node.js` 等）

> [!IMPORTANT]
> 建議將環境變數放在 `source $ZSH/oh-my-zsh.sh` 之後，以確保不會被主題或外掛程式覆蓋。
