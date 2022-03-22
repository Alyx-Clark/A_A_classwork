import { RECEIVE_ALL_POKEMON, RECEIVE_POKEMON } from './../actions/pokemon_actions';

const itemsReducer = (state={}, action) => {
    Object.freeze(state);
    const nextState = Object.assign({}, state);
    switch (action.type) {
        case RECEIVE_POKEMON:
            return {...nextState, ...action.pokemon.items};
        default:
            return state;
    }
}

export default itemsReducer;