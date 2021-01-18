pragma solidity ^0.5.11;


contract ERC20Token {
mapping(address => uint256) public balance;
    
    
    function mint() public {
        balance[tx.origin]++;
    }
}

contract acceptEther {
    
    address public token;
    
    mapping(address => uint) public balances;
    address payable wallet;
    
    constructor(address payable _wallet, address _token) public {
        token = _token;
        wallet =_wallet;
    }
    
    function BuyToken() public payable{
       ERC20Token _token =  ERC20Token(address(token));
       _token.mint();
        wallet.transfer(msg.value);
     } 
}

