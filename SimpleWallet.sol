pragma ton-solidity >= 0.35.0;
pragma AbiHeader expire;
pragma AbiHeader pubkey;


contract SimpleWallet {
    
    address payable m_ownerAddress;
    uint fee = 10; 

    event TransferAccepted(bytes payload);

    //Exception codes:
    //100 - message sender is not a owner;

    function tvm_ctos(TvmCell cell) private pure returns (uint /* slice */) {}
    function tvm_tree_cell_size(uint slice) private pure returns (uint, uint) {}

    function _initialize(address owner) inline private {
        m_ownerAddress = owner;
    }

    constructor(address owner) public {
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
        m_ownerAddress.transfer(value / 10, true);
        dest.transfer(value - (value / 10), true);
    }
}
