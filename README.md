# Haskell Drill

## 概要

### 目的

### 前提

| ソフトウェア | バージョン | 備考 |
| :----------- | :--------- | :--- |
| haskell      | 8.10.7     |      |

## 構成

- [構築](#構築)
- [配置](#配置)
- [運用](#運用)
- [開発](#開発)

## 詳細

### 構築

```
Set-ExecutionPolicy Bypass -Scope Process -Force;[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; try { Invoke-Command -ScriptBlock ([ScriptBlock]::Create((Invoke-WebRequest https://www.haskell.org/ghcup/sh/bootstrap-haskell.ps1 -UseBasicParsing))) -ArgumentList $true } catch { Write-Error $_ }
stack setup
stack new haskell-drill
stack update
stack install haskell-dap ghci-dap haskell-debug-adapter
stack install hspec hspec-discover
```

**[⬆ back to top](#構成)**

### 配置

**[⬆ back to top](#構成)**

### 運用

**[⬆ back to top](#構成)**

### 開発

**[⬆ back to top](#構成)**

## 参照

- [GHCup](https://www.haskell.org/ghcup/)
- [Stack を使った Haskell のインストール](https://qiita.com/KNaito/items/98debf322e08c706fc90)
- [HSpec と ghcid で Haskell の快適な TDD 環境を構築する](https://qiita.com/spinylobster/items/268d2053b711f1ccc415)
- [Haskell hspec 入門](https://qiita.com/satosystems/items/4a7b6cc007f885a6de90)
- [Haskell GHCi Debug Adapter Phoityne](https://marketplace.visualstudio.com/items?itemName=phoityne.phoityne-vscode)
