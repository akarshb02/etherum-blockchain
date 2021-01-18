pragma solidity ^0.5.11;


contract ERC20Token {

    string name;
    mapping(address => uint256) public balance;
    
    constructor(string memory _name) public {
        name = _name;
    }
    
    function mint() public {
        balance[tx.origin]++;
    }
}

contract MyToken is ERC20Token {
    
    address[] public owners;
    string public soybol;
    constructor(string memory _name,string memory _symbol) ERC20Token(_name) public {
        soybol = _symbol;
    }
    
    function mint() public  {
         super.mint();
         owners.push(msg.sender);
    }
}
