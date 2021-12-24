import React, { useRef, useState } from 'react';

const Searchbar = (props) => {
  const startDateRef=useRef(null);
  const endDateRef=useRef(null);
  const hotelButtonRef=useRef(null);
  const {hotelList} = props;
  // console.log(hotelList);

  const hotelListRef= useRef(null);
  const timeListRef=useRef(null);

  // const changeHotelRef = useRef([]);
  const startTimeRef = useRef([]);
  const endTimeRef = useRef([]);

  ///
  const testHotelListRef = useRef(null);
  const testTimeListRef = useRef(null);

  ///

  const [days, setDays] =useState([0]);
  const [selectedHotelList, setSelectedHotelList] = useState([]);
  const [selectedTimeList, setSelectedTimeList] = useState([]);

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
    // console.log(diffDays);
      //   $days.value = diffDays;

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
    setSelectedHotelList(defaultHotelList);
    setSelectedTimeList(defaultTimeList)
    // testTimeListRef.current.value = defaultHotelList;
    // timeListRef.current.value = selectedTimeList;
    testHotelListRef.current.value = selectedHotelList;
    // hotelListRef.current.value = selectedHotelList;
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
		testHotelListRef.current.value = selectedHotelList;
		// hotelListRef.current.value = selectedHotelList;
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
  
	function changeEndTime(e,number){
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

  function changeTimeList(number) {
    let $startTime=startTimeRef.current[number];
		let $endTime=endTimeRef.current[number];
		let diffTime=(new Date("1970-01-01 "+$endTime.value)-new Date("1970-01-01 "+$startTime.value))/3600/1000
		let tempList = [...selectedTimeList];
    tempList[number] = diffTime;
    setSelectedTimeList(tempList);
    console.log(selectedTimeList)
		testTimeListRef.current.value=selectedTimeList;
	// 	$timeList.value=timeList;
	};



 

 


  return (
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
      <input type='hidden' id='days' name='days'/>
      <input type='hidden' id='selectedTime' name='timeList' ref={timeListRef}/>

      {days.map((number,i)=>(
        <div>
          <label>{number+1}일차 숙소를 정해주세요</label>
          <select onChange={(e)=>changeHotelList(e,number)}>
            {hotelList.map((hotel,index)=>(<option key={hotel.code} value={hotel.code}>{hotel.name}</option>))}
          </select>
          <label>{number+1}일차 일정 시작 시간을 입력해주세요</label>
     		  <input type="time" onChange={(e)=>changeStartTime(e,number)}  ref={elem => (startTimeRef.current[number] = elem)}/>
     		  <label>{number+1}일차 일정 종료 시간을 입력해주세요</label>
     		  <input type="time" onChange={(e)=>changeEndTime(e,number)}  ref={elem => (endTimeRef.current[number] = elem)}/>
        </div>
      ))}

      <input id="hhh" ref={testHotelListRef}/>
      <br/>
      <input id="ttt" ref={testTimeListRef}/>
      <br/>
    </div>
  );
};

export default Searchbar;
