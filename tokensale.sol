  pragma solidity ^0.4.0;

  contract TokenSale {
    mapping(address => uint) public balances;
    uint public _totalSupply;
    uint public _totalRaised;
    uint public _tokenEthRatio;

    constructor (uint256 totalSupply, uint tokenEthRatio) public {
        _totalSupply = totalSupply;
        _tokenEthRatio = tokenEthRatio;
    }

    function buyTokens() public payable {
      uint ethAmount = msg.value; 
      uint tokenAmount = ethAmount * _tokenEthRatio;
      require (_totalSupply >= tokenAmount, "There is not enough supply!");
      _totalSupply -= tokenAmount;
      balances[msg.sender] += tokenAmount;
      _totalRaised += ethAmount; 
    }
  }