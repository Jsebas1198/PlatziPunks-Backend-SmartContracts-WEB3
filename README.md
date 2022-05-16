# PlatziPunks Nft Marketplace

**Link to project:** https://fancy-llama-17fe9b.netlify.app/

![platzipunks](https://user-images.githubusercontent.com/96799477/168430401-c0fc7115-17ee-4f1d-ab3c-c05e2395d625.png)

![platzipunks2](https://user-images.githubusercontent.com/96799477/168430419-9204803f-5ddf-4a7f-afd8-a31360a6bc57.png)

![platzipunks3](https://user-images.githubusercontent.com/96799477/168448599-028130c3-8fb2-43a7-94e0-94ce4be7a6e9.png)

## How It's Made:

**Tech used:** JavaScript, React, Solidity, Chakra-ui, Web3, Web3-react, Hardhat 

This project is an Nft marketplace where any wallet that is connected to the rinkeby network can buy PlatziPunks, the platzipunks nfts are made by a random online generator of avatars (https://getavataaars.com/) and uses an deterministic pseudo random function to generate their DNA because solidity is a deterministic language, that means that if this project is deployed in production it would be neccesary to use an oracle and generate a random function for the DNA, the URL to generate the avatars must be encoded in base64 because it will be built within blockchain, this means that the metadata will be inside blockchain and it can't be modified. For the UI this porject uses chakra-ui, We3js and web3-react to interact with the smart contract. 

## Optimizations

This projects is not responsive, so the UI and UX could be better.  

## Lessons Learned:

I  learn how to use hardhat to test and deploy smart contracts, how to use web3js and web3-react to interact with the smart contract and to detect if an address is connected, how to use chakra-ui and upgrade my react skills.

## Examples:
Take a look at these couple examples that I have in my own portfolio:

**CryptoBirz-Marketplace:** https://github.com/Jsebas1198/CryptoBirz-Marketplace

**Wave-Portal-Backend:** https://github.com/Jsebas1198/Wave-Portal-Backend-WEB3

**Wave-Portal-Interface:** https://github.com/Jsebas1198/Wave-Portal-Interface-WEB3
