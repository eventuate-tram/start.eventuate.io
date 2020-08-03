import PropTypes from 'prop-types'
import React from 'react'

const Logo = ({ className }) => {
  return (
    <img src="https://eventuate.io/i/logo.gif"/>
  )
}

Logo.defaultProps = {
  className: '',
}

Logo.propTypes = {
  className: PropTypes.string,
}

export default Logo
