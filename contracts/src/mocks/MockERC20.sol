// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract MockERC20 is ERC20 {
    uint8 private decimals_;

    constructor(
        string memory _name,
        string memory _symbol,
        uint8 _decimals
    ) ERC20(_name, _symbol) {
        decimals_ = _decimals;
    }

    function decimals() public view virtual override returns (uint8) {
        return decimals_;
    }

    function mint(address _recipient, uint256 _amount) external returns (bool) {
        _mint(_recipient, _amount);
        return true;
    }

    function burn(uint256 _amount) external returns (bool) {
        _burn(msg.sender, _amount);
        return true;
    }

    function burn(address _from, uint256 _amount) public virtual returns (bool) {
        _burn(_from, _amount);
        return true;
    }
}
