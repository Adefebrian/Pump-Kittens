//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;
import "@openzeppelin/contracts/token/ERC721/presets/ERC721PresetMinterPauserAutoId.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract Umans is ERC721PresetMinterPauserAutoId, Ownable {
  using Counters for Counters.Counter;

  uint public reservePrice = 0.0001 ether;
  uint public currentPrice;
  uint public previousPrice;
  uint public addPriceRate = 400;       // 4%
  uint public constant MAX_UMANS = 5;
  Counters.Counter private _tokenIdTracker;
  uint public _buyNftCount;

  constructor() ERC721PresetMinterPauserAutoId("TESTUMAN", "TUMAN", "http://localhost:3000/") {
      currentPrice = reservePrice;
      previousPrice = 0;
  }

  function buyUman() public payable {
    require(msg.value == currentPrice);
    require(_tokenIdTracker.current() < MAX_UMANS);
    _mint(_msgSender(), _tokenIdTracker.current());
    _tokenIdTracker.increment();
    
    previousPrice = currentPrice;
    currentPrice = previousPrice + previousPrice * addPriceRate / 10000;
  }
  
  function setPrice(uint _price) external onlyOwner() {
    currentPrice = _price;
  }

  function getPrice() external view returns(uint) {
    return currentPrice;
  }
  
  function setAddPriceRate(uint _rate) external onlyOwner() {
    addPriceRate = _rate;
  }

  function getAddPriceRate() external view returns(uint) {
    return addPriceRate;
  }

  function withdrawAll() public payable onlyOwner {
    require(payable(msg.sender).send(address(this).balance));
  }  
}