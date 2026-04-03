#!/bin/bash

echo "[+] Instalando dependências base..."
sudo dnf install -y git golang python3 python3-pip python3-venv gcc make

echo "[+] Configurando PATH do Go..."
mkdir -p "$HOME/go/bin"
export PATH="$PATH:$HOME/go/bin"

echo "[+] Instalando ferramentas Go..."
go install github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest
go install github.com/projectdiscovery/httpx/cmd/httpx@latest
go install github.com/tomnomnom/waybackurls@latest
go install github.com/lc/gau/v2/cmd/gau@latest
go install github.com/projectdiscovery/katana/cmd/katana@latest
go install github.com/tomnomnom/gf@latest
go install github.com/tomnomnom/qsreplace@latest
go install github.com/hahwul/dalfox/v2@latest
go install github.com/projectdiscovery/nuclei/v3/cmd/nuclei@latest
go install github.com/projectdiscovery/naabu/v2/cmd/naabu@latest
go install github.com/ffuf/ffuf@latest
go install github.com/projectdiscovery/interactsh/cmd/interactsh-client@latest
go install github.com/projectdiscovery/subzy@latest
go install github.com/tomnomnom/assetfinder@latest
go install github.com/trufflesecurity/trufflehog/v3@latest

echo "[+] Instalando ferramentas Python..."
pip install --user uro arjun wafw00f

echo "[+] Instalando ghauri em venv..."
python3 -m venv ~/venvs/ghauri
source ~/venvs/ghauri/bin/activate
pip install ghauri
deactivate

echo "[+] Instalando sqlmap..."
sudo dnf install -y sqlmap || (
    git clone --depth 1 https://github.com/sqlmapproject/sqlmap.git ~/sqlmap &&
    sudo ln -s ~/sqlmap/sqlmap.py /usr/local/bin/sqlmap &&
    sudo chmod +x ~/sqlmap/sqlmap.py
)

echo "[+] Baixando SecLists..."
git clone --depth 1 https://github.com/danielmiessler/SecLists.git ~/SecLists

echo "[✔] Tudo instalado!"
