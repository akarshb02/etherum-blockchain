pragma solidity ^0.7.4;

contract Counter {
    
    uint public count = 0;
    uint[] public uintArray =[1,2,3];
    string[] public values;
    
    mapping(uint => string) public names;
    mapping(uint => Book) public books;
    mapping(address=>mapping(uint=>Book)) public mybook;
    
    struct Book {
        
          string authore;
        
    }
    
    constructor() {
        names[1] =  "Admin";
        names[2] = "Xyz";
        names[3] = "sss";
    }

    function setCount() public {
        
        count = count + 1;
        
    }  
    
    function addValues(string memory _value) public {
        values.push(_value);
    }
    
    function valueCount() public view returns(uint) {
        return values.length;
    }
    
    function addBook(uint id,string memory authore) public {
        
        books[id] =Book(authore);
    }
    function addMyBook(uint id,string memory authore) public {
        
        mybook[msg.sender][id] = Book(authore);
    }
    
    
   // MyStruct public mySte = MyStruct(1,"Hello");
    
    
   
    
  
}
