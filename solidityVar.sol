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
    
    uint8 public myUint8;
    function increment() public {
        myUint8++;
    }
    function decrese() public {
        myUint8--;
    }
    
    address public myAddress;
    function getAddress(address _my) public {
        
        myAddress = _my;
        
    }
    
    function getBalance() public view returns(uint){
        return myAddress.balance;
    }
    
    string public myString = "Hello!!";
    function setString(string memory myData) public {
        myString = myData;
    }
    
}
