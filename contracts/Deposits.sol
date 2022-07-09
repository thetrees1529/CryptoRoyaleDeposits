//SPDX-License-Identifier: UNLICENSED

pragma solidity 0.8.15;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";
import "@openzeppelin/contracts/security/ReentrancyGuard.sol";



contract Deposits is Ownable, ReentrancyGuard {

    using SafeERC20 for IERC20;

    IERC20 public ROY;
    address public depositWallet;
    bytes32 public DEPOSITED_VIEWER_ROLE;

    constructor(IERC20 ROY_, address depositWallet_) {
        _setDepositWallet(depositWallet_);
        _setROY(ROY_);
    }

    mapping(address => uint) private _deposited;

    function setDepositWallet(address depositWallet_) external onlyOwner {
        _setDepositWallet(depositWallet_);
    }

    function setROY(IERC20 ROY_) external onlyOwner {
        _setROY(ROY_);
    }

    function getDeposited(address account) external view returns(uint) {
        return _deposited[account];
    }

    function deposit(uint value) external nonReentrant {
        address account = msg.sender;
        ROY.safeTransferFrom(account, depositWallet, value);
        _deposited[account] += value;
    }

    function _setDepositWallet(address depositWallet_) private nonReentrant {
        depositWallet = depositWallet_;
    }
    function _setROY(IERC20 ROY_) private nonReentrant {
        ROY = ROY_;
    }

}