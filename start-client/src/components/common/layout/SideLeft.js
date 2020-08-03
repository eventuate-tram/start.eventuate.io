import get from 'lodash.get'
import React, { useContext, useEffect, useRef, useState } from 'react'
import { CSSTransition, TransitionGroup } from 'react-transition-group'
import { clearAllBodyScrollLocks, disableBodyScroll } from 'body-scroll-lock'

import Header from './Header'
import { AppContext } from '../../reducer/App'
import { IconGithub, IconTwitter } from '../icons'

const SideLeft = () => {
  const [isOpen, setIsOpen] = useState(false)
  const [lock, setLock] = useState(false)
  const wrapper = useRef(null)

  const { nav, dispatch } = useContext(AppContext)

  useEffect(() => {
    if (get(wrapper, 'current') && nav) {
      disableBodyScroll(get(wrapper, 'current'))
    }
    return () => {
      clearAllBodyScrollLocks()
    }
  }, [wrapper, isOpen, nav])

  const onEnter = () => {
    setLock(true)
    setTimeout(() => {
      setIsOpen(true)
    }, 350)
  }
  const onEntered = () => {
    setLock(false)
  }

  const onEnded = () => {
    setLock(true)
    setIsOpen(false)
  }
  const onExited = () => {
    setLock(false)
  }
  return (
    <>
      <div id='side-left' className={isOpen ? 'is-open' : ''}>
        <div className='side-container'>
          <div className='navigation-action'>
            <button
              className={`hamburger hamburger--spin ${nav ? 'is-active' : ''}`}
              type='button'
              aria-label='Menu'
              aria-controls='navigation'
              onClick={() => {
                if (lock) {
                  return
                }
                dispatch({ type: 'UPDATE', payload: { nav: !nav } })
              }}
            >
              <span className='hamburger-box' tabIndex='-1'>
                <span className='hamburger-inner' />
              </span>
            </button>
          </div>
          <div className='social'>
            <a
              rel='noreferrer noopener'
              target='_blank'
              href='https://github.com/eventuate-platform/eventuate-platform-dependencies'
            >
              <span className='a-content' tabIndex='-1'>
                <IconGithub />
              </span>
            </a>
            <a
              rel='noreferrer noopener'
              target='_blank'
              href='https://twitter.com/eventuateio'
            >
              <span className='a-content' tabIndex='-1'>
                <IconTwitter />
              </span>
            </a>
          </div>
        </div>
      </div>
      <TransitionGroup component={null}>
        {nav && (
          <CSSTransition
            onEnter={onEnter}
            onEntered={onEntered}
            onExit={onEnded}
            onExited={onExited}
            classNames='navigation'
            timeout={500}
          >
            <div className='navigation' ref={wrapper}>
              <div className='navigation-content'>
                <div className='navigation-content-wrap'>
                  <Header />
                  <div className='is-mobile'>
                    <ul>
                      <li>
                        <a
                          rel='noreferrer noopener'
                          target='_blank'
                          href='https://github.com/eventuate-platform/eventuate-platform-dependencies'
                        >
                          <span className='a-content' tabIndex='-1'>
                            Github
                          </span>
                        </a>
                      </li>
                      <li>
                        <a
                          rel='noreferrer noopener'
                          target='_blank'
                          href='https://twitter.com/eventuateio'
                        >
                          <span className='a-content' tabIndex='-1'>
                            Twitter
                          </span>
                        </a>
                      </li>
                    </ul>
                  </div>
                  <div className='copyright'>
                    Copyright © {new Date().getFullYear()} Eventuate, Inc.
                    <br />
                    © 2013-{new Date().getFullYear()} VMware, Inc.
                    <br />
                    start.spring.io is powered by{' '}
                    <span>
                      <a
                        target='_blank'
                        rel='noopener noreferrer'
                        href='https://github.com/spring-io/initializr/'
                      >
                        Spring Initializr
                      </a>
                    </span>{' '}
                  </div>
                </div>
              </div>
            </div>
          </CSSTransition>
        )}
      </TransitionGroup>
    </>
  )
}

export default SideLeft
