import React, { useRef } from 'react';

const LocationBar = (props) => {
    const {tourList} = props;
    // console.log(tourList);
    const hotelListRef=useRef(null);

    ///
    const testHotelListRef=useRef(null);
    ///


    let selectedLocationArray = [];

    const locationSetting=(e)=>{
        e.preventDefault();
        console.log(e.target)
        if (!selectedLocationArray.includes(e.target.id)) {
          selectedLocationArray.push(e.target.id);
          e.target.classList.add('clicked');
  
        }
        else if (selectedLocationArray.includes(e.target.id)) {
          selectedLocationArray.splice(selectedLocationArray.indexOf(e.target.id), 1);
          e.target.classList.remove('clicked');
        }
        console.log(selectedLocationArray)
        testHotelListRef.current.value = selectedLocationArray;
        hotelListRef.current.value = selectedLocationArray;
      }


    return (
        <div>
      
            {tourList.map((location,index)=>(
                <button id={location.code} onClick={locationSetting}>{location.name}</button>
            ))}
            <input type='hidden' id='selectedValue' name="locations" ref={hotelListRef}/>
            <input id="sss" ref={testHotelListRef}></input>
  
        </div>
    );
};

export default LocationBar;