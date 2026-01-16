// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test} from "forge-std/Test.sol";
import {ETHWallet} from "../src/ETHWallet.sol";

contract CounterTest is Test {
    ETHWallet public ethwallet;

    address owner = 0xA7BCD2a124B1D76e7dbE00eA9D887e69e37D2bae;
    address To = 0xFDab0c2bb53D36D9cFDB496aC43Ba9Ce79065121;
    address nonOwner = address(0x999);

    function setUp() public {
        ethwallet = new ETHWallet(owner);
    }

    function test_recieve() public {
       vm.deal(address(this),1 ether);
       (bool success,)= address(ethwallet).call{value:1 ether}("");
       require(success, "Transfer failed");
       assertEq(ethwallet.checkBalance(),1 ether);

    }

    function test_withdraw() public{
        vm.deal(address(this),2 ether);
        (bool success,)= address(ethwallet).call{value:2 ether}("");
        require(success, "Transfer failed");

        uint256 initialBalance = owner.balance;
        uint256 withdrawAmount =1 ether;
        vm.prank(owner);
        ethwallet.withdraw(withdrawAmount);

        assertEq(owner.balance,initialBalance+withdrawAmount);
        assertEq(ethwallet.checkBalance(),1 ether);

    }

    function test_withdrawTo()public{
        vm.deal(address(this),2 ether);
        (bool success, ) = address(ethwallet).call{value: 2 ether}("");
        vm.prank(owner);
        ethwallet.withdrawTo(To, 1 ether);
        assertEq(ethwallet.checkBalance(), 1 ether);
    }

    // function test_checkBalance(){

    // }
}
