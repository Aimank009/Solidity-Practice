// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test} from "forge-std/Test.sol";
import {TipJar} from "../src/TipJar.sol";

contract CounterTest is Test {
    TipJar public tipjar;

    address to=0xFDab0c2bb53D36D9cFDB496aC43Ba9Ce79065121;

    function setUp() public {
        tipjar = new TipJar(address(this));
    }
    
    function test_recieve()public{
        vm.deal(address(this),2 ether);
        assertEq(address(this).balance,2 ether);
    }

    function test_withdraw() public {
        vm.deal(address(this), 2 ether);

    
        (bool sent, ) = address(tipjar).call{value: 2 ether}("");
        require(sent, "ETH send to TipJar failed");

    
        assertEq(address(tipjar).balance, 2 ether);

    
        tipjar.withdraw(to, 1 ether);

   
        assertEq(address(tipjar).balance, 1 ether);
        assertEq(to.balance, 1 ether);
}


}
