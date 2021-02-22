import './App.css';
import Web3 from 'web3';
import { Component } from 'react';
import { TODO_LIST_ABI, TODO_LIST_ADDRESS } from './config'

class App extends Component {


    componentWillMount() {
        this.loadBlockchainData()
    }

    async loadBlockchainData() {
        const web3 = new Web3(Web3.givenProvider || 'http://localhost:8545');
        const network = await web3.eth.net.getNetworkType();
        const accounts = await web3.eth.getAccounts();
        this.setState({ account: accounts[0] });
        const todoList = new web3.eth.Contract(TODO_LIST_ABI, TODO_LIST_ADDRESS)
        this.setState({ todoList })
        const taskCount = await todoList.methods.taskCount().call()
        this.setState({ taskCount })
    }
    constructor(props) {
        super(props);
        this.state = {
            account: '',
            taskCount: 0
        }

    }

    render() {
        return ( <
            div className = "continer" >
            <
            h1 > hello < /h1> <
            p > Account: { this.state.account } < /p> < /
            div >

        );
    }
}



export default App;
