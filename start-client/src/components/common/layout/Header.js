import PropTypes from 'prop-types'
import React from 'react'

import Logo from '../../../images/initializr-icon.png'

const Header = ({ children }) => (
  <div className='header'>
    <h1 >
      <a href='/'>
        <img src={Logo}></img>
      </a>
    </h1>
    {children}
  </div>
)

Header.defaultProps = {
  children: null,
}

Header.propTypes = {
  children: PropTypes.node,
}

export default Header
