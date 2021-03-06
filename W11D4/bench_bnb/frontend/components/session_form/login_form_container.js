
import {connect} from redux;
import { login } from '../../actions/session_actions';
import SessionForm from './session_form';

const mapStateToProps = (state, ownProps) => {
  return {
    errors: state.errors.session,
    formType: login(user)
  }
}

const mapDispatchToProps = (dispatch, ownProps) => {
  return {
    processForm: (user) => dispatch(login(user))
  }
}

export default connect(
  mapStateToProps, 
  mapDispatchToProps
  )(SessionForm);