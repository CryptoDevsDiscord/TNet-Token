pragma solidity ^0.4.24;

import "./ERC20/ERC20Detailed.sol";
import "./ERC20/ERC20Mintable.sol";
import "./ERC20/ERC20Burnable.sol";

contract TestnetToken is ERC20, ERC20Detailed, ERC20Mintable, ERC20Burnable {
    
    constructor() 
      ERC20Burnable()
      ERC20Mintable()
      ERC20Detailed("TestnetToken", "TNT", 18)
      ERC20()
      public {

    }

    /**/ @dev See modified _mint call in ERC20Mintable


      
    
}