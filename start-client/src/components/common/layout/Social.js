import React from 'react'

import { IconGithub, IconTwitter } from '../icons'

const Social = () => (
  <div className='social'>
    <a
      rel='noreferrer noopener'
      target='_blank'
      href='https://github.com/eventuate-platform/eventuate-platform-dependencies'
    >
      <IconGithub />
    </a>
    <a
      rel='noreferrer noopener'
      target='_blank'
      href='https://twitter.com/eventuateio'
    >
      <IconTwitter />
    </a>
  </div>
)

export default Social
