const deploy = async() =>{
//el deployer nos permite desplegar smart contracts a la red que tengmos configurada
    const [deployer] = await ethers.getSigners();

    //con deployer.address consultamos cual esla cuenta que esta despegando para poder consultarlo despues en un 
    //explorador de bloques
    console.log('the contract is being deployed with the account', deployer.address);


    //traemos  la informacion para desplegar los metodos y desplegar el contrato, debe de tener el nombre del 
    //smart  contract
    const PlatziPunks = await ethers.getContractFactory("PlatziPunks");

    //le anadimos la cantidad  desada de platzipunks porque  recibe como parmetro el maxSupply
    const deployed = await PlatziPunks.deploy(10000);


    //deployed.address la direcion donde se anadio dentro de la red
    console.log("PlatziPunks is deployed at:  ", deployed.address)

}

deploy().then(()=> process.exit(0)).catch(error=> {
    console.log(error);
    process.exit(1);
});

