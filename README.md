# node.operator

These scripts are created to help node operators. All the paths used are the default locations of https://github.com/tonlabs/main.ton.dev.

1. INITIAL INSTALL

Install dependencies and download/setup repo
	
	sudo apt install -y git && cd && rm -rf ~/node.operator && git clone https://github.com/thesongofmoses/node.operator.mainnet.git && chmod +x -R ~/node.operator.mainnet/scripts && mv ~/node.operator.mainnet ~/node.operator && cat ~/node.operator/configs/bashrc.config > ~/.bashrc && source ~/.bashrc && sudo apt install bc && cd ~/node.operator/scripts && . ~/node.operator/configs/env.sh && ./validatorBuild.sh

Import crontab after completion of sync

	crontab ~/node.operator/configs/crontab.config

2. UPDATE

Update and import crontab
	
	

Update but NOT import crontab
	
	
