require("@nomiclabs/hardhat-waffle");

//el .config busca  por defecto el .env de la carpeta
require('dotenv').config()

//traemos los valores de  .env para que no se muestre en el archivo de git
const projectId= process.env.INFURA_PROJECT_ID;
const  privateKey= process.env.DEPLOYER_SIGNER_PRIVATE_KEY;
module.exports = {
  solidity: "0.8.4",
//Si escribimos mainnet dentro de networks podemos administrar mas de una red. networks:{mainnet{...
    networks:{
      rinkeby:{
      url: `https://rinkeby.infura.io/v3/${projectId}`,

      //Debemos de pasarle que cueta va a firmar la transaccion
      //Es un arreglo porque pueden haber mas de una cuenta
      accounts: [

        //Acordarse siempre poner el 0x adelante
        //npx hardhat run scripts/sample-script.js --network rinkeby para subirlo a la red de prueba
        privateKey
      ]
      }
    }
};
