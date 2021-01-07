pragma solidity ^0.5.11;

contract Wvariables {
    
    uint256 public myuint;
    
    function setMyUint(uint _myUint) public { 
        
        myuint =  _myUint;
    }

    
    bool public myBool;
    function setMyBool(bool _my) public {
        
        myBool = _my;
    }
    
}
