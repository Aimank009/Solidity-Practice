// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test} from "forge-std/Test.sol";
import {Storage} from "../src/Storage.sol";

contract CounterTest is Test {
    Storage public storage_test;

    function setUp() public {
       storage_test=new Storage();
    }

    function test_store() public {
        storage_test.store(10);
        assertEq(storage_test.retrieve(),10);
    }

}
