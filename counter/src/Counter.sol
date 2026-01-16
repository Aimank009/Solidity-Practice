// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract Counter{
    uint256 public count=0;

    function increment() public {
        count+=1;
    }

    function decrement() public {
        count-=1;
    }

    function getCount() public view returns (uint256){
        return count;
    }
}
