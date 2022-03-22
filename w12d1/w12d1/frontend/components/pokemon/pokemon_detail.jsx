import React from "react";

class PokemonDetail extends React.Component {
    constructor(props) {
        super(props);
        this.state = {pokemon: {}}

    }

    componentDidMount(){
        // debugger
        this.props.requestSinglePokemon(this.props.match.params.id);
    }
    
    componentDidUpdate(prevProps){
        // debugger
        // if(this.props.pokemonId)
    }

    render(){
    //    debugger
    return (
        <div>
            <li key={this.props.match.params.id}>{this.props.pokemon[this.props.match.params.id]}</li>
        </div>
    )
    }
}

export default PokemonDetail;