pragma solidity ^0.7.4;

contract conditional {
    
    uint[] public numbers = [1,2,3,4,5,6,7,8,9,10];
    
    function countEvenNum() public view returns(uint) {
        uint count = 0;
        for(uint i=0;i<numbers.length;i++) {
            if(isEvenNumber(numbers[i])) {
                count++;
            }
        }
        return count;
    }
    
    function isEvenNumber(uint _number) public view returns(bool) {
        uint div = 2;
        
        //4/2 == 0
    
        
        if(_number%div == 0 ) {
            return true;
        }else{
            return false;
        }
        
        
        
    }
}
