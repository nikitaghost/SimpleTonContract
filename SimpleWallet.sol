pragma ton-solidity >= 0.35.0;
pragma AbiHeader expire;
pragma AbiHeader pubkey;


contract SimpleWallet {
    
    uint256 m_ownerKey;

    event TransferAccepted(bytes payload);

    //Exception codes:
    //100 - message sender is not a owner;

    function tvm_ctos(TvmCell cell) private pure returns (uint /* slice */) {}
    function tvm_tree_cell_size(uint slice) private pure returns (uint, uint) {}

    function _initialize(uint256 owner) inline private {
        m_ownerKey = owner;
    }

    constructor(uint256 owner) public {
        //require(msg.pubkey == tvm.pubkey, 100);
        tvm.accept();
        _initialize(owner);
    }

    function acceptTransfer(bytes payload) external payable {
        emit TransferAccepted(payload);
    }

    function send(address payable dest, uint128 value) public{
        //require(msg.pubkey() == m_ownerKey, 100);
        tvm.accept();
        dest.transfer(value, true);
    }
}
