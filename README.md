# node.operator.mainnet

      mv node.operator.mainnet node.operator
    cd node.operator/scripts && . ~/node.operator/configs/env.sh main
    chmod +x -R ${NODE_OPERATOR_SCRIPTS_DIR}
    cd ~/node.operator/configs
    cat bashrc > ~/.bashrc && source ~/.bashrc
    crontab ~/node.operator/configs/crontab

# node.operator

These scripts are created to help node operators. All the paths used are the default locations of https://github.com/tonlabs/main.ton.dev.

1. INITIAL INSTALL

Install dependencies and download/setup repo
	
	sudo apt install -y git && cd && rm -rf ~/node.operator && git clone https://github.com/thesongofmoses/node.operator.mainnet.git && chmod +x -R ~/node.operator.mainnet/scripts && mv ~/node.operator.mainnet ~/node.operator && cat ~/node.operator/configs/bashrc.config > ~/.bashrc && source ~/.bashrc && sudo apt install bc

Import crontab after completion of sync

	crontab ~/node.operator/configs/crontab.config

2. UPDATE

Update and import crontab
	
	cd && rm -rf moses.update && mkdir moses.update && cd moses.update && git clone https://github.com/thesongofmoses/node.operator.mainnet.git && mv node.operator.mainnet node.operator && cd node.operator/scripts  && rm -rf ~/node.operator/scripts && mv ~/moses.update/node.operator/scripts ~/node.operator/scripts && mv ~/moses.update/node.operator/configs/bashrc.config ~/node.operator/configs/bashrc.config && mv ~/moses.update/node.operator/configs/env.sh ~/node.operator/configs/env.sh && cd ~/node.operator/scripts && . ~/node.operator/configs/env.sh main && cat ~/node.operator/configs/bashrc.config > ~/.bashrc && source ~/.bashrc && rm -rf ~/moses.update && cd && chmod +x -R ~/node.operator/scripts && crontab ~/node.operator/configs/crontab.config

Update but NOT import crontab
	
	cd && rm -rf moses.update && mkdir moses.update && cd moses.update && git clone https://github.com/thesongofmoses/node.operator.mainnet.git && mv node.operator.mainnet node.operator && cd node.operator/scripts  && rm -rf ~/node.operator/scripts && mv ~/moses.update/node.operator/scripts ~/node.operator/scripts && mv ~/moses.update/node.operator/configs/bashrc.config ~/node.operator/configs/bashrc.config && mv ~/moses.update/node.operator/configs/env.sh ~/node.operator/configs/env.sh && cd ~/node.operator/scripts && . ~/node.operator/configs/env.sh main && cat ~/node.operator/configs/bashrc.config > ~/.bashrc && source ~/.bashrc && rm -rf ~/moses.update && cd && chmod +x -R ~/node.operator/scripts
