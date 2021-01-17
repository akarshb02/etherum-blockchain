pragma solidity ^0.5.11;

contract acceptEther {
    
    mapping(address => uint) public balances;
    address payable wallet;
    
    constructor(address payable _wallet) public {
        wallet =_wallet;
    }
    
    function BuyToken() public payable{
        //buy a token & send ether to wallet 
        balances[msg.sender] += 1;
        
        //sender
        wallet.transfer(msg.value);
        
    } 
}
