import React from 'react';
import Typography from '@material-ui/core/Typography';

import { Container } from './style';

export default function TopBar(){
  return(
    <Container>
      <Typography component="h1" variant="h4">Spockets</Typography>
    </Container>
  )
};
