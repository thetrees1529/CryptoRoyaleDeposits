//SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.16;
contract CheckIns {
  event CheckedIn(address account, uint timestamp);
  mapping(address => uint) private _lastCheckIns;
  function checkIn() external {
    address account = msg.sender;
    uint timestamp = block.timestamp;
    _lastCheckIns[account ] = timestamp;
    emit CheckedIn(account , timestamp);
  }
  function getLastCheckIn(address account) external view returns(uint) {
    return _lastCheckIns[account];
  }
}