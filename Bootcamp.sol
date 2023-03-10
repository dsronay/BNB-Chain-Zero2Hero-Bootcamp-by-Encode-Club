// SPDX-License-Identifier: None

pragma solidity 0.8.17;


contract BootcampContract {

    uint256 number;
    address owner;
    address defaultAddress = 0x000000000000000000000000000000000000dEaD;

    constructor(){
        owner = msg.sender;
    }

    function store(uint256 num) public {
        number = num;
    }


    function retrieve() public view returns (uint256){
        return number;
    }

    function getOwner() public view returns (address){
        return msg.sender == owner ? defaultAddress : owner;
    }
}