pragma solidity ^0.4.24;

import "../node_modules/openzeppelin-solidity/contracts/token/ERC721/ERC721Full.sol";
import "../node_modules/openzeppelin-solidity/contracts/token/ERC721/ERC721Mintable.sol";
import "../node_modules/openzeppelin-solidity/contracts/token/ERC721/ERC721MetadataMintable.sol";
import "../node_modules/openzeppelin-solidity/contracts/token/ERC721/ERC721Burnable.sol";
import "../node_modules/openzeppelin-solidity/contracts/ownership/Ownable.sol";


contract CryptoLand
is ERC721Full, ERC721Mintable, ERC721MetadataMintable, ERC721Burnable, Ownable {

  event MintManyToken(
    address indexed to,
    uint256 howMany,
    uint256 tokenIdFrom,
    uint256 tokenIdTo
  );

  constructor()
    ERC721Mintable()
    ERC721Full("CryptoLand.gg", "CL")
    public
  {


  }


  function mintManyWithTokenUri(
    address to,
    uint256 howMany,
    string tokenURI
  )
    public
    onlyMinter
    returns (bool)
  {
    uint256 totalNum = totalSupply();

    for (uint tokenId = totalNum; tokenId < (howMany + totalNum); tokenId++) {
      _mint(to, tokenId);
      _setTokenURI(tokenId, concat(tokenURI, uintToString(tokenId)));
    }

    emit MintManyToken(to, howMany, totalNum, tokenId);

    return true;
  }

  function concat(string _a, string _b) constant returns (string){
    bytes memory bytes_a = bytes(_a);
    bytes memory bytes_b = bytes(_b);
    string memory length_ab = new string(bytes_a.length + bytes_b.length);
    bytes memory bytes_c = bytes(length_ab);
    uint k = 0;
    for (uint i = 0; i < bytes_a.length; i++) bytes_c[k++] = bytes_a[i];
    for (i = 0; i < bytes_b.length; i++) bytes_c[k++] = bytes_b[i];
    return string(bytes_c);
  }

  function uintToString(uint v) constant returns (string) {
    uint maxlength = 100;
    bytes memory reversed = new bytes(maxlength);
    uint i = 0;
    while (v != 0) {
      uint remainder = v % 10;
      v = v / 10;
      reversed[i++] = byte(48 + remainder);
    }
    bytes memory s = new bytes(i + 1);
    for (uint j = 0; j <= i; j++) {
      s[j] = reversed[i - j];
    }
    return string(s);
  }

  function setTokenURI(uint256 tokenId, string uri)
    public
    onlyMinter
    returns (bool)
  {
    _setTokenURI(tokenId, uri);

    return true;
  }
}