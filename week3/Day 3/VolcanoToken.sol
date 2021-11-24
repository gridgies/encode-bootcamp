//SPDX-License-Identifier: UNLICENSED
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

pragma solidity ^0.8.0;

contract VolcanoToken is ERC721, Ownable {
    constructor() ERC721("VolcanoToken", "VLT") { }
    
    uint256 tokenId;
    
    struct Token {
        uint256 timestamp; 
        uint256 tokenId;
        string tokenURI;
    }
    
    mapping(address => Token[]) public ownerToTokens;
    
    function minting(uint _tokenId) public {
        Token memory newToken = Token(block.timestamp, _tokenId, "random");
        ownerToTokens[msg.sender].push(newToken);
        _tokenId++;
    }
}