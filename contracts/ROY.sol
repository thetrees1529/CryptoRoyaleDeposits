//SPDX-License-Identifier: UNLICENSED

pragma solidity 0.8.16;

import "@openzeppelin/contracts/access/AccessControl.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "./Checkins.sol";
//importing checkins and inheriting from it (even if code is never used doesnt hurt to include)

contract ROY is ERC20, AccessControl, CheckIns {
    
    constructor(string memory name, string memory symbol) ERC20(name, symbol) {_grantRole(DEFAULT_ADMIN_ROLE, msg.sender);} 

    mapping(address => mapping(address => uint)) private _volume;

    function getVolume(address from, address to) external view returns(uint) {return _volume[from][to];}

    function mint(address account, uint amount) external onlyRole(DEFAULT_ADMIN_ROLE) {_mint(account, amount);}

    function burn(uint amount) external {_burn(msg.sender, amount);}

    function burnFrom(address account, uint amount) external onlyRole(DEFAULT_ADMIN_ROLE) {_burn(account, amount);}

    function _afterTokenTransfer(address from, address to, uint amount) internal override {
        _volume[from][to] += amount;
    }

}



