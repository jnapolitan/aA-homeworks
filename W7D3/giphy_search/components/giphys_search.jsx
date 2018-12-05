import React from 'react';

import GiphysIndex from './giphys_index';

export default class Search extends React.Component {
    constructor(props) {
        super(props);
        this.state = { searchTerm: '' };
        this.handleSubmit = this.handleSubmit.bind(this);
        this.update = this.update.bind(this);
    }

    render() {
        let { giphys } = this.props;

        return(
            <div>
                <form action="GET" onSubmit={this.handleSubmit}>
                    <label>Search:
                        <input type="text" name="search" value={this.state.searchTerm} onChange={this.update('searchTerm')} />
                    </label>
                    <button type="submit">Search</button>
                </form>   
                <GiphysIndex giphys={giphys} />
            </div>
        )   
    }

    handleSubmit(e) {
        e.preventDefault();
        this.props.fetchSearchGiphys(this.state.searchTerm)
    }

    update(attr) {
        return (e) => {
            this.setState({ [attr]: e.target.value });
        };
    }
}