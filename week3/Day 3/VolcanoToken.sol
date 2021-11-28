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
    
    function mint(uint _tokenId) public {
        string memory lookupURI = tokenURI(_tokenId);
        Token memory newToken = Token(block.timestamp, _tokenId, lookupURI);
        ownerToTokens[msg.sender].push(newToken);
        _tokenId++;
    }
    
    function burn(uint _tokenId) public onlyOwner {
        require(msg.sender == ownerOf(_tokenId), "Only owner of token can burn token");
        _burn(_tokenId);
        removeBurnedIds(_tokenId);
    }
    
    function removeBurnedIds(uint _burntId) internal {
        uint arrayLength = ownerToTokens[msg.sender].length;
        for(uint i = 0; i < arrayLength; i++) {
            if (ownerToTokens[msg.sender][0].tokenId == _burntId) {
                delete ownerToTokens[msg.sender][0];
            }
        }
    }

    function deleteFromMapping() internal {
        

    }
}