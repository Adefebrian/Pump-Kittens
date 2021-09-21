//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;
import "@openzeppelin/contracts/token/ERC721/presets/ERC721PresetMinterPauserAutoId.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract Pumpkittens is ERC721PresetMinterPauserAutoId, Ownable {
    using Counters for Counters.Counter;
    
    uint public reservePrice = 1 ether;
    uint public currentPrice;
    uint public previousPrice;
    uint public addPriceRate = 300;             // 3%
    uint public max_Pumpkittens = 4;
    uint256 private max_TokenCountOfAccount = 3;
    
    uint public transferTaxRate = 100;          // 1%
    bool private enabletransferTax = false;
    
    address public devAccount;
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
    
    mapping(address => ReservedToken) _reservedInfo;
    uint private currenttokenId = 0;
    uint256 reservedPeriod = 60 * 60;                   // 60 minutes
    uint256 mintReservedTokenPeriod = 24 * 3600;        // 24 hours
    uint256 initialTime;
    bool comparedReservedTokenCount = false

    constructor() ERC721PresetMinterPauserAutoId
        ("Pumpkittens", "PK", "https://gateway.pinata.cloud/ipfs/QmUV2B2RrxAwX4Hx4Y2mr9HVnAVoEgvQVtmfbbqgrcfiFJ/") 
    {
        currentPrice = reservePrice;
        previousPrice = 0;
        devAccount = _msgSender();
        initialTime = block.timestamp;
    }
    
    function buyPumpkittens() public payable {
        require(msg.value == currentPrice);
        require(_tokenIdTracker.current() <= max_Pumpkittens, "Too Many Tokens");
        require(_tokenCountOfAccount[_msgSender()] < max_TokenCountOfAccount, "Too Many Tokens For a Account");
        require(!((block.timestamp - initialTime) < mintReservedTokenPeriod && !isReservedAddress(_msgSender())), "Not right to mint now");
        
        if (isReservedAddress(_msgSender()) && (block.timestamp - initialTime) < mintReservedTokenPeriod)
        {
            _tokenIdTracker.increment();
            
            _mint(_msgSender(), _reservedInfo[_msgSender()].tokenId);
            
            _tokenCountOfAccount[_msgSender()] ++;
            
            _tokenStatus[_reservedInfo[_msgSender()].tokenId] = Status.Minted;
        }
        else{
        
            uint256 tokenId = 0;
            _tokenStatus[tokenId] = Status.Minted;
            
            uint index = 0;
            while (_tokenStatus[tokenId] == Status.Minted || _tokenStatus[tokenId] == Status.Reserved)
            {
                tokenId = uint256(keccak256(abi.encodePacked(block.difficulty, block.timestamp, _tokenIdTracker.current() + index))) % max_Pumpkittens + 1;
                
                if (_tokenStatus[tokenId] == Status.Reserved && (block.timestamp - initialTime) > mintReservedTokenPeriod)
                {
                    _tokenStatus[tokenId] = Status.Pending;
                }
                
                index ++;
            }
            
            _tokenIdTracker.increment();
            
            _mint(_msgSender(), tokenId);
            _tokenCountOfAccount[_msgSender()] ++;
            
            _tokenStatus[tokenId] = Status.Minted;
            _tokenPrice[tokenId] = currentPrice;
            
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
        
        _reservedInfo[account].price = currentPrice;
        
        currenttokenId++;
        _reservedInfo[account].tokenId = currenttokenId;
        
        _tokenStatus[currenttokenId] = Status.Reserved;
        
        previousPrice = currentPrice;
        currentPrice = previousPrice + previousPrice * addPriceRate / 10000;
    }
    
    function deleteReserveToken(address account) public onlyOwner() {
        _reservedInfo[account].tokenId = 0;
        _tokenStatus[ _reservedInfo[account].tokenId] = Status.Pending;
    }
    
    function getCountofReservedToken() public view returns (uint) {
        return currenttokenId;
    }
    
    function getReservedTokenPrice(address account) public view returns (uint256) {
        return _reservedInfo[account].price;
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
        if (_tokenIdTracker < currenttokenId 
            && block.timestamp - initialTime) > mintReservedTokenPeriod 
            && !comparedReservedTokenCount)
        {
            comparedReservedTokenCount = true;
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