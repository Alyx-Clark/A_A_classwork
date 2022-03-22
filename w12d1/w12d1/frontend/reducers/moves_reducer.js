import { RECEIVE_POKEMON } from "../actions/pokemon_actions";

const movesReducer = (state={}, action) => {
    Object.freeze(state)
    const nextState = Object.assign({}, state)

    switch (action.type) {
        case RECEIVE_POKEMON:
            debugger
        return {...nextState, ...action.pokemon.moves};
        default:
            return state;
    }
}

export default movesReducer;