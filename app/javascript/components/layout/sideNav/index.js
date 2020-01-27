import React, { useState, useContext } from 'react';
import Typography from '@material-ui/core/Typography';
import TextField from '@material-ui/core/TextField';
import Button from '@material-ui/core/Button';
import Autocomplete from '@material-ui/lab/Autocomplete';
import Divider from '@material-ui/core/Divider';
import Select from '@material-ui/core/Select';
import InputLabel from '@material-ui/core/InputLabel';
import MenuItem from '@material-ui/core/MenuItem';
import FormControl from '@material-ui/core/FormControl';
import IconButton from '@material-ui/core/IconButton';
import Close from '@material-ui/icons/Close';

import { Container } from './style';
import { SearchContext } from '../../contexts/SearchContext';

export default function SideNav(){

  const [countries, filters, setFilters] = useContext(SearchContext); 
  const [selectedCountries, setCountries] = useState([]);
  const [priceType, setPriceType] = useState(1);
  const [price, setPrice] = useState('');

  function addCountry(){
    const country = document.querySelector('#countries');
    if(country.value !== '' && !selectedCountries.includes(country.value)){
      setCountries(oldArr => [...oldArr, country.value])
      setFilters(filters => [...filters, country.value])
    }
  }

  function removeCountry(i){
    setCountries(countries => countries.filter((coun, ind) => coun !== i)) 
    setFilters(filters => filters.filter(coun => coun !== i))
  }

  return(
    <Container>
      <div className="price">
        <Typography variant="h6">Price</Typography>
        <FormControl>
          <InputLabel id="price-type">Filter price by</InputLabel>
          <Select
            labelId="price-type"
            id="filter-price-by"
            value={priceType}
            onChange={(e) => setPriceType(e.target.value)}
          >
            <MenuItem value={1}>Less Then</MenuItem>
            <MenuItem value={2}>Equal to</MenuItem>
            <MenuItem value={3}>Greater Than</MenuItem>
          </Select>
        </FormControl>
        <TextField id="price" value={price} onChange={(e) => setPrice(e.target.value)} label="Type Price $" />
        <Button className="apply" variant="outlined" size="small">Apply</Button>
      </div>
      <Divider />
      <div className="country">
        <Typography variant="h6">Country</Typography>
        <div className="country-select">
          <Autocomplete
            id="countries"
            options={countries}
            getOptionLabel={option => option.name}
            style={{ width: 300 }}
            renderInput={params => (
              <TextField {...params} label="Country" fullWidth />
            )}
          />
          <Button className="apply" onClick={addCountry} variant="outlined" size="small">Apply</Button>
          <br />
          <Divider />
          <br />
          { selectedCountries.map((country,i) => 
              <div className="filter-item" key={i}>
                <Typography>{country}</Typography>
                <IconButton color="secondary" onClick={() => removeCountry(country)} aria-label="add an alarm">
                  <Close />
                </IconButton>
              </div>
            )
          }
        </div>
      </div>
    </Container>
  )
};
