//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;
import "@openzeppelin/contracts/token/ERC721/presets/ERC721PresetMinterPauserAutoId.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract Pumpkittens is ERC721PresetMinterPauserAutoId, Ownable {
    using Counters for Counters.Counter;
    
    uint private reservePrice = 200 ether;
    uint private currentPrice;
    uint private previousPrice;
    uint private addPriceRate = 150;             // 1.5%
    uint private max_Pumpkittens = 100;
    uint256 private max_TokenCountOfAccount = 1;
    
    uint private transferTaxRate = 100;          // 1%
    bool private enabletransferTax = true;
    
    address private devAccount;
    Counters.Counter private _tokenIdTracker;
    
    enum Status {
        Pending,
        Reserved,
        Minted
    }
    
    mapping(uint => Status) private _tokenStatus;
    mapping(uint => uint256) private _tokenPrice;
    mapping(address => uint) private _tokenCountOfAccount;
    
    struct ReservedToken {
        uint256 tokenId;
        uint256 price;
    }
    
    mapping(address => ReservedToken) private _reservedInfo;
    uint private currentReservedTokenId = 0;
    uint256 private reservedPeriod = 12 * 3600;                 // 12 hours
    uint256 private mintReservedTokenPeriod =12 * 3600;         // 12 hours
    uint256 private initialTime;

    constructor() ERC721PresetMinterPauserAutoId
        ("Pumpkittens", "PK", "https://gateway.pinata.cloud/ipfs/QmdrB5UXmyudAN3pchwvPWohKPT81Biq3Amxj6u7dSKQfE/") 
    {
        currentPrice = reservePrice;
        devAccount = _msgSender();
        initialTime = block.timestamp;
    }
    
    function buyPumpkittens() public payable {
        
        require(_tokenIdTracker.current() <= max_Pumpkittens, "Too Many Tokens");
        require(_tokenCountOfAccount[_msgSender()] < max_TokenCountOfAccount, "Too Many Tokens For a Account");
        require(!((block.timestamp - initialTime) < mintReservedTokenPeriod && !isReservedAddress(_msgSender())), "Not right to mint now");
        
        if ((block.timestamp - initialTime) <= mintReservedTokenPeriod)
        {
             require(_tokenStatus[_reservedInfo[_msgSender()].tokenId] != Status.Minted, "Not right to mint again");
             
            _tokenIdTracker.increment();
            
            _mint(_msgSender(), _reservedInfo[_msgSender()].tokenId);
            
            _tokenCountOfAccount[_msgSender()] ++;
            
            _tokenStatus[_reservedInfo[_msgSender()].tokenId] = Status.Minted;
            _tokenPrice[_reservedInfo[_msgSender()].tokenId] = _reservedInfo[_msgSender()].price;
                        
            _reservedInfo[_msgSender()].price = 0;
        }
        else{
            uint256 tokenId = 0;
            
            if (_tokenIdTracker.current() < currentReservedTokenId)
            {
                currentPrice = getPrice();
                
                for (uint i=1; i<currentReservedTokenId + 1; i++)
                {
                    if (_tokenStatus[i] != Status.Minted)
                    {
                        tokenId = i;
                        break;
                    }
                }
                _tokenIdTracker.increment();
            }
            else{
                _tokenIdTracker.increment();
                
                tokenId = _tokenIdTracker.current();
            }
            
            require(msg.value == currentPrice);
            
            _mint(_msgSender(), tokenId);
            
            _tokenStatus[tokenId] = Status.Minted;
            _tokenPrice[tokenId] = currentPrice;
            
            _tokenCountOfAccount[_msgSender()] ++;
                        
            previousPrice = currentPrice;
            currentPrice = previousPrice + previousPrice * addPriceRate / 10000;
        }
        
        if (transferTaxRate > 0 && enabletransferTax && devAccount != address(0))
        {
            uint256 taxAmount = previousPrice * transferTaxRate / (10000);
            
            require(payable(devAccount).send(taxAmount));
        }
    }
    
    function addReserveToken(address account) public onlyOwner() {
        require((block.timestamp - initialTime) < reservedPeriod, "End time");
        require(_reservedInfo[account].tokenId == 0, "Too Many Tokens");
        require(currentReservedTokenId < max_Pumpkittens, "Too Many Tokens");
        
        _reservedInfo[account].price = currentPrice;
        
        currentReservedTokenId++;
        _reservedInfo[account].tokenId = currentReservedTokenId;
        
        _tokenStatus[currentReservedTokenId] = Status.Reserved;
        
        previousPrice = currentPrice;
        currentPrice = previousPrice + previousPrice * addPriceRate / 10000;
    }
    
    function deleteReserveToken(address account) public onlyOwner() {
        _reservedInfo[account].tokenId = 0;
        _reservedInfo[account].price = 0;
        _tokenStatus[ _reservedInfo[account].tokenId] = Status.Pending;
    }
    
    function getReservedTokenPrice(address account) public view returns (uint256) {
        return _reservedInfo[account].price;
    }
    
    function getReservedTokenInfo(address account) public view returns (ReservedToken memory) {
        return _reservedInfo[account];
    }
    
    function isReservedAddress(address account) public view returns (bool) {
        if (_reservedInfo[account].tokenId > 0)
            return true;
        
        return false;
    }
    
    function isReservePeriod() public view returns (bool) {
        if (block.timestamp - initialTime > mintReservedTokenPeriod)
            return false;
        
        return true;
    }
    
    function setPrice(uint _price) public onlyOwner() {
        currentPrice = _price;
    }
    
    function getPrice() public view returns(uint) {
        if (_tokenIdTracker.current() == max_Pumpkittens)
            return 0;
            
        if (_tokenIdTracker.current() < currentReservedTokenId 
            && (block.timestamp - initialTime) > mintReservedTokenPeriod)
        {
            uint newPrice = reservePrice;
            uint oldPrice;
            
            for (uint i=1; i<currentReservedTokenId; i++)
            {
                if (_tokenStatus[i] != Status.Minted)
                   break;
                   
                oldPrice = newPrice;
                newPrice = oldPrice + oldPrice * addPriceRate / 10000;
            }
            
            return newPrice;
            
        }
        
        return currentPrice;
    }
    
    function setAddPriceRate(uint _rate) public onlyOwner() {
        addPriceRate = _rate;
    }
    
    function getAddPriceRate() public view returns(uint) {
        return addPriceRate;
    }
    
    function withdrawAll() public payable onlyOwner {
        require(payable(msg.sender).send(address(this).balance));
    }  
    
    function getTokenCount() public view returns(uint) {
        return _tokenCountOfAccount[address(msg.sender)];
    }
    
    function setMaxPumpkittens(uint amount) public onlyOwner{
        max_Pumpkittens = amount;
    }
    
    function setMaxTokenCountOfAccount(uint amount) public onlyOwner{
        max_TokenCountOfAccount = amount;
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
    
    function setDeveloperAddress(address _devAccount) public onlyOwner {
        require(_devAccount != address(0), "Cannot be zero address");
        devAccount = _devAccount;
    }  
    
    function setEnableTransferTax(bool _enabletransferTax) public onlyOwner {
        enabletransferTax = _enabletransferTax;
    }
    
    function setTransferTaxRate(uint _transferTaxRate) public onlyOwner {
        require(_transferTaxRate > 0, "Cannot be zero value");
        transferTaxRate = _transferTaxRate;
    }
    
    function setReservePeriod(uint _period) public onlyOwner {
        reservedPeriod = _period;
    }
    
    function setMintReservedTokenPeriod(uint _period) public onlyOwner {
        mintReservedTokenPeriod = _period;
    }
}