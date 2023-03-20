// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.15;

import "foundry-huff/HuffDeployer.sol";
import "forge-std/Test.sol";
import "forge-std/console.sol";

interface MostSignificantBit {
    function mostSignificantBit(uint256 x) external pure returns (uint256);
}

contract MSB is Test {

    MostSignificantBit public msb;

    function setUp() public {
        msb = MostSignificantBit(HuffDeployer.deploy("MostSignificantBit"));
    }

    function testMSB() public view {
        uint a = msb.mostSignificantBit(100);
        console.logUint(a);
    }
}