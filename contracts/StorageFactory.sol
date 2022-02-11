// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

import "./MyStorage.sol";

contract ContractFactory {
    MyStorage[] public storageArray;

    function addStorage() public {
        MyStorage myStorage = new MyStorage();
        storageArray.push(myStorage);
    }

    function sfStore(uint256 _index, uint256 _number) public {
        MyStorage myStorage = MyStorage(address(storageArray[_index]));

        myStorage.store(_number);
    }

    function sfView(uint256 _index) public view returns (uint256) {
        MyStorage myStorage = MyStorage(address(storageArray[_index]));
        return myStorage.retrieve();
    }

    function sfViewAddress(uint256 _index) public view returns (address) {
        return address(storageArray[_index]);
    }

    function sfStoreExternal(address add) public {
        MyStorage myStorage = MyStorage(add);
        storageArray.push(myStorage);
    }
}
