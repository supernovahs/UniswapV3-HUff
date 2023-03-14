// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.15;

import "foundry-huff/HuffDeployer.sol";
import "forge-std/Test.sol";
import "forge-std/console.sol";



/// @notice NoDelegateCall tests for Huff contract 
interface NoDelegateCall {
    function original() external view returns (address);
    function noDelegateCall() external view ;
}
contract NoDelegateCalltest is Test {
    /// @dev Address of the NoDelegateCall contract.
    NoDelegateCall public nodelegateCall;

    /// @dev Setup the testing environment.
    function setUp() public {
        nodelegateCall = NoDelegateCall(HuffDeployer.deploy("NoDelegateCall"));

    }

/// @dev Ensure constructor sets original address correctly 
    function testOriginalAddressEqContractAddress() public  {
        assertEq(nodelegateCall.original(),address(nodelegateCall));
    }

/// @dev Ensure that checkNotDelegateCall modifier reverts on delegatecall
    function testFailnoDelegateCall() public  {
    (bool success,)= address(nodelegateCall).delegatecall(abi.encodeWithSignature("checkNotDelegateCall()"));
    require(success);
    }




}





