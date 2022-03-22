import {combineReducers} from 'redux';
import entitiesReducer from './entities_reducer';
import uiReducer from './uiReducer';

const rootReducer = combineReducers({
  entities: entitiesReducer,
  ui: uiReducer
});

export default rootReducer;