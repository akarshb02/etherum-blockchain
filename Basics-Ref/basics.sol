pragma solidity ^0.5.11;

contract myContract {
    
    //basics data types
    
    address owner;
    
    
    constructor() public {
        
        owner=msg.sender;
    }
    
    string public constant strVal = "this is constant";
    string public value = "myVal";
    bool public myBool = true;
    int public myInt = -1;
    uint public myUint = 1;
    uint8 public myUint8 = 8;
    uint256 public myUint256 = 9999;
    // constructor() public {
    //     value = "myval";
    // }
    
    // function get() public view returns(string memory){
    //     return value;
    // }
    
    function setVal(string memory _value) public {
        
        value = _value;
    }
    
    enum State {Waiting,Ready,Active}
    State public state;
    
    // constructor() public {
    //     state = State.Waiting;
    // }
    
    
    modifier onlyOwner()  {
        
        require(owner==msg.sender,"You are not owner");
        _;
    }
    
    function activate() public {
        state = State.Active;
    }
    
    function isActive() public view returns(bool) {
        
        return state == State.Active;
    }
    
    //struct & arrays
    uint8 public perssonCount;
    mapping(uint => Person) public people;
    //Person[] public people;
    struct Person {
        uint _id;
        string _fname;
        string _lname;
    }
    function addperson(string memory _fname,string memory _lname) public onlyOwner {
                perssonCount++;
        people[perssonCount] = Person(perssonCount,_fname,_lname);
        //array  people.push(Person(_fname,_lname ));

    }
    
    // function getPerson() public view returns(string memory) {
        
    //     return people;
    // }
    
    
    
    
    //time in solidity
    
    
    uint256 openTime = 1610863890;
    
    modifier onlyOpen() {
        require(block.timestamp >= openTime);
        _;
    }
    function add(string memory _fname,string memory _lname) public onlyOpen {
                perssonCount++;
        people[perssonCount] = Person(perssonCount,_fname,_lname);


    }
    
    
    
}
