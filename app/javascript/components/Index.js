import React from 'react';
import { BrowserRouter } from 'react-router-dom';

import { Container } from './style';
import Routes from './Routes';
import TopBar from './layout/topBar';
import SideNav from './layout/sideNav';
import SearchProvider from './contexts/SearchContext';

export default function Index({countries}){
  return (
    <BrowserRouter>
      <SearchProvider countries={countries}>
        <TopBar />
        <Container>
          <SideNav /> 
          <Routes />
        </Container>
      </SearchProvider>
    </BrowserRouter>
  );
}

