// SPDX-License-Identifier: Apache-2.0
pragma solidity 0.8.16;

import "@openzeppelin/contracts/proxy/transparent/TransparentUpgradeableProxy.sol";
import "@openzeppelin/contracts/proxy/transparent/ProxyAdmin.sol";

contract StubContract {}

library TestUtil {
    function deployProxy(address logic) public returns (address) {
        ProxyAdmin pa = new ProxyAdmin();
        return address(new TransparentUpgradeableProxy(address(logic), address(pa), ""));
    }

    function deployStub() public returns (address) {
        return address(new StubContract());
    }

    function arraysAreEqual(address[] memory arr1, address[] memory arr2) public returns (bool) {
        return keccak256(abi.encodePacked(arr1)) == keccak256(abi.encodePacked(arr2));
    }
}
