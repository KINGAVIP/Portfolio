// SPDX-License-Identifier: MIT
pragma solidity ^0.8.1;

contract IncrementDecrement{
  uint256  value=0;
  event Increment(bytes32 message);
  event Decrement(bytes32 message);

  function increase() public{
    value++;
    emit Increment("Incremented by 1");
  }
  function decrease() public {
    value--;
    emit  Decrement("Decremented by 1");
  }

  function getValue() public view returns(uint256) {
    return value;
  }
}
