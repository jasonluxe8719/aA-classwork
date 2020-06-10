import React from 'react';
import Clock from './clock';
import Tabs from "./tabs";
import Weather from "./weather";
import Autocomplete from "./autocomplete";

const tabs = [
  {
    title: "Tab 1",
    content: "I am the first tab"
  },
  {
    title: "Tab 2",
    content: "Second tab here!"
  },
  {
    title: "Tab 3",
    content: "Last tab!"
  }
];

const names = [
  "Jason",
  "Michael",
  "Joe",
  "Carlos",
  "Julia"
]

const Root = (props) => {
  return (
    <div>
      <Clock />
      <Weather />
      <div className="hgroup">
        <Tabs tabs={ tabs } />
        <Autocomplete names={ names } />
      </div>
    </div>
  );
}

export default Root;
