import React, { useEffect, useRef, useState } from 'react';
import ScrollTop from '../components/ScrollTopmain';
import { GoogleMap, LoadScript, Marker, InfoBox } from '@react-google-maps/api';
import { useHistory } from 'react-router-dom';




const City = (props) => {

  const [hotelList, sethotelList] = useState([]);
  const [tourList, settourList] = useState([]);
  const [startList, setstartList] = useState('');
  


  const search = props.location.search;
  const params = new URLSearchParams(search);
  const name = params.get('city');
  // console.log(name);
  useEffect(() => {
    fetch(`http://localhost:8000/city?city=${name}`, {
      method: 'GET',
      headers: {
        'Content-Type': 'application/json; charset=utf-8',
      },
    })
      .then((response) => {
        console.log(response)
        return response.json();
      })
      .then((response) => {
        sethotelList(response.hotels);
        settourList(response.touristAttraction);
        setstartList(response.startpoint);
        setCenter({lat:response.startpoint.lat,lng:response.startpoint.lng+0.33});
      });
      createho(1);
      
  }, []);


//////////////////////////////////////
//searchbar부분

const startDateRef=useRef(null);
  const endDateRef=useRef(null);
  const hotelButtonRef=useRef(null);

  // console.log(hotelList);

  const hotelListRef= useRef(null);
  const timeListRef=useRef(null);

  // const changeHotelRef = useRef([]);
  const startTimeRef = useRef([]);
  const endTimeRef = useRef([]);
  const hotelRef = useRef([]);
  ///
  const testHotelListRef = useRef(null);
  const testTimeListRef = useRef(null);

  ///
  const daysRef = useRef(null);
  

  const [days, setDays] =useState([0]);
  const [selectedHotelList, setSelectedHotelList] = useState([]);
  const [selectedTimeList, setSelectedTimeList] = useState([]);
  const [selectedTourList, setSelectedTourList] = useState([]);
  
  let today = new Date();
  const [startDate, setStartDate] = useState({
    value: today.getFullYear() + '-' + ('0' + (today.getMonth() + 1)).slice(-2) + '-' + ('0' + (today.getDate() + 1)).slice(-2),
    min: today.getFullYear() + '-' + ('0' + (today.getMonth() + 1)).slice(-2) + '-' + ('0' + (today.getDate() + 1)).slice(-2)
  });
  const [endDate, setEndDate] = useState({
    value: today.getFullYear() + '-' + ('0' + (today.getMonth() + 1)).slice(-2) + '-' + ('0' + (today.getDate() + 2)).slice(-2),
    min: today.getFullYear() + '-' + ('0' + (today.getMonth() + 1)).slice(-2) + '-' + ('0' + (today.getDate() + 2)).slice(-2),
    max: today.getFullYear() + '-' + ('0' + (today.getMonth() + 1)).slice(-2) + '-' + ('0' + (today.getDate() + 7)).slice(-2)
  });
  const [startTime, setStartTime] = useState("10:00")
  const [endTime, setEtartTime] = useState("22:00")

  
  const changeStartDate = (e) => {
    let newDate = new Date(e.target.value);
    newDate.setDate(newDate.getDate() + 1);
    endDateRef.current.value = newDate.getFullYear() + '-' + ('0' + (newDate.getMonth() + 1)).slice(-2) + '-' + ('0' + newDate.getDate()).slice(-2);
    endDateRef.current.min = newDate.getFullYear() + '-' + ('0' + (newDate.getMonth() + 1)).slice(-2) + '-' + ('0' + newDate.getDate()).slice(-2);
    newDate.setDate(newDate.getDate() + 5);
    endDateRef.current.max = newDate.getFullYear() + '-' + ('0' + (newDate.getMonth() + 1)).slice(-2) + '-' + ('0' + newDate.getDate()).slice(-2);

    changeEndDate();
  }

  const changeEndDate =(e)=>{
    let diffDays =(new Date(endDateRef.current.value) - new Date(startDateRef.current.value)) /
        (1000 * 3600 * 24); //ms->sec에 1000 sec->hour에 3600 hour->day에 24
    let daylist=[]
    for(let i=0;i<diffDays;i++){
      daylist.push(i);
    }
    setDays(daylist)
    createho(diffDays)
    daysRef.current.value=diffDays;
    // console.log(diffDays);

  }

  // //일정 시간들이 들어갈 리스트.



  const createho = (number)=> {
    //호텔리스트도 초기화, 시간리스트도 초기화한다.
    let defaultHotelList=[]
    let defaultTimeList = [];

    for (let i = 0; i < number; i++) {
      // createHotoel(i);
      defaultHotelList.push('NO'); //초기화된 호텔리스트에 날짜 수만큼 안골랐음 을 넣는다!
      defaultTimeList.push('13'); //초기화된 시간리스트에 기본값 13시간을 넣는다.
    }

    for (let i=0;i<number;i++){
      if(hotelRef.current[i]&&hotelRef.current[i].value!==""){
        
        defaultHotelList[i]=hotelRef.current[i].value
        
      }
      if(startTimeRef.current[i]&&startTimeRef.current[i].value!==""&&endTimeRef.current[i]&&endTimeRef.current[i].value!==""){
        defaultTimeList[i]=(new Date("1970-01-01 "+endTimeRef.current[i].value)-new Date("1970-01-01 "+startTimeRef.current[i].value))/3600/1000
      }
    }

    setSelectedHotelList(defaultHotelList);
    setSelectedTimeList(defaultTimeList)

    testTimeListRef.current.value = defaultTimeList;
    timeListRef.current.value = defaultTimeList;
    testHotelListRef.current.value = defaultHotelList;
    hotelListRef.current.value = defaultHotelList;
    // $sss.value = 'selectedLocationArray';

  }

  // 	//호텔 선택이 바뀔때마다 적용될 함수
  const changeHotelList=(e,number)=> {
    // console.log(number)
    // console.log(e.target.value);
    // console.log(selectedHotelList);
    let tempList=[...selectedHotelList];
    // for(let i=0;i<selectedHotelList.length;i++){
    //   tempList.push(selectedHotelList[i])
    // }
    // console.log(tempList)
    tempList[number]=e.target.value;
		setSelectedHotelList(tempList)
		testHotelListRef.current.value = tempList;
		hotelListRef.current.value = tempList;
    // hotelRef.current[number].value=e.target.value;
    console.log(selectedHotelList)
	};



  // // const $selected = document.querySelector('#selected');
  // // let $selectedValue = document.querySelector('#selectedValue');
  // const $sss = document.querySelector('#sss');
  // const $hhh = document.querySelector('#hhh');
  // const $selectedHotel = document.querySelector('#selectedHotel');
  // const $ttt = document.querySelector('#ttt');
  // const $timeList = document.querySelector('#timeList');

  // const $startDate = document.querySelector('#startDate');
  // const $endDate = document.querySelector('#endDate');
  // const $days = document.querySelector('#days');
  // let today = new Date();
  // //시작날짜는 다음날부터 받을래.

  //시계관련
  const changeStartTime=(e,number)=>{
    let $startTime=startTimeRef.current[number];
		$startTime.value=e.target.value;
    // console.log(e.target.value)
		changeEndTime(e,number)
	};
  
	const changeEndTime=(e,number)=>{
    console.log(e.target.value)
		let $startTime=startTimeRef.current[number];
		let $endTime=endTimeRef.current[number];
    // $endTime.value=e.target.value;
		if($startTime.value>$endTime.value){
			alert('종료 시간이 시작 시간보다 적을 수 없습니다!');
			$startTime.value="09:00:00";
			$endTime.value="22:00:00";	
			changeTimeList(number);
			return
		}
		if((new Date("1970-01-01 "+$endTime.value)-new Date("1970-01-01 "+$startTime.value))/(3600*1000)<2){
			alert('최소 일정 시간은 2시간 이상입니다')
			$startTime.value="09:00:00";
			$endTime.value="22:00:00";
		}	
		changeTimeList(number);
	}

  const changeTimeList=(number)=>{
    let $startTime=startTimeRef.current[number];
		let $endTime=endTimeRef.current[number];
		let diffTime=(new Date("1970-01-01 "+$endTime.value)-new Date("1970-01-01 "+$startTime.value))/3600/1000
		let tempList = [...selectedTimeList];
    tempList[number] = diffTime;
    setSelectedTimeList(tempList);
    console.log(selectedTimeList)
		testTimeListRef.current.value=tempList;
	  timeListRef.current.value=tempList;
	};


/////////////////////////////////////
/////////////////////////////////////
// MapContainer부분

const [center,setCenter]=useState({lat:37.55477842 ,lng:126.9705761});

const markerRef=useRef([]);
const infoWindowRef=useRef([]);
const infoBoxRef=useRef([]);
const markerMouseEnter=(index)=>{
  // console.log(index);
  // console.log(infoWindowRef.current[index])
  // infoWindowRef.current[index].state.infoWindow.open()
  // console.log(infoWindowRef.current[index].props)
  markerRef.current[index].marker.visible=true
  infoBoxRef.current[index].state.infoBox.isHidden=false
  // infoBoxRef.current[index].props.visible=true
  // infoWindowRef.current[index].props.visible=false
  console.log(infoBoxRef.current[index])
  // infoBoxRef.current[index].style.opacity = 1;
  setCenter({lat:tourList[index].lat,lng:tourList[index].lng})
  // setCenter({markerRef.current[index].marker.})

}
const markerMouseLeave=(e,index)=>{
  // infoWindowRef.current[index].state.infoWindow.close()
  console.log(e.target.id)
  if(!selectedTourList.includes(e.target.id)){
  markerRef.current[index].marker.visible=false}
  // infoBoxRef.current[index].marker.visible=false
  infoBoxRef.current[index].state.infoBox.isHidden=true
  // console.log(markerRef.current[index].marker)
  setCenter({lat:tourList[index].lat,lng:tourList[index].lng})
}


////////////////////////////////////
////////////////////////////////////
// LocationBar부분

// console.log(tourList);
const tourListRef=useRef(null);

///
const testTourListRef=useRef(null);
///



const locationSetting=(e)=>{
    e.preventDefault();
    console.log(e.target)
    let tempList=[...selectedTourList]
    if (!tempList.includes(e.target.id)) {
      tempList.push(e.target.id);
      e.target.classList.add('clicked');
      setSelectedTourList(tempList);

    }
    else if (tempList.includes(e.target.id)) {
      tempList.splice(tempList.indexOf(e.target.id), 1);
      e.target.classList.remove('clicked');
      setSelectedTourList(tempList);
    }
    console.log(tempList)
    testTourListRef.current.value = tempList;
    tourListRef.current.value = tempList;
  }

  const history=useHistory();
  const submitEvent=(e)=>{
    e.preventDefault();

    history.push({
      pathname:"/result",
      state:{
        selectedTimeList:selectedTimeList,
        selectedHotelList:selectedHotelList,
        selectedTourList:selectedTourList,
        city:name,
        days:days.length,
      }
    })
  }


  return (
    <>
      <ScrollTop />
      <div style={{ marginTop: 70 }}> </div>
      <form onSubmit={submitEvent}>

      <div
        style={{
          width: '1000px',
          height: '800px',
          border: '2px solid red',
          display: 'inline-flex',
          textAlign: 'center',
        }}
      >
        <div
          style={{ width: '200px', height: '800px', border: '2px solid green' }}
        >
          
          <div>
            
            <label>시작 날짜를 골라주세요 :</label>
            <input type="date" id="startDate" defaultValue={startDate.value} min={startDate.min} onChange={changeStartDate} ref={startDateRef} />
            <br></br>
            <label>종료 날짜를 골라주세요 :</label>
            <input type="date" id="endDate" defaultValue={endDate.value} min={endDate.min} max={endDate.max} ref={endDateRef} onChange={changeEndDate}/>
            <br/>
            <div id="Hotels" ref={hotelButtonRef}></div>


            <input type='hidden' id='selectedHotel' name="hotels" ref={hotelListRef}/>
            <input type='hidden' name="city" value='seoul'/>
            <input type='hidden'  name='days' ref={daysRef}/>
            <input type='hidden' id='selectedTime' name='timeList' ref={timeListRef}/>

            {days.map((number,i)=>(
              <div key={number+400}>
                <label key={number+500}>{number+1}일차 숙소를 정해주세요</label>
                <select onChange={(e)=>changeHotelList(e,number)} ref={elem=>(hotelRef.current[number]=elem)} key={number+600}>
                  {hotelList.map((hotel,index)=>(<option key={hotel.code} value={hotel.code}>{hotel.name}</option>))}
                </select>
                <label key={number+700}>{number+1}일차 일정 시작 시간을 입력해주세요</label>
                <input type="time" onChange={(e)=>changeStartTime(e,number)} defaultValue="09:00:00"  ref={elem => (startTimeRef.current[number] = elem)} key={number+800}/>
                <label key={number+900}>{number+1}일차 일정 종료 시간을 입력해주세요</label>
                <input type="time" onChange={(e)=>changeEndTime(e,number)} defaultValue="22:00:00"  ref={elem => (endTimeRef.current[number] = elem)} key={number+1000}/>
              </div>
            ))}

            <input id="hhh" ref={testHotelListRef}/>
            <br/>
            <input id="ttt" ref={testTimeListRef}/>
            <br/>
          </div>
          {/* <SearchBar hotelList={hotelList} /> */}
          왼쪽부분
        </div>
        <div
          style={{
            width: '600px',
            height: '800px',
            border: '2px solid orange',
          }}
        >
            <LoadScript
              googleMapsApiKey="InsertYourKey"
            >

              <GoogleMap
                mapContainerStyle={{width: '600px',height: '800px'}}
                center={center}
                zoom={13}
              >
               

                {tourList.map((tour,index)=>
                <span key={index+100}>
                  <Marker
                    icon={"https://developers.google.com/maps/documentation/javascript/examples/full/images/beachflag.png"}
                    position={{lat:tour.lat,lng:tour.lng}}
                    label={tour.name}
                    ref={elem => (markerRef.current[index] = elem)}
                    visible = {false}
                  />
                  <InfoBox
                    position={{lat:tour.lat,lng:tour.lng}}
                    visible={false}
                    ref={elem => (infoBoxRef.current[index] = elem)}
                  >
                    <div style={{ backgroundColor: 'yellow', opacity:1, padding: 12 }} key={tour} >
                      <div style={{ fontSize: 16, fontColor: `#08233B` }} key={index}>
                        {tour.content}
                      </div>
                    </div>
                  </InfoBox>
                </span>
                )}

                

              <></>
              </GoogleMap>
            </LoadScript>
          지도 넣을 부분
        </div>
        <div
          style={{
            width: '200px',
            height: '800px',
            border: '2px solid yellow',
          }}
        >
          {/* <LocationBar tourList={tourList}/> */}
          <div>
      
              {tourList.map((location,index)=>(
                  <button id={location.code} onClick={locationSetting} onMouseEnter={()=>markerMouseEnter(index)} onMouseLeave={(e)=>markerMouseLeave(e,index)} key={index+300}>{location.name}</button>
              ))}
              <input type='hidden' id='selectedValue' name="locations" ref={tourListRef } />
              <input id="sss" ref={testTourListRef}></input>

          </div>
          오른쪽{' '}
        </div>
        
        <button>시작</button>
        <button onClick={((e)=>{
          e.preventDefault();
          setCenter({lat:startList.lat,lng:startList.lng})
        })}>테스트버튼</button>
      </div>

      </form>

    </>
  );
};

export default City;
