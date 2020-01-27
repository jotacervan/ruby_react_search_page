import React, { useReducer, useState, useEffect, createContext } from "react";

export const SearchContext = createContext({});

export default function SearchProvider({ children, countries }) {
  const [countryList, setCountries] = useState(countries);
  const [filters, setFilters] = useState([])

  return (
    <SearchContext.Provider value={[countryList, filters, setFilters]}>
      {children}
    </SearchContext.Provider>
  );
}

