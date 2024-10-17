// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {Test, console} from "forge-std/Test.sol";
import {FundMe} from "../src/FundMe.sol";

contract FundMeTest is Test {
    FundMe fundMe;
    address owner = address(1); // Simulate deployer

    function setUp() external {
        // Log msg.sender to ensure it's correct before deployment
        console.log("Deploying contract from: ", owner);
        vm.prank(owner); // Simulate deployer as the owner
        fundMe = new FundMe();

        // Log the actual owner set in the contract
        console.log("Contract owner set to: ", fundMe.i_owner());
    }

    function testMinimumDollarIsFive() public {
        assertEq(fundMe.MINIMUM_USD(), 5e18);
    }

    function testOwnerIsMessageSender() public {
        assertEq(fundMe.i_owner(), owner); // Check that owner is correctly set
    }

    function testPriceFeedVersionIsAccurate() public {
        uint256 version = fundMe.getVersion();
        assertEq(version, 4);
    }
}
