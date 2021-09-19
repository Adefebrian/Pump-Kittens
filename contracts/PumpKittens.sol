//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;
import "@openzeppelin/contracts/token/ERC721/presets/ERC721PresetMinterPauserAutoId.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract PumpKittens is ERC721PresetMinterPauserAutoId, Ownable {
    using Counters for Counters.Counter;
    
    uint public reservePrice = 150 ether;
    uint public currentPrice;
    uint public previousPrice;
    uint public addPriceRate = 300;       // 3%
    uint public constant MAX_PUMPKITTENS = 50;
    Counters.Counter private _tokenIdTracker;
    
    mapping(uint => bool) _tokenExists;
    mapping(uint => uint256) _tokenPrice;

    constructor() ERC721PresetMinterPauserAutoId("PumpKittens", "PK", "https://gateway.pinata.cloud/ipfs/QmXJbmsHDSN4Q7hNqmEEJoEY4RtoSzMQ1f3jjKafjDqyTB/") {
        currentPrice = reservePrice;
        previousPrice = 0;
    }
    
    function buyPumpKittens() public payable {
        require(msg.value == currentPrice);
        require(_tokenIdTracker.current() <= MAX_PUMPKITTENS);
        
        uint256 tokenId = 0;
        _tokenExists[tokenId] = true;
        
        uint index = 0;
        while (_tokenExists[tokenId])
        {
            tokenId = uint256(keccak256(abi.encodePacked(block.difficulty, block.timestamp, _tokenIdTracker.current() + index))) % 7 + 1;
            
            index ++;
        }
        
        _tokenIdTracker.increment();

        _mint(_msgSender(), tokenId);
        
        _tokenExists[tokenId] = true;
        _tokenPrice[tokenId] = currentPrice;
        
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
    
    function getTokenIdsOfOwner(address account) public view 
        returns(uint[] memory tokenIds, uint256[] memory priceOfTokenIds, string[] memory tokenURIs)
    {
        uint balance = balanceOf(account);
        tokenIds = new uint[](balance);
        priceOfTokenIds = new uint[](balance);
        tokenURIs = new string[](balance);
        
        for (uint i=0; i<balance; i++)
        {
            tokenIds[i] = tokenOfOwnerByIndex(account, i);
            priceOfTokenIds[i] = _tokenPrice[tokenIds[i]];
            tokenURIs[i] = tokenURI(tokenIds[i]);
        }
    }
}