import React, { useState, useEffect, useContext } from 'react';
import Typography from '@material-ui/core/Typography';
import TextField from '@material-ui/core/TextField';
import Button from '@material-ui/core/Button';
import Divider from '@material-ui/core/Divider';
import Paper from '@material-ui/core/Paper';
import Swal from 'sweetalert2'

import api from '../../services/api';
import { Container } from './style';
import { SearchContext } from '../../contexts/SearchContext';

export default function Home(){

  const [search, setSearch] = useState(''); 
  const [countries, filters, setFilters] = useContext(SearchContext); 
  const [results, setResults] = useState([]);

  function applySearch(){
    api.post('/search/index', {search, filters}).then(res => 
      setResults(res.data)
    ).catch(res =>
      console.log(res)  
    )
  }

  function openDetails(id){
    const result = results.filter(res => res.id === id)
    Swal.fire({
      title: result[0].title,
      html:
        '<b>Description: </b> ' + result[0].description + '<br />' +
        '<b>Country: </b> ' + result[0].country + '<br />' + 
        '<b>Price: </b>' + formatNumber(result[0].price) + '<br />' +
        '<b>Tags: </b>' + result[0].tags,
     })
  }
  
  function formatNumber(num){
    return new Intl.NumberFormat('en-US', { style: 'currency', currency: 'USD' }).format(num)
  }
 
  useEffect(() => {
    applySearch();
  }, [filters])

  return(
    <Container>
      <TextField id="seach" value={search} onChange={(e) => setSearch(e.target.value)} label="Search by Name, description or tags" fullWidth />
      <Button className="apply" onClick={() => applySearch()} variant="outlined" size="small">Search</Button>
      { results.length > 0 ?
        <>
          <Divider />
          <br />
          { results.map(result =>
            <Paper className="product" onClick={() => openDetails(result.id)} key={result.id}>
              {result.title}
            </Paper>
          ) }
        </>
       : 
        <>
          <Divider />
          <br />
          <Paper className="product">
            <Typography>No products to show</Typography>
          </Paper>
        </>

      }
    </Container>
  )
};
