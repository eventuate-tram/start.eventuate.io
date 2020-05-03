import PropTypes from 'prop-types'
import React from 'react'

const Footer = ({ children }) => (
  <div className='sticky'>
    <div className='colset colset-submit'>
      <div className='left nopadding'>
        <footer className='footer'>
          <div className='footer-container'>
            Copyright (c) 2020, Eventuate Inc
            <br />
            © 2013-2020 VMware, Inc.
            <br />
          </div>
        </footer>
      </div>
      {children && (
        <div className='right nopadding'>
          <div className='submit'>{children}</div>
        </div>
      )}
    </div>
  </div>
)

Footer.defaultProps = {
  children: null,
}

Footer.propTypes = {
  children: PropTypes.node,
}

export default Footer
