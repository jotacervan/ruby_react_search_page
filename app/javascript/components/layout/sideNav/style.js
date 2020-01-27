import styled from 'styled-components';

export const Container = styled.div`
  padding: 10px;
  min-width: 200px;
  height: 100%;
  border-right: 2px solid #cfcfcf;

  .price {
    display: flex;
    flex-direction:column;
  }

  .country{
    display: flex;
    flex-direction:column;
    margin-top:10px;
  }

  .apply{
    margin-top:10px;
    margin-bottom:10px;
  }

  .filter-item{
    display:flex;
    align-items:center;
    justify-content:space-between;
  }
`;
