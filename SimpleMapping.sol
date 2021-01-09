pragma solidity ^0.5.11;


contract  SimpleMapping {
    
    
    mapping(uint => bool) public  myMap;
    mapping(address => bool) public myAddress;
    
    
    function setValues(uint _index) public {
        myMap[_index] = true;
    }
    
    function setAddress() public {
        myAddress[msg.sender]=true;
    }
}
