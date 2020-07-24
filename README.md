# node.operator.mainnet

    sudo apt update -y
    sudo apt upgrade -y
    sudo apt install bc -y
    git clone https://github.com/thesongofmoses/node.operator.mainnet.git
    mv node.operator.mainnet node.operator
    cd node.operator/scripts && . ~/node.operator/configs/env.sh
    cd ~/node.operator/configs
    cat bashrc > ~/.bashrc && source ~/.bashrc
    crontab ~/node.operator/configs/crontab
