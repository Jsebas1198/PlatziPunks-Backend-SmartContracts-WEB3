// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "./Base64.sol";
import "./PlatziPunksDNA.sol";
import "@openzeppelin/contracts/utils/Strings.sol";

//Empieza el contrato
contract PlatziPunks is ERC721,ERC721Enumerable, PlatziPunksDNA{

//Nos lo dice  la documentacion de counter.sol, Counters.Counter es el tipo de dato que utilizaremos
using Counters for Counters.Counter;

//Le indicamos a solisity que utilice la libreria strings para todos los  enteros osea los uint156

using Strings for uint256;

//Definimos nuestra variable con el tipo de dato
Counters.Counter private _idCounter;

//Definimos la variable para el maxsupply, de esta manera hay rarezas en los NFTs
uint256 public maxSupply;

//este mapping nos va a servir para apuntar desde un tokenid hasta el ADN
mapping(uint256 => uint256 ) public tokenDNA;

//definimos el contructor para el nombre y el simbolo
constructor (uint256 _maxSupply) ERC721("PlatziPunks","PLPKS"){
maxSupply= _maxSupply;

}

//Creamos nuestra funcion de mint para crear los nfts
function mint() public {

//esta funcion ya la traemos de la documentacion de OpenZeppelin
    uint256 current=_idCounter.current();
     require(current<maxSupply,"No more PlatziPunks");

     tokenDNA[current] = deterministicPseudoRandomDNA( current,  msg.sender);
    _safeMint( msg.sender,  current);
    _idCounter.increment();
}

//Funcion que ya esta creada en el ERC721 para ubicar el dominio donde esta ubicado el NFT
function _baseURI() internal pure override returns (string memory){
    //debe  de retornar el URL del API
    return "https://avataaars.io/";
}

//Los segundos componenetes de la imagen son los parametros que vamos anadiendo con esta funcion
function _paramsURI(uint256 _dna) internal view returns(string memory){
    string memory params;
    {   
        
        params = string(abi.encodePacked(
                 "accesoriesType=",
                 _getAccesoriesType(_dna),
                "&clotheColor=",
                _getClotheColor(_dna),
                "&clotheType=",
                getClotheType(_dna),
                "&eyeType=",
                getEyeType(_dna),
                "&eyebrowType=",
                getEyeBrowType(_dna),
                "&facialHairColor=",
                getFacialHairColor(_dna),
                "&facialHairType=",
                getFacialHairType(_dna),
                "&hairColor=",
                getHairColor(_dna),
                "&hatColor=",
                getHatColor(_dna),
                "&graphicType=",
                getGraphicType(_dna),
                "&mouthType=",
                getMouthType(_dna),
                "&skinColor=",
                getSkinColor(_dna)

         ));
    }
    return string(abi.encodePacked(params, "&topType=",getTopType(_dna)));
                
                
}

//una funcion que retorne la imagen una vez que recibe el ADN

function imageByDNA(uint256 _dna) public view returns(string memory){
    string memory baseURI = _baseURI();
    string memory paramsURI = _paramsURI(_dna);

    return string(abi.encodePacked(baseURI,"?",paramsURI ));
}

//Creamos la funcion tokenURI para  traer la metadata con una URL que la convierte a un archivo JSON

function tokenURI(uint256 tokenId) public view override returns(string memory){

require( _exists(tokenId) , 
"ERC 721 Metadata: URI query for nonexistent token"
);

uint256 dna=tokenDNA[tokenId];

string memory image = imageByDNA(dna);

//Base64.encode pasa de tipo byte a base64
string memory jsonURI = Base64.encode(
        abi.encodePacked(
            //Apertura de nuestro objeto  json
            '{ "name": "PlatziPunks #',
            tokenId.toString(),
            //siguiente parametro, otro string para completar la funcionalidad
            '", "description": "Unique PLatziPunks of the multiverse to start my carreer on Dapps" , "image": "',
           image,
            '" }'
        ) 
    );


return string(abi.encodePacked("data:application/json;base64,", jsonURI));
}


//override required
function _beforeTokenTransfer(address from, address to, uint256 tokenId)
        internal
        override(ERC721, ERC721Enumerable)
    {
        super._beforeTokenTransfer(from, to, tokenId);
    }

    function supportsInterface(bytes4 interfaceId)
        public
        view
        override(ERC721, ERC721Enumerable)
        returns (bool)
    {
        return super.supportsInterface(interfaceId);
    }

}