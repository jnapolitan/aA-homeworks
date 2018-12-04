import { createStore, applyMiddleware } from 'redux';
import rootReducer from '../reducers/root_reducer';

const configureStore = (preloadedState = {}) => {
  const store = createStore(
    rootReducer, 
    preloadedState,
    applyMiddleware(addLoggingToDispatch)
    );
  store.subscribe(() => {
    localStorage.state = JSON.stringify(store.getState());
  });
  return store;
}

const addLoggingToDispatch = store => next => action => {
  console.log('Before action:', store.getState());
  console.log('Action called:', action);
  next(action);
  console.log('After action:', store.getState());
};

export default configureStore;
