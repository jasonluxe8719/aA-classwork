import {connect} from 'react-redux';

import ItemDetail from './item_detail';



const mapStateToProps = (state, ownProps) => {
    // piece of state that container subscribes to
    return {
        item: selectPokemonItem(state, ownProps.match.params.itemId)
    }
    // items: getItems(state, ownProps.pokemonId)
};



export default connect(
    mapStateToProps,
)(ItemDetail);
