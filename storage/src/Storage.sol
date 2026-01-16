// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract Storage{
    uint256 public num;
    
    // constructor(uint256 _num) {
    //     num=_num;
    // }

    function store(uint256 _num) public {
        num=_num;
    }

    function retrieve() public view returns (uint256){
        return num;
    }
}