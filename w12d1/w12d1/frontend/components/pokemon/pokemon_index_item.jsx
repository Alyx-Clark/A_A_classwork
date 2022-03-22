import React from "react";
import { Link } from "react-router-dom";

const PokemonIndexItem = (props) => {

    return (
      <div>
        <Link to= {`/pokemon/${props.pokemon.id}`} >
            <li>{props.pokemon.id}</li>
            <li>{props.pokemon.name}</li>
        </Link>
        <img src={props.pokemon.imageUrl} alt={props.pokemon.name} /> 
      </div>
    )
}

export default PokemonIndexItem;

