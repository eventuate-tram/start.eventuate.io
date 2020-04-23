import get from 'lodash.get'
import React, { useContext, useEffect, useRef, useState } from 'react'
import { CSSTransition, TransitionGroup } from 'react-transition-group'

import { AppContext } from '../../reducer/App'
import { IconCaretDown, IconGithub, IconSpring, IconTwitter } from '../icons'
import { Switch } from '../form'

const QuickLinks = () => {
  const { theme, dispatch } = useContext(AppContext)
  const [help, setHelp] = useState(false)
  const wrapper = useRef(null)
  const toggleTheme = () => {
    const newTheme = theme === 'dark' ? 'light' : 'dark'
    dispatch({
      type: 'UPDATE',
      payload: {
        theme: newTheme,
      },
    })
  }
  useEffect(() => {
    const clickOutside = event => {
      const children = get(wrapper, 'current')
      if (children && !children.contains(event.target)) {
        setHelp(false)
      }
    }
    document.addEventListener('mousedown', clickOutside)
    return () => {
      document.removeEventListener('mousedown', clickOutside)
    }
  }, [setHelp])

  return (
    <ul className='quick-links'>
      <li>
        <span className='switch-mode'>
          <Switch isOn={theme === 'dark'} onChange={toggleTheme} />
          {theme === 'dark' ? 'Dark' : 'Light'} UI
        </span>
      </li>
      <li>
        <a
          href='https://github.com/eventuate-tram'
          rel='noreferrer noopener'
          target='_blank'
          tabIndex='-1'
        >
          <IconGithub />
          Github
        </a>
      </li>
      <li>
        <a
          href='https://twitter.com/eventuateio'
          rel='noreferrer noopener'
          target='_blank'
          tabIndex='-1'
        >
          <IconTwitter />
          Twitter
        </a>
      </li>
    </ul>
  )
}

export default QuickLinks
