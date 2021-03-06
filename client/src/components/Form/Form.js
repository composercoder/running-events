import { useState, useEffect, useContext } from 'react';
import { AppContext } from '../App/AppContext';
import createFilterParamsString from '../../controller/createFilterParamsString';

import Input from '../Input/Input';
import Select from '../Select/Select';
import SubmitButton from '../SubmitButton/SubmitButton';

import './Form.css';

function Form() {
  const [appState, dispatch] = useContext(AppContext);

  const [filterParameter, setFilterParameter] = useState({
    id: 'filter-parameter-select',
    selectedOption: 'name'
  });
  const [filterCondition, setFilterCondition] = useState({
    id: 'filter-condition-select',
    selectedOption: 'contains'
  });
  const [filterValue, setFilterValue] = useState('');

  useEffect(() => {
    if (appState.isTimeToCreateFilterParams) {
      createFilterParamsString(true, dispatch, appState.filterParams, appState.tablePageOffset, appState.tablePageSize, filterParameter, filterCondition, filterValue);
    }

  });

  function handleChange(event) {
    switch(event.target.id) {
      case 'filter-parameter-select':
        setFilterParameter({
          id: event.target.id,
          selectedOption: event.target.options[event.target.selectedIndex].id
        });
        break;
      case 'filter-condition-select':
        setFilterCondition({
          id: event.target.id,
          selectedOption: event.target.options[event.target.selectedIndex].id
        });
        break;
      case 'filter-value-input':
        setFilterValue(event.target.value);
    }
  }

  function handleSubmit(event) {
    if (event) {
      event.preventDefault()
    }
    validateInput(filterValue);
    createFilterParamsString({
      onlyChangeOffset: false,
      tablePageOffset: appState.tablePageOffset,
      tablePageSize: appState.tablePageSize,
      prevFilterParams: null,
      newFilterParams: {
        filterParameter,
        filterCondition,
        filterValue
      },
      dispatch
    });
    dispatch({ type: 'setIsTimeToFetchData', payload: true });
  }

  return (
    <form>
      <legend>?????????????????? ????????????????????:</legend>
      <Select id="filter-parameter-select" options={[{id: "name", value: "????????????????"}, {id: "quantity", value: "????????????????????"}, {id: "distance", value: "????????????????????"}]} handleChange={handleChange} />
      <Select id="filter-condition-select" options={[{id: "contains", value: "????????????????"}, {id: "more", value: "????????????"}, {id: "less", value: "????????????"}, {id: "equals", value: "??????????"}]} handleChange={handleChange} />
      <Input id="filter-value-input" value={filterValue} placeholder="????????????????" handleChange={handleChange} />
      <SubmitButton handleSubmit={handleSubmit} />
    </form>
  );
}

function validateInput(inputValue) {
  if (inputValue.match(/^[a-zA-Z??-????-??0-9]{1,30}$/)) {
    return true;
  }
  return false;
}

export default Form;
